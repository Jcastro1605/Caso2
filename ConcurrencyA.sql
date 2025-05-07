-----------------------------------------------------------
-- Autor: 
-- Fecha: 04/25/2025
-----------------------------------------------------------

USE [Soltura]

-- -------------------------
-- DEADLOCK
-- -------------------------

DROP PROCEDURE if EXISTS dbo.ActualizarDireccionUltCanje;

-- Ingresar usuario y actualizar la direccion de su ultimo canjeo a partir del zipcode, luego hacemos un update forzado en redemptiondetails para ver el deadlock
GO
CREATE PROCEDURE dbo.ActualizarDireccionUltCanje
    @username    VARCHAR(30),
    @newZipcode  VARCHAR(9)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @userid INT,
            @newAdressid INT,
            @InicieTransaccion BIT = 0;

    -- Se obtiene el userid y el addressid
    SELECT @userid = userid FROM Solt_Users WHERE username = @username;
    IF @userid IS NULL 
        THROW 50001, 'El usuario no existe', 1;

    SELECT @newAdressid = adressid FROM Solt_Adresses WHERE zipcode = @newZipcode;
    IF @newAdressid IS NULL 
        THROW 50002, 'La dirección no existe', 2;

    IF @@TRANCOUNT = 0
    BEGIN
         SET @InicieTransaccion = 1;
         SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
         BEGIN TRANSACTION;
    END

    BEGIN TRY
         -- Actualizar la dirección en la que se realizo el ultimo canje
         UPDATE Solt_RedemptionDetails
         SET addressid = @newAdressid
         WHERE transactionid = (
               SELECT TOP 1 transactionId
               FROM Solt_Transactions 
               WHERE userid = @userid
               ORDER BY postTime DESC
         );

         WAITFOR DELAY '00:00:08';  -- Se usa para simular concurrencia

         -- Forzar un UPDATE que no cambia el valor
         UPDATE Solt_RedemptionCodes
         SET redemptionStatusid = redemptionStatusid
         WHERE userid = @userid 
           AND GETDATE() < expirationTime;

         IF @InicieTransaccion = 1 
             COMMIT;
    END TRY
    BEGIN CATCH
         IF @InicieTransaccion = 1 
             ROLLBACK;
         THROW;
    END CATCH;
END;
GO

EXEC dbo.ActualizarDireccionUltCanje @username = 'djiménez', @newZipcode = '28010';

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
