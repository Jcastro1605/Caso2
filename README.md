# Caso2
Entregable para el caso 2 del curso de Bases de Datos I


# Mantenimiento de la Seguridad  
Primero crearemos los inicios de sesión para los usuarios.  
![image](https://github.com/user-attachments/assets/1a046298-217c-4e09-9fba-9d02a5506e04)  
Utilizaremos autenticación SQL sin certificado o clave asimétrica.  
![image](https://github.com/user-attachments/assets/ddae6ae4-3835-4d07-8bd5-aae47ed3775b)  
Crearemos 3 inicios de sesión.  
![image](https://github.com/user-attachments/assets/00812610-25c4-41ad-abb2-6d4e7837662c)  
Ahora crearemos 3 usuarios en la base de datos de Soltura para los inicios de sesión que creamos.  
```sql
USE Soltura

CREATE USER ALaura FOR LOGIN [Alaura01]
CREATE USER MAntonio FOR LOGIN [Mantonio23]
CREATE USER JSofia FOR LOGIN [Jsofia44]
CREATE USER Pasante FOR LOGIN [Pasante]
```
## Mostrar cómo permitir o denegar acceso a la base de datos, del todo poder verla o no, poder conectarse o no  
Al usuario pasante no le permitiremos ver las bases de datos.  
```sql
USE master
DENY VIEW ANY DATABASE TO Pasante
```
![image](https://github.com/user-attachments/assets/c1efba40-9276-46b7-8349-9a2f7f94fe3f)  
Como otra alternativa le quitaremos la conexión a Pasante en vez de la visibilidad de la base de datos.  
```sql
USE Soltura
DENY CONNECT TO Pasante
```
![image](https://github.com/user-attachments/assets/45a3f7e9-8061-46ad-9776-7fc17afac864)  
## Conceder solo permisos de SELECT sobre una tabla a un usuario específico. Será posible crear roles y que existan roles que si puedan hacer ese select sobre esa tabla y otros Roles que no puedan? Demuestrelo con usuarios y roles pertinentes.  
Vamos a crear un rol para usuarios de soporte técnico, los cuales tendrán acceso a toda la base de datos con la excepción de las tablas referentes al modelo de transacciones. Vamos añadir uno de nuestros usuarios a dicho rol.  
```sql
USE Soltura
CREATE ROLE SoporteTecnico
DENY SELECT ON dbo.Solt_Transactions TO SoporteTecnico
DENY SELECT ON dbo.Solt_PaymentAttempts TO SoporteTecnico
DENY SELECT ON dbo.Solt_TransactionSubTypes TO SoporteTecnico
DENY SELECT ON dbo.Solt_TransactionTypes TO SoporteTecnico
ALTER ROLE SoporteTecnico ADD MEMBER ALaura
```
![image](https://github.com/user-attachments/assets/c1ca6f9e-5843-41aa-8271-3c6bc3233aee)  
Ahora vamos a crear un rol para los analistas de negocios que solo tienen permisos de select en toda la base de datos y añadiremos un usuario a dicho rol.  
```sql
USE Soltura
CREATE ROLE AnalistaNegocios
DENY INSERT, UPDATE, DELETE TO AnalistaNegocios
GRANT SELECT TO AnalistaNegocios
ALTER ROLE AnalistaNegocios ADD MEMBER MAntonio
```
-- FALTA RLS
## Certificado de llave asimétrico y simétrico  
```sql
USE Soltura
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'ClaveConfidencial'

CREATE CERTIFICATE CertGeneral -- Crea automáticamente la llave asimétrica protegida por la llave maestra
WITH SUBJECT = 'Certificado general de la base de datos'

CREATE SYMMETRIC KEY DataEncryption 
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE CertGeneral
```
## Crear un SP que descifre los datos protegidos usando las llaves anteriores.
Aqui se presenta el Stored Procedure para desencriptar un dato encriptado.  
```sql
CREATE PROCEDURE dbo.DesencriptarDatos
    @DatosEncriptados VARBINARY(MAX),
    @DatosDesencriptados NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;
        OPEN SYMMETRIC KEY DataEncryption
        DECRYPTION BY CERTIFICATE CertGeneral;
        SELECT @DatosDesencriptados = CONVERT(NVARCHAR(MAX), 
               DECRYPTBYKEY(@DatosEncriptados));
        CLOSE SYMMETRIC KEY DataEncryption;
        RETURN 0;
    END TRY
    BEGIN CATCH
        IF EXISTS (SELECT 1 FROM sys.openkeys WHERE key_name = 'DataEncryption') -- Esto es por si el SP falla después del OPEN
            CLOSE SYMMETRIC KEY DataEncryption;
        DECLARE @MensajeError NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR('Error al desencriptar: %s', 16, 1, @MensajeError);
        RETURN 1; 
    END CATCH
END;
```
Un ejemplo, desencriptando un checksum de la tabla de logs.  
```sql
DECLARE @checksum VARBINARY(MAX);
DECLARE @resultado NVARCHAR(MAX);
DECLARE @retorno INT;

-- 1. Obtener el valor encriptado
SELECT @checksum = checksum FROM Solt_Log WHERE logid = 1;

-- 2. Ejecutar el procedimiento
EXEC @retorno = dbo.DesencriptarDatos 
    @DatosEncriptados = @checksum,
    @DatosDesencriptados = @resultado OUTPUT;

-- 3. Verificar el resultado
IF @retorno = 0
    SELECT @resultado AS 'Datos Desencriptados';
ELSE
    PRINT 'Ocurrió un error al desencriptar';
```
# Concurrencia 
## READ UNCOMMITED

## READ COMMITED

## REPEATABLE READ

## SERIALIZATION

# Consultas Misceláneas  
## Crear una vista indexada con al menos 4 tablas (ej. usuarios, suscripciones, pagos, servicios). La vista debe ser dinámica, no una vista materializada con datos estáticos. Demuestre que si es dinámica.  
```sql
CREATE VIEW dbo.vw_PartnerFeatures
WITH SCHEMABINDING
AS
SELECT
    P.partnerid,  
    F.planFeatureid,  
    P.name AS Proveedor,
    F.name AS Beneficio,
    F.enabled AS Habilitado,
    PD.expirationDate AS FechaExpiracion,
    RM.methodid,
    RM.name AS MetodoCanje,
    COUNT_BIG(*) AS ConteoFilas 
FROM dbo.Solt_PlanFeatures F
INNER JOIN dbo.Solt_FeaturePerDeal FPD ON FPD.planFeatureid = F.planFeatureid
INNER JOIN dbo.Solt_PartnerDeals PD ON PD.partnerDealid = FPD.partnerDealid
INNER JOIN dbo.Solt_Partners P ON P.partnerid = PD.partnerid
INNER JOIN dbo.Solt_RedemptionDetails RD ON RD.planFeatureid = F.planFeatureid
INNER JOIN dbo.Solt_RedemptionMethod RM ON RM.methodid = RD.methodid
GROUP BY
    P.partnerid,
    F.planFeatureid,
    P.name,
    F.name,
    F.enabled,
    PD.expirationDate,
    RM.methodid,
    RM.name;
GO


CREATE UNIQUE CLUSTERED INDEX Index_VW_PartnerFeatures
ON dbo.vw_PartnerFeatures (partnerid, planFeatureid, methodid);
GO
```
## Crear un procedimiento almacenado transaccional que realice una operación del sistema, relacionado a subscripciones, pagos, servicios, transacciones o planes, y que dicha operación requiera insertar y/o actualizar al menos 3 tablas.  
```sql
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
```
-- FALTA AJUSTAR con los inserts
## Escribir un SELECT que use CASE para crear una columna calculada que agrupe dinámicamente datos (por ejemplo, agrupar cantidades de usuarios por plan en rangos de monto, no use este ejemplo).  
```sql
USE Soltura;
GO

SELECT 
    CASE 
        WHEN creationDate >= '2025-05-01' THEN 'Grupos Recientes'
        WHEN creationDate >= '2025-01-01' AND creationDate < '2025-05-01' THEN 'Grupos 2025'
        WHEN creationDate < '2025-01-01' THEN 'Grupos Antiguos'
    END AS TipoGrupo,
    COUNT(DISTINCT groupOwner) AS CantidadGrupos
FROM Solt_UserGroups
GROUP BY CASE 
        WHEN creationDate >= '2025-05-01' THEN 'Grupos Recientes'
        WHEN creationDate >= '2025-01-01' AND creationDate < '2025-05-01' THEN 'Grupos 2025'
        WHEN creationDate < '2025-01-01' THEN 'Grupos Antiguos'
    END;
```
## Será posible que haciendo una consulta SQL en esta base de datos se pueda obtener un JSON para ser consumido por alguna de las pantallas de la aplicación que tenga que ver con los planes, subscripciones, servicios o pagos. Justifique cuál pantalla podría requerir esta consulta.
```sql
SELECT F.name, P.name FROM Solt_PlanFeatures F
INNER JOIN Solt_FeaturePerDeal FPD ON F.planFeatureid = FPD.planFeatureid
INNER JOIN Solt_PartnerDeals PD ON PD.partnerDealid = FPD.partnerDealid
INNER JOIN Solt_Partners P ON P.partnerid = PD.partnerid
FOR JSON AUTO
```
Esta consulta puede ser necesaria cuando se necesite mostrar un catálogo en alguna interfaz gráfica y se necesiten ver los distintos proveedores que ofrecen un determinado servicio.  






