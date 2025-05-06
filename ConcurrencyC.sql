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

    SET @InicieTransaccion = 0
    IF @@TRANCOUNT = 0 BEGIN
        SET @InicieTransaccion = 1
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED
        BEGIN TRANSACTION       
    END
    
    BEGIN TRY
        SET @CustomError = 3005

		-- Se obtiene el id del grupo
		SELECT @userGroupid = userGroupid
        FROM Solt_UserPerGroup
        WHERE userid = @userid;
        IF @userGroupid IS NULL
            THROW 50006, 'El usuario no está en un grupo', 2;
	
		-- Se obtiene el id del duenno del grupo
		SELECT @userid = groupOwner
		FROM Solt_UserGroups
		WHERE userGroupid = @userGroupid;

        WAITFOR DELAY '00:00:05'; -- Simulación de concurrencia

        -- Se actualiza el username del duenno del grupo para indicar su status.
        UPDATE Solt_Users
        SET username = username+'(Owner)' 
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

EXEC AsignarUsernameDuennoGrupo @username = 'ElenaSilR45';

SELECT * FROM Solt_Users;