----------------------------------------------------------------------
-- Autores: Julián Castro, Lindsay Marín, Elías Ramírez, Andrés Zuñiga
-- Fecha: 05/05/2025
-- Descripcion: Renovación manual de una suscripción mensual existente
-- Se debe pasar el username y el currency de la transacción
----------------------------------------------------------------------
CREATE PROCEDURE [dbo].[SoltSP_RenovarSuscripcion]
	@Username VARCHAR(30),
	@Currency VARCHAR(50)
AS 
BEGIN
	SET NOCOUNT ON

	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT
	DECLARE @Monto DECIMAL(10,2)
	DECLARE @Scheduleid INT
	DECLARE @Userid INT
	DECLARE @Currencyid INT

	SELECT @Currencyid = currencyid FROM Solt_Currencies WHERE @Currency = name
	SELECT @Monto = SP.price, @Scheduleid = SD.scheduleid, @Userid = userid
	FROM Solt_SubscriptionPrices SP 
	INNER JOIN Solt_Subscriptions S ON SP.subscriptionid = S.subscriptionid
	INNER JOIN Solt_PlansPerGroup PPG ON PPG.subscriptionid = S.subscriptionid
	INNER JOIN Solt_UserGroups UG ON UG.userGroupid = PPG.userGroupid
	INNER JOIN Solt_Users U ON U.userid = UG.userGroupid
	INNER JOIN Solt_Schedules SD ON SD.scheduleid = PPG.scheduleid
	WHERE U.username = @Username

	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001

		UPDATE Solt_Users SET enabled = 1 WHERE userid = @Userid;
		INSERT INTO Solt_ScheduleDetails VALUES
		(@Scheduleid, 1, '1900-01-01 00:00:00', 'MM', GETDATE(), DATEADD(MONTH, 1, GETDATE())); -- 1900-01-01 00:00:00 es la baseDate
		INSERT INTO Solt_Transactions VALUES 
		(1,@Monto, @Userid, NULL, 'Renovación manual de suscripción', GETDATE(), GETDATE(), NULL, NULL, @Currencyid, NULL, NULL, NULL);
		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		-- en esencia, lo que hay  que hacer es registrar el error real, y enviar para arriba un error custom 
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		-- el error original lo inserte en la tabla de logs, pero retorno a la capa superior un error en "bonito"
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError) -- hay que sustituir el @message por un error personalizado bonito, lo ideal es sacarlo de sys.messages 
		-- en la tabla de sys.messages se pueden insertar mensajes personalizados de error, los cuales se les hace match con el numero en @CustomError
	END CATCH	
END
RETURN 0
GO