-----------------------------------------------------------
-- Autor: 
-- Fecha: 04/25/2025
-----------------------------------------------------------

USE [Soltura]

-- -------------------------
-- DEADLOCK
-- -------------------------

DROP PROCEDURE if EXISTS dbo.ObtenerTransaccionUltCanje;

-- Con UPDATE cambia el estado del codigo de canje a que esta PROCESSING, cambiar el status. Usar un SELECT para revisar el transactionid del canje
GO
CREATE PROCEDURE dbo.ObtenerTransaccionUltCanje
    @username VARCHAR(30),
    @partnername VARCHAR(60),
	@methodname VARCHAR(50),
	@transactionId BIGINT OUTPUT 
AS 
BEGIN
    SET NOCOUNT ON
    
    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
    DECLARE @Message VARCHAR(200)
    DECLARE @InicieTransaccion BIT
    
	DECLARE @userid int;
	DECLARE @partnerid int;
	DECLARE @methodid tinyint;
	-- Se obtiene el userid vinculado al username ingresado
	SELECT @userid = userid
	FROM Solt_Users
	WHERE username = @username;
	IF @userid IS NULL
		THROW 50001, 'El usuario no existe', 1  -- Envia un codigo y mensaje de error custom
	-- Se obtiene el partnerid vinculado al partnername ingresado
	SELECT @partnerid = partnerid
	FROM Solt_Partners
	WHERE name = @partnername;
	IF @partnerid IS NULL
		THROW 50002, 'El proveedor no existe', 2  -- Envia un codigo y mensaje de error custom
	-- Se obtiene el methodid vinculado al methodname ingresado
	SELECT @methodid = methodid
	FROM Solt_RedemptionMethod
	WHERE name = @methodname;
	IF @methodid IS NULL
		THROW 50003, 'El metodo de canje no existe', 3  -- Envia un codigo y mensaje de error custom

    SET @InicieTransaccion = 0
    IF @@TRANCOUNT = 0 BEGIN
        SET @InicieTransaccion = 1
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED
        BEGIN TRANSACTION       
    END
    
    BEGIN TRY
        SET @CustomError = 3002

        UPDATE Solt_RedemptionCodes
        SET redemptionStatusid = 2                  -- Suponga que 2 es un estado de PROCESSING
        WHERE methodid = @methodid AND userid = @userid AND GETDATE()<expirationTime;

        WAITFOR DELAY '00:00:05'; -- Simulacion de concurrencia

        -- Luego hacemos el SELECT en Solt_RedemptionDetails (bloquea Solt_Transactions)
        SELECT @transactionId = rd.transactionid
        FROM Solt_RedemptionDetails rd
        INNER JOIN (
			SELECT TOP 1 transactionId 
			FROM Solt_Transactions 
			WHERE userid = @userid
			ORDER BY postTime DESC
		) tr ON tr.transactionId = rd.transactionid
        WHERE rd.partnerid = @partnerid;

		IF @transactionId IS NULL
            THROW 50004, 'No se encontró una transacción reciente', 4;

        IF @InicieTransaccion = 1 BEGIN
            COMMIT
        END
    END TRY
    BEGIN CATCH
        SET @ErrorNumber = ERROR_NUMBER()
        SET @ErrorSeverity = ERROR_SEVERITY()
        SET @ErrorState = ERROR_STATE()
        SET @Message = ERROR_MESSAGE()
        
        IF @InicieTransaccion = 1 BEGIN
            ROLLBACK
        END
        
        RAISERROR('%s - Error Number: %i', 
            @ErrorSeverity, @ErrorState, @Message, @CustomError)
    END CATCH   
END
GO

DECLARE @transactionId BIGINT;
EXEC ObtenerTransaccionUltCanje @username = 'Juan', @partnername = 'SmartFit', @methodname = 'QrCode', @transactionId = @transactionId OUTPUT;

-- -------------------------
-- DEADLOCK CASCADA
-- -------------------------

DROP PROCEDURE if EXISTS dbo.MarcarSalidaGrupo;

-- Con UPDATE cambia el estado del codigo de canje a que esta PROCESSING, cambiar el status. Usar un SELECT para revisar el transactionid del canje
GO
CREATE PROCEDURE dbo.MarcarSalidaGrupo
    @username VARCHAR(30)
AS 
BEGIN
    SET NOCOUNT ON
    
    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
    DECLARE @Message VARCHAR(200)
    DECLARE @InicieTransaccion BIT
    
	DECLARE @userid int;
	DECLARE @userGroupid int;
	-- Se obtiene el userid vinculado al username ingresado
	SELECT @userid = userid
	FROM Solt_Users
	WHERE username = @username;
	IF @userid IS NULL
		THROW 50001, 'El usuario no existe', 1  -- Envia un codigo y mensaje de error custom

    SET @InicieTransaccion = 0
    IF @@TRANCOUNT = 0 BEGIN
        SET @InicieTransaccion = 1
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED
        BEGIN TRANSACTION       
    END
    
    BEGIN TRY
        SET @CustomError = 3002

		-- Se obtiene el id del grupo
		SELECT @userGroupid = userGroupid
        FROM Solt_UserPerGroup
        WHERE userid = @userid;

        IF @userGroupid IS NULL
            THROW 50005, 'El grupo no existe', 2;

		-- Se actualiza la fecha de salida a la actual
		UPDATE Solt_UserPerGroup
        SET exitDate = GETDATE(), enabled = 0
        WHERE userid = @userid; -- AND userGroupid = @userGroupid;
		
        WAITFOR DELAY '00:00:05'; -- Simulacion de concurrencia
		-- Se actualizan los datos de modificacion
		UPDATE Solt_UserGroups
        SET modificationDesc = 'Salida del usuario ' + @username, modification = GETDATE()
        WHERE userGroupid = @userGroupid;

        IF @InicieTransaccion = 1 BEGIN
            COMMIT
        END
    END TRY
    BEGIN CATCH
        SET @ErrorNumber = ERROR_NUMBER()
        SET @ErrorSeverity = ERROR_SEVERITY()
        SET @ErrorState = ERROR_STATE()
        SET @Message = ERROR_MESSAGE()
        
        IF @InicieTransaccion = 1 BEGIN
            ROLLBACK
        END
        
        RAISERROR('%s - Error Number: %i', 
            @ErrorSeverity, @ErrorState, @Message, @CustomError)
    END CATCH   
END
GO

EXEC MarcarSalidaGrupo @username = 'Juan';