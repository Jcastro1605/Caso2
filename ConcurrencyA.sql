-----------------------------------------------------------
-- Autor: 
-- Fecha: 04/25/2025
-----------------------------------------------------------

USE [Soltura]

-- -------------------------
-- DEADLOCK
-- -------------------------

DROP PROCEDURE if EXISTS dbo.ActualizarDireccionUltCanje;

-- Ingresar usuario y revisar que el codigo exista SELECT, que el id este dentro de redemptionCode, luego hacemos un update con la nueva adressid para redemptiondetails
GO
CREATE PROCEDURE dbo.ActualizarDireccionUltCanje
    @username VARCHAR(30),
    @newZipcode VARCHAR(9)
AS 
BEGIN
    SET NOCOUNT ON
    
    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
    DECLARE @Message VARCHAR(200)
    DECLARE @InicieTransaccion BIT

	DECLARE @userid int;
	DECLARE @redemptionCodeid int;
	DECLARE @newAdressid int;
	-- Se obtiene el userid vinculado al username ingresado
	SELECT @userid = userid
	FROM Solt_Users
	WHERE username = @username;
	IF @userid IS NULL
			THROW 50001, 'El usuario no existe', 1  -- Envia un codigo y mensaje de error custom
	-- Se obtiene el adressid vinculado al zipcode ingresado
	SELECT @newAdressid = adressid
	FROM Solt_Adresses
	WHERE zipcode = @newZipcode;
	IF @newAdressid IS NULL
			THROW 50002, 'La direccion no existe', 2  -- Envia un codigo y mensaje de error custom

    SET @InicieTransaccion = 0
    IF @@TRANCOUNT = 0 BEGIN
        SET @InicieTransaccion = 1
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED
        BEGIN TRANSACTION       
    END
    
    BEGIN TRY
        SET @CustomError = 3001

		-- Se obtiene el redemptioncodeid vinculado al userid
	 
		SELECT @redemptionCodeid = redemptionCodeid
		FROM Solt_RedemptionCodes
		WHERE userid = @userid AND GETDATE()<expirationTime;
	
		IF @redemptionCodeid IS NULL
			THROW 50003, 'El usuario no tiene método de canjeo disponible', 3  -- Envia un codigo y mensaje de error custom

        WAITFOR DELAY '00:00:05'; -- Simulación de concurrencia
        
        -- Se actualiza la ubicacion con el nuevo adress
        UPDATE rd
        SET addressid = @newAdressid
		FROM Solt_RedemptionDetails rd
		INNER JOIN (
			SELECT TOP 1 transactionId 
			FROM Solt_Transactions 
			WHERE userid = @userid
			ORDER BY postTime DESC
		)tr ON tr.transactionId = rd.transactionid;

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
RETURN 0
GO

EXEC ActualizarDireccionUltCanje @username = 'Juan', @newZipcode = '20102';

-- -------------------------
-- DEADLOCK CASCADA
-- -------------------------

DROP PROCEDURE if EXISTS dbo.ActualizarUsuarioEnGrupo;

-- Revisa el estado actual del usuario y lo desactiva o activa del grupo de acuerdo al caso
GO
CREATE PROCEDURE dbo.ActualizarUsuarioEnGrupo
    @username VARCHAR(30),
	@enabled BIT
AS 
BEGIN
    SET NOCOUNT ON
    
    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
    DECLARE @Message VARCHAR(200)
    DECLARE @InicieTransaccion BIT

	DECLARE @userid INT;

    SET @InicieTransaccion = 0
    IF @@TRANCOUNT = 0 BEGIN
        SET @InicieTransaccion = 1
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED
        BEGIN TRANSACTION       
    END
    
    BEGIN TRY
        SET @CustomError = 3003

		-- Se obtiene el id del usuario consultado
		SELECT @userid = userid
		FROM Solt_Users
		WHERE username = @username;
		IF @userid IS NULL
			THROW 50001, 'El usuario no existe', 1  -- Envia un codigo y mensaje de error custom

		-- Se reactiva el usuario al cambiar su estado dentro de los grupos
		UPDATE Solt_Users
        SET enabled = 1
        WHERE userid = @userid;
	
        WAITFOR DELAY '00:00:05'; -- Simulación de concurrencia
        
        -- Se actualiza el estado del usuario dentro del grupo
        UPDATE Solt_UserPerGroup
        SET enabled = @enabled
		WHERE userid = @userid;

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
RETURN 0
GO

EXEC ActualizarUsuarioEnGrupo @username = 'Juan', @enabled = 1;