-----------------------------------------------------------
-- Autor: 
-- Fecha: 04/25/2025
-----------------------------------------------------------

USE [Soltura]

-- -------------------------
-- DEADLOCK CASCADA
-- -------------------------
DROP PROCEDURE if EXISTS dbo.AsignarUsernameDuennoGrupo;

-- Busca el grupo al que pertenece el usuario y lo convierte en duenno de ese mismo grupo
GO
CREATE PROCEDURE dbo.AsignarUsernameDuennoGrupo
    @username VARCHAR(30)
AS 
BEGIN
    SET NOCOUNT ON
    
    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
    DECLARE @Message VARCHAR(200)
    DECLARE @InicieTransaccion BIT

	DECLARE @userid INT;
	DECLARE @userGroupid int;

	-- Se obtiene el id del usuario consultado
	SELECT @userid = userid
	FROM Solt_Users
	WHERE username = @username;
	IF @userid IS NULL
		THROW 50001, 'El usuario no existe', 1  -- Envia un codigo y mensaje de error custom

	SELECT @userGroupid = userGroupid
    FROM Solt_UserPerGroup
    WHERE userid = @userid;
    IF @userGroupid IS NULL
        THROW 50006, 'El usuario no esta en un grupo', 2;

    SET @InicieTransaccion = 0
    IF @@TRANCOUNT = 0 BEGIN
        SET @InicieTransaccion = 1
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED
        BEGIN TRANSACTION       
    END
    
    BEGIN TRY
        SET @CustomError = 3005

		UPDATE Solt_UserGroups
         SET modificationDesc = modificationDesc + ' '
         WHERE userGroupid = @userGroupid;

         WAITFOR DELAY '00:00:06'; -- Simula concurrencia

         -- Paso 2: Actualiza Solt_Users (actualiza el username del dueño)
         UPDATE Solt_Users
         SET username = CASE 
                           WHEN username NOT LIKE '%(Owner)%' 
                           THEN username + '(Owner)' 
                           ELSE username 
                        END
         WHERE userid = (
             SELECT groupOwner 
             FROM Solt_UserGroups 
             WHERE userGroupid = @userGroupid
         );

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

UPDATE Solt_Users
SET username = 'djiménez'
WHERE userid = 1;

EXEC AsignarUsernameDuennoGrupo @username = 'djiménez';

 SELECT * FROM Solt_Users;
