-----------------------------------------------------------
-- Autor: 
-- Fecha: 04/30/2025
-----------------------------------------------------------

USE [Soltura]

-- -------------------------
-- READ UNCOMITTED
-- -------------------------
DROP PROCEDURE if EXISTS dbo.RankingPorCanjeos;
-- Ver los logs de redeems. LogType = Redeems(8)
-- Se utiliza READ UNCOMITTED en la tabla de logs para obtener los registros facilmente, sin necesidad de esperar que otras transacciones terminen.
GO
CREATE PROCEDURE dbo.RankingPorCanjeos
AS 
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT;
    DECLARE @Message VARCHAR(200);
    DECLARE @InicieTransaccion BIT;

	DECLARE @logTypeid TINYINT;
	-- Se obtiene el id de LogTypes asociado a los redeems
	SELECT @logTypeid = logTypeId
    FROM Solt_LogTypes
    WHERE name = 'Redeems';

    SET @InicieTransaccion = 0;
    IF @@TRANCOUNT = 0 
    BEGIN
        SET @InicieTransaccion = 1;
        SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
        BEGIN TRANSACTION;      
    END
    
    BEGIN TRY
        SET @CustomError = 3006;

		-- Se obtiene el ranking de usuarios según los redeems registrados en el LogRedeems
        SELECT u.username,
            COALESCE(COUNT(
			CASE 
				WHEN l.logtypeid = @logtypeid THEN l.logid
				ELSE NULL                     -- Se usa una condicion para solo contar los logs que son de Redeem
			END), 0) AS CantidadRedeems       -- Se coloca en 0 si no tiene logs de este tipo
        FROM Solt_Users u
        LEFT JOIN Solt_Log l ON u.username = l.username
        GROUP BY u.username
        ORDER BY COUNT(l.logId) DESC

        IF @InicieTransaccion = 1 
        BEGIN
            COMMIT;
        END
    END TRY
    BEGIN CATCH
        SET @ErrorNumber   = ERROR_NUMBER();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState    = ERROR_STATE();
        SET @Message       = ERROR_MESSAGE();

        IF @InicieTransaccion = 1 
        BEGIN
            ROLLBACK;
        END

        RAISERROR('%s - Error Number: %i', @ErrorSeverity, @ErrorState, @Message, @CustomError);
    END CATCH;  
END
RETURN 0;
GO

EXEC RankingPorCanjeos;

-- -------------------------
-- READ COMITTED
-- -------------------------
DROP PROCEDURE if EXISTS dbo.ConvertirMonedaTransacciones;

-- Convierte todas las transacciones de un usuario a la moneda destino
-- Se utiliza READ COMITTED para unicamente tomar en cuenta las transacciones ya registradas en el sistema.
GO
CREATE PROCEDURE dbo.ConvertirMonedaTransacciones
    @username VARCHAR(30),    
    @destinationCurrencySymb VARCHAR(5)
AS 
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT;
    DECLARE @Message VARCHAR(200);
    DECLARE @InicieTransaccion BIT;
    
	DECLARE @userid INT;
	DECLARE @destinationCurrencyid INT;
    DECLARE @totalAmount FLOAT;
    -- Se obtiene el id del usuario consultado
	SELECT @userid = userid
	FROM Solt_Users
	WHERE username = @username;
	IF @userid IS NULL
		THROW 50001, 'El usuario no existe', 1  -- Envia un codigo y mensaje de error custom

	-- Se obtiene el id de la moneda segun el simbolo ingresado.
	SELECT @destinationCurrencyid = currencyid
	FROM Solt_Currencies
	WHERE symbol = @destinationCurrencySymb;
	IF @userid IS NULL
		THROW 50008, 'La moneda no existe', 2  -- Envia un codigo y mensaje de error custom

    SET @InicieTransaccion = 0;
    IF @@TRANCOUNT = 0
    BEGIN
        SET @InicieTransaccion = 1;
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
        BEGIN TRANSACTION;      
    END
    
    BEGIN TRY
        SET @CustomError = 3007;
     
	  -- Calcular la suma de todas las transacciones en la moneda indicada
	  -- Es posible que la tasa de cambio dependa del momento en el que se realiza la transaccion debido al READ COMITTED. 
        SELECT @totalAmount = SUM(COALESCE(amount, 0) * 
		CASE 
			WHEN tr.currencyId = @destinationCurrencyid THEN 1  -- Si la moneda de la transacción ya es la de destino, no se convierte
			ELSE COALESCE(cc.exchangeRate, 1)                   -- Si no hay exchangeRate válido, se deja la moneda igual
		END) 
        FROM Solt_Transactions tr
        INNER JOIN Solt_CurrencyConversions cc ON tr.currencyId = cc.source_currencyid
        WHERE tr.userId = @userid AND cc.destination_currencyid = @destinationCurrencyid AND cc.isCurrent = 1;
     
		SELECT @username AS Usuario, @destinationCurrencySymb AS MonedaDestino, COALESCE(@totalAmount, 0) AS TotalConvertido; 

        IF @InicieTransaccion = 1
        BEGIN
            COMMIT;
        END
    END TRY
    BEGIN CATCH
        SET @ErrorNumber   = ERROR_NUMBER();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState    = ERROR_STATE();
        SET @Message       = ERROR_MESSAGE();
     
        IF @InicieTransaccion = 1
        BEGIN
            ROLLBACK;
        END
     
        RAISERROR('%s - Error Number: %i', 
                  @ErrorSeverity, @ErrorState, @Message, @CustomError);
    END CATCH   
END
RETURN 0;
GO

EXEC ConvertirMonedaTransacciones @username = 'ElenaSilR45', @destinationCurrencySymb = '$';


-- -------------------------
-- REPEATABLE READ
-- -------------------------

DROP PROCEDURE IF EXISTS dbo.InsertarFullModernFamilyPlan;

-- Transaccion para insertar un nuevo plan tipo Full Modern Family para un grupo, la transaccion solo puede realizarse si el usuario es groupOwner.
-- Se utiliza REPEATABLE READ para garantizar que ningún otro proceso pueda actualizar los datos de la suscripcion que se esta adquiriendo.

GO
CREATE PROCEDURE dbo.InsertarFullModernFamilyPlan
	@username VARCHAR(30),
	@scheduleid INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT;
    DECLARE @Message VARCHAR(200);
    DECLARE @InicieTransaccion BIT;

    DECLARE @userid INT;
	DECLARE @userGroupid INT;
	DECLARE @groupOwnerid INT;
	DECLARE @subscriptionid INT;
	-- Se obtiene el id del usuario consultado
	SELECT @userid = userid
	FROM Solt_Users
	WHERE username = @username;
	IF @userid IS NULL
		THROW 50001, 'El usuario no existe', 1  -- Envia un codigo y mensaje de error custom

	-- Se obtiene el id del grupo asociado al usuario
	SELECT @userGroupid = userGroupid
	FROM Solt_UserPerGroup
	WHERE userid = @userid;
	IF @userGroupid IS NULL
        THROW 50006, 'El usuario no está en un grupo', 2;
    
	-- Se verifica que el usuario sea el owner del grupo al que pertenece.
    SELECT @groupOwnerid = groupOwner
    FROM Solt_UserGroups
    WHERE userGroupid = @userGroupid;
    IF @groupOwnerid <> @userid
        THROW 50010, 'El usuario no es el propietario del grupo', 3;

	-- Se obtiene el ID de la subscripcion Full Modern Family
	SELECT @subscriptionid = subscriptionid
    FROM Solt_Subscriptions
    WHERE name = 'Full Modern Family';

    -- Iniciar transaccion con REPEATABLE READ
    SET @InicieTransaccion = 0;
    IF @@TRANCOUNT = 0 
    BEGIN
        SET @InicieTransaccion = 1;
        SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
        BEGIN TRANSACTION;      
    END

    BEGIN TRY
        SET @CustomError = 3008;

        -- Insertar el nuevo plan "Full Modern Family" para el grupo con un horario previamente seleccionado.	  
		-- El REPEATABLE READ detiene actualizaciones de tablas dependientes hasta que se termine la transaccion. 
        INSERT INTO Solt_PlansPerGroup(acquisitionDate, subscriptionid, userGroupid, enabled, scheduleid)
        VALUES (GETDATE(), @subscriptionid, @userGroupid, 1, @scheduleid);

        IF @InicieTransaccion = 1
        BEGIN
            COMMIT;
        END
    END TRY
    BEGIN CATCH
        SET @ErrorNumber   = ERROR_NUMBER();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState    = ERROR_STATE();
        SET @Message       = ERROR_MESSAGE();

        IF @InicieTransaccion = 1
        BEGIN
            ROLLBACK;
        END

        RAISERROR('%s - Error Number: %i', 
                  @ErrorSeverity, @ErrorState, @Message, @CustomError);
    END CATCH
END
RETURN 0;
GO

EXEC InsertarFullModernFamilyPlan @username = 'ElenaSilR45', @scheduleid = 2;

-- -------------------------
-- SERIALIZABLE
-- -------------------------

DROP PROCEDURE IF EXISTS dbo.CambiarPrecioSuscripcion;

-- Transaccion para actualizar el precio de un plan.
-- Se utiliza SERIALIZABLE para garantizar que nadie pueda comprar una suscripcion mientras se da la actualizacion 
GO
CREATE PROCEDURE dbo.CambiarPrecioSuscripcion
    @suscriptionName VARCHAR(50),
    @newPrice DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorNumber INT, 
            @ErrorSeverity INT, 
            @ErrorState INT, 
            @CustomError INT;
    DECLARE @Message VARCHAR(200);
    DECLARE @InicieTransaccion BIT;

	DECLARE @subscriptionid INT;

	SELECT @subscriptionid = subscriptionid
	FROM Solt_Subscriptions
	WHERE name = @suscriptionName;
	IF @subscriptionid IS NULL
        THROW 50012, 'La suscripcion no existe', 1;

    SET @InicieTransaccion = 0;
    IF @@TRANCOUNT = 0 
    BEGIN
        SET @InicieTransaccion = 1;
        SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
        BEGIN TRANSACTION;
    END

    BEGIN TRY
        SET @CustomError = 4002;

        -- Actualizar el precio del plan
		-- Bloquea cualquier tipo de inserciones en planes de suscripcion cuando se hace cambio de precio
        UPDATE Solt_SubscriptionPrices
        SET price = @newPrice, postDate = GETDATE()
        WHERE subscriptionid = @subscriptionid;


        IF @InicieTransaccion = 1
        BEGIN
            COMMIT;
        END
    END TRY
    BEGIN CATCH
        SET @ErrorNumber   = ERROR_NUMBER();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState    = ERROR_STATE();
        SET @Message       = ERROR_MESSAGE();

        IF @InicieTransaccion = 1
        BEGIN
            ROLLBACK;
        END

        RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError);
    END CATCH
END
RETURN 0;
GO

EXEC CambiarPrecioSuscripcion @suscriptionName = 'Full Modern Family', @newPrice = 40.0;





