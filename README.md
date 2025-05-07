# Caso 2
Entregable para el caso 2 del curso de Bases de Datos I

# Proceda entonces en conjunto con sus colegas consultores de empresa a realizar el diseño de ambas bases de datos.
## Base de datos en SQLServer
También está en el main del repo.
![image](https://github.com/Jcastro1605/Caso2/blob/cursores/Dise%C3%B1oSolturaSQLServer.png)

## Base de datos de MongoDB (para la página web de Soltura)
Las presentaciones de la base de datos se mostraran en MongoDB Compass para mejor presentación y legibilidad.  
### Collections de la Base de Datos
![image](https://github.com/user-attachments/assets/9707914b-9417-494e-97da-63cf7243fc0a)
### Documentos para los collections  
Se mostrará un ejemplo de un documento como "plantilla" y se especificará cuando algún documento puede salirse la plantilla.
#### Collection: Solt_Complaints
```json
{
  "_id": {
    "$oid": "681669762838f8177dd1e9b7"
  },
  "complaintid": 1,
  "language": "es-ES",
  "user": {
    "userId": "554",
    "username": "JPablo",
    "plan": "custom",
    "customerSince": "2024-12-10"
  },
  "submissionDate": "2025-01-15T14:30:00Z",
  "type": "Facturación",
  "verified": false,
  "title": "Cobro recurrente no aplicado",
  "description": "Ya he tenido problemas en varias ocasiones con el sistema de cobros recurrentes, pues no se está aplicando y me quitan la subscripción. Es muy molesto.",
  "evidence": [
    {
      "type": "screenshot",
      "url": "https://cloud.soltura.com/quejas/screenshot-baja.jpg",
      "description": "Comprobante de solicitud de baja"
    }
  ],
  "response": "Lamentamos mucho los inconvenientes que has tenido con Soltura, te sugerimos informar tu problema con Soporte para que puedas recibir atención del caso"
}
```
#### Collection: Solt_FAQ
```json
{
  "_id": {
    "$oid": "68163f8c2838f8177dd1e966"
  },
  "faqId": 2,
  "question": "¿Soltura tiene soporte para Android?",
  "answer": "Sí, nuestra app es compatible con Android 10 o superior.",
  "category": "Tecnología",
  "tags": [
    "android",
    "app"
  ],
  "language": "es-ES"
}
```
#### Collections: Solt_FAQCategories
```json
{
  "_id": {
    "$oid": "68169eee2838f8177dd1ea16"
  },
  "name": "Tecnología"
}
```
#### Collections: Solt_FeatureCategory
```json
{
  "_id": {
    "$oid": "681adcda74f237618c1e75c2"
  },
  "name": "Fitness & Wellness"
}
```  
#### Collections: Solt_Features
```json
{
  "_id": {
    "$oid": "681ae1ff74f237618c1e75c5"
  },
  "id": "01",
  "name": "Pet Grooming Premium",
  "category": "Pet Care",
  "description": "Servicios profesionales de aseo y cuidado para mascotas",
  "image": {
    "banner": "https://soltura-cloud-imgs/services/pet-grooming/banner-v3.jpg",
    "thumbnail": "https://soltura-cloud-imgs/services/pet-grooming/thumb.jpg",
    "altText": "Perro siendo aseado por profesional"
  },
  "features": [
    {
      "title": "Baño Completo",
      "description": "Incluye shampoo especializado, secado profesional y cepillado",
      "icon": "🛁"
    },
    {
      "title": "Corte de Pelo",
      "description": "Estilizado según raza o preferencia del dueño",
      "icon": "✂️"
    },
    {
      "title": "Atención Especializada",
      "description": "Personal capacitado en manejo animal",
      "icon": "🐾"
    }
  ],
  "providers": [
    {
      "id": "pg-cr-001",
      "name": "Pet Grooming CR Premium",
      "type": "Premium Partner",
      "logo": "https://soltura-cloud-imgs/providers/pet-grooming-cr/logo-v2.png",
      "description": "Especialistas en cuidado canino y felino con 10 años de experiencia",
      "avgrating": 4.8,
      "services": [
        "Full Grooming",
        "Spa Treatment",
        "Flea Bath"
      ],
      "locations": [
        {
          "addresses": [
            "San José, Curridabat"
          ]
        }
      ],
      "contact": [
        {
          "type": "Phone",
          "value": "8768-8918"
        },
        {
          "type": "website",
          "value": "https://www.groomingPetCR.cr/"
        }
      ],
      "businessHours": {
        "weekdays": "7:00am - 6:00pm",
        "weekends": "8:00am - 4:00pm"
      }
    }
  ],
  "metadata": {
    "createdAt": "2023-05-15T08:30:00Z",
    "updatedAt": "2023-11-20T14:25:00Z",
    "version": "2.1"
  }
}
```
#### Collections: Solt_HomeBanners
```json
{
  "_id": {
    "$oid": "68166d192838f8177dd1e9c2"
  },
  "bannerid": 1,
  "title": "Nuevo Plan en Soltura",
  "isFeatured": true,
  "image": "https://cloud.soltura.com/bannerImgs/b1.png",
  "link": "/solturaPlans.html",
  "linkText": "Conoce más detalles aquí",
  "uploadDate": "2025-04-25T09:15:00Z"
}
```
#### Collections: Solt_News 
```json
{
  "_id": {
    "$oid": "68156fe2ddf41ed3002dcd95"
  },
  "newsid": 1,
  "mainTitle": "Soltura implementa nuevo método de canje para usuarios de Apple",
  "abstract": "A partir del 12 de octubre, todos los usuarios de Soltura que cuenten con un celular IOS podrán vincular sus códigos de canje a sus Apple Wallet y hacer uso de los beneficios desde su celular",
  "postDate": "2025-07-31T23:59:59Z",
  "image": "https://imgURL.com",
  "subHeadlines": [
    {
      "outerTitle": "Utilización del Servicio",
      "relevantDetails": [
        {
          "innerTitle": "Configuración del servicio",
          "messageText": "Para configurar el servicio se debe abrir la aplicación móvil de Soltura y acceder a AJUSTES > MI CUENTA > MI CÓDIGO DE CANJE > AÑADIR A WALLET. Si tiene problemas en este proceso diríjase a la sección de Soporte."
        },
        {
          "innerTitle": "Utilización del servicio",
          "messageText": "Una vez completado la configuración puede abrir la apliación Apple Wallet y utilizar su teléfono para canjear el servicio."
        }
      ]
    }
  ],
  "language": "es-ES"
}
```
#### Collections: Solt_Packages
```json
{
  "packageid": "01",
  "name": "Nómada Digital",
  "image": "https://soltura-cloud-imgs/sbanner-v3.jpg",
  "features": [{
      "id": "01",
    	"name": "Pet Grooming Premium",
   	 	"category": "Pet Care",
    	"description": "Servicios profesionales de aseo y cuidado para mascotas"
    },
    {
      "id": "02",
      "name": "Plán Móvil",
      "category": "Digital Services",
      "description": "Datos y voz ilimitados con operador aliado"
    },
    {
      "id": "03",
      "name": "Gimnasio",
      "category": "Acceso a gimnasios afiliados",
      "description": "Acceso a gimnasios afiliados"
    }
    ],
  "precio": 79.90
}
```    
#### Collections: Solt_Partners
```json
{
  "_id": {
    "$oid": "681677582838f8177dd1e9d6"
  },
  "partnerCardid": 1,
  "name": "SmartFit",
  "logo": "https://cloud.soltura.com/partnerBanners/b1.png",
  "bannerImg": "https://cloud.soltura.com/partnerLogos/l1.png",
  "description": "Somos una cadena de gimnasios de origen brasileño, considerada la más grande fuera de los Estados Unidos, líder en el segmento en América Latina y la 4° más grande del mundo.",
  "benefits": [
    "Horas de gimnasio gratuitas",
    "Descuento en actividades seleccionadas"
  ],
  "contactInfo": [
    {
      "type": "Phone",
      "value": "8888-8888"
    },
    {
      "type": "Phone",
      "value": "7777-7777"
    },
    {
      "type": "website",
      "value": "https://www.smartfit.cr/"
    }
  ]
}
```
#### Collections: Solt_Reviews
```json
{
  "_id": {
    "$oid": "68156682ddf41ed3002dcd8b"
  },
  "reviewid": 1,
  "user": {
    "userid": 12,
    "username": "PGarcia",
    "userPicture": "https://hostingpicture.png/",
    "verified": true
  },
  "plan": "Custom",
  "rating": 4.5,
  "serviceProvider": "SmartFit Gym",
  "featureName": "SmartFit Discount",
  "commentTitle": "Buen Servicio SmartFit",
  "comment": "Excelente servicio, el gimnasio y el plan móvil han sido de gran ayuda. Solo me gustaría más opciones en los horarios seleccionado.",
  "datetime": "2025-03-31 14:00:00",
  "language": "ES-es",
  "replies": [
    {
      "replyid": 1,
      "replyUser": {
        "userid": 13,
        "username": "BCoto",
        "userPicture": "https://hostingpicture.png/",
        "verified": true
      },
      "language": "ES-es",
      "commentComment:": "Concuerdo con tu experiencia, tuve algo similar",
      "replyDatetime": "2025-03-31 14:30:00"
    }
  ]
}
```
#### Collection: Solt_SupportCaseCategory
```json
{
  "_id": {
    "$oid": "68169e052838f8177dd1ea06"
  },
  "name": "Transacciones"
}
```
#### Collections: Solt_SupportCases
```json
{
  "_id": {
    "$oid": "68165cf42838f8177dd1e99d"
  },
  "caseid": 1,
  "user": {
    "userid": 244,
    "username": "JPablo"
  },
  "submissionDate": "2025-02-10T14:30:00Z",
  "type": "Facturación",
  "subject": "Cargo duplicado para factura de Enero",
  "description": "El mes anterior se me cobró doble un servicio de Yoga",
  "status": "Resolved",
  "priority": "alta",
  "attachments": [
    {
      "name": "Factura_Adjunta",
      "type": "Invoice",
      "url": "https://cloud.soltura.com/attachments/invoice-123.jpg"
    }
  ],
  "resolutions": [
    {
      "action": "refund",
      "transactionNumber": 10390,
      "isResolved": true,
      "resolutionDate": "2025-02-12T14:30:00Z",
      "response": "Muchas gracias por contactar al soporte de Soltura, luego de revisar tu caso logramos encontrar el cobro doble y se hizo la devolución del dinero correspondiente a su monedero de Soltura"
    }
  ],
  "metadata": {
    "assignedTo": [
      {
        "user": "kgomez@soltura.com",
        "assignationDate": "2025-02-12T14:30:00Z",
        "resolutionHours": 2
      }
    ]
  }
}
```
# Demostraciones T-SQL
## Cursor local, mostrando que no es visible fuera de la sesión de la base de datos
```sql
USE Soltura;
GO

-- Demostracion de cursor local
DECLARE @userid INT, @username VARCHAR(30);

DECLARE userCursorLocal CURSOR LOCAL
FOR 
    SELECT userid, username 
    FROM dbo.Solt_Users 
    WHERE enabled = 1
    ORDER BY username;

OPEN userCursorLocal;

FETCH NEXT FROM userCursorLocal INTO @userid, @username;

PRINT 'Usuarios habilitados (Cursor Local):';
PRINT '----------------------------------';

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'ID: ' + CAST(@userid AS VARCHAR) + ' - Username: ' + @username;
    FETCH NEXT FROM userCursorLocal INTO @userid, @username;
END
```
Se puede comprobar fuera de la sesión:
```sql
USE Soltura;
GO
OPEN userCursorLocal;

DECLARE @userid INT, @username VARCHAR(30);

FETCH NEXT FROM userCursorLocal INTO @userid, @username;

PRINT 'Usuarios habilitados (Cursor Local):';
PRINT '----------------------------------';

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'ID: ' + CAST(@userid AS VARCHAR) + ' - Username: ' + @username;
    FETCH NEXT FROM userCursorLocal INTO @userid, @username;
END
```

## UNION entre planes individuales y empresariales por ejemplo.

```sql
USE Soltura;
GO

SELECT 
    subscriptionid AS PlanID,
    name AS NombrePlan,
    description AS Descripcion,
    'Full Modern Family' AS TipoPlan,
    (SELECT COUNT(*) 
     FROM dbo.Solt_PlansPerGroup PPG 
     JOIN dbo.Solt_UserPerGroup UPG ON PPG.userGroupid = UPG.userGroupid
     WHERE PPG.subscriptionid = S.subscriptionid) AS UsuariosActivos
FROM dbo.Solt_Subscriptions S
WHERE isCustom = 0 AND temporary = 0 AND name LIKE '%Full Modern Family%'

UNION

SELECT 
    subscriptionid AS PlanID,
    name AS NombrePlan,
    description AS Descripcion,
    'Nómada Digital' AS TipoPlan,
    (SELECT COUNT(*) 
     FROM dbo.Solt_PlansPerGroup PPG 
     JOIN dbo.Solt_UserPerGroup UPG ON PPG.userGroupid = UPG.userGroupid
     WHERE PPG.subscriptionid = S.subscriptionid) AS UsuariosActivos
FROM dbo.Solt_Subscriptions S
WHERE isCustom = 0 AND temporary = 0 AND name LIKE '%Nómada Digital%'

ORDER BY UsuariosActivos DESC, NombrePlan;
GO
```

## DISTINCT para evitar duplicados en servicios asignados por ejemplo.

```sql
USE Soltura;
GO
SELECT DISTINCT
    PF.name AS ServicioUnico,
    PF.description AS DescripcionServicio
FROM dbo.Solt_PlanFeatures PF
JOIN dbo.Solt_FeaturesPerPlan FPP ON PF.planFeatureid = FPP.planFeatureid
JOIN dbo.Solt_Subscriptions S ON FPP.subscriptionid = S.subscriptionid
WHERE FPP.enabled = 1
ORDER BY ServicioUnico;
GO
```

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
## READ UNCOMMITTED
READ UNCOMMITED es un nivel de isolación que NO bloquea las otras tablas. Este es útil para realizar consultas que no dependan de la precisión de los datos en un momento dado. Otra ventaja de este es la velocidad inherente de no tener que depender de otras tablas. Por este motivo, se ha optado por realizar un reporte general histórico de la tabla de Logs. Ver la información de los Logs no debe restringir el uso de otras tablas.
```sql
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
```
## READ COMMITTED
READ COMMITED es un nivel de isolación que solo mira datos ya confirmados por COMMIT. Este puede cambiar los valores que utiliza si a mitad de la transacción hay COMMITs. Para este, se prefirió hacer un procedimiento que evalúa la tasa de cambio en un momento dado. La idea de este SP es sumar todas las transacciones y convertir a la moneda destino. Al ser READ COMMITTED, modificaciones en las tasas de cambio en medio de la transacción se verán reflejados en la suma total de dinero. 
```sql
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
```
## REPEATABLE READ
Este atributo para transacciones limita el uso de otras filas de tablas hasta que el proceso termine. Es decir, los valores obtenidos de otras tablas no podrán cambiar en medio de la transacción. Se aprovechan las propiedades de REPEATABLE READ para garantizar que ningún otro proceso pueda actualizar los datos de la suscripción mientras algún usuario la esté adquiriendo.
```sql
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
```
## SERIALIZABLE
SERIALIZABLE es un nivel de isolación sumamente estricto. Este bloquea tablas enteras hasta que termine todo su proceso. No obstante, es un método que ralentiza mucho los procesos si se usa de forma incorrecta. Por eso, hemos optado por usarlo en una transacción poco frecuente como la de actualizar los precios de un plan de suscripción. Así, si una persona está intentando comprar o eliminar una suscripción, se bloquea para impedir registros con precios obsoletos
```sql
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
```

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

Esta consulta puede ser necesaria cuando se necesite mostrar un catálogo en alguna interfaz gráfica y se necesiten ver los distintos proveedores que ofrecen un determinado servicio.  

## Crear una consulta con al menos 3 JOINs que analice información donde podría ser importante obtener un SET DIFFERENCE y un INTERSECTION

Para esta consulta, vamos a analizar la información de suscripciones de usuarios, los planes a los que se han suscrito, y los servicios que ofrece cada plan. El objetivo es encontrar:

    INTERSECTION: Qué servicios están incluidos en todos los planes de suscripción.
    SET DIFFERENCE: Qué servicios ofrece un plan específico que no están incluidos en otro plan.

Tablas Involucradas:

    Solt_Subscriptions: Almacena información sobre las suscripciones de los usuarios.
    Solt_FeaturesPerPlan: Almacena la relación entre planes y caracteristicas (servicios).
    Solt_PlanFeatures: Almacena la información de los servicios o caracteristicas.

```sql
USE Soltura;

-- 1. INTERSECTION: Servicios comunes a todas las suscripciones
SELECT pf.name AS NombreServicio
FROM Solt_PlanFeatures pf
WHERE pf.planFeatureid IN (
    SELECT fpp.planFeatureid
    FROM Solt_FeaturesPerPlan fpp
    WHERE fpp.subscriptionid IN (SELECT subscriptionid FROM Solt_Subscriptions)
    GROUP BY fpp.planFeatureid
    HAVING COUNT(DISTINCT fpp.subscriptionid) = (SELECT COUNT(DISTINCT subscriptionid) FROM Solt_Subscriptions)
);

-- 2. SET DIFFERENCE: Servicios de la Suscripción 1 que no están en la Suscripción 2
SELECT pf.name AS NombreServicio
FROM Solt_PlanFeatures pf
WHERE pf.planFeatureid IN (
    SELECT fpp.planFeatureid
    FROM Solt_FeaturesPerPlan fpp
    WHERE fpp.subscriptionid = 1  -- Suscripción 1
    EXCEPT
    SELECT fpp.planFeatureid
    FROM Solt_FeaturesPerPlan fpp
    WHERE fpp.subscriptionid = 2  -- Suscripción 2
);
```
## Crear un procedimiento almacenado transaccional que llame a otro SP transaccional, el cual a su vez llame a otro SP transaccional.

```sql
USE Soltura;
GO

-- Procedimiento Almacenado Nivel 3
CREATE PROCEDURE [dbo].[SP_Nivel3]
AS
BEGIN
    SET XACT_ABORT ON;  

    -- Modificar tablas 5 y 6
    UPDATE Solt_PlanFeatures SET name = 'Nivel3' WHERE planFeatureId = 1;
    UPDATE Solt_FeaturesPerPlan SET value = 'Nivel3' WHERE subscriptionid = 1 AND planFeatureid = 1; 

    SELECT @@TRANCOUNT;
    RETURN 0;
END;
GO

-- Procedimiento Almacenado Nivel 2
CREATE PROCEDURE [dbo].[SP_Nivel2]
AS
BEGIN
    SET XACT_ABORT ON;

    -- Modificar tablas 3 y 4
    UPDATE Solt_Subscriptions SET name = 'Nivel2' WHERE subscriptionid = 1; 
    UPDATE Solt_SubscriptionPrices SET price = 22.22 WHERE subscriptionid = 1;

    -- Llamar al Procedimiento Almacenado de Nivel 3
    EXEC [dbo].[SP_Nivel3];

    SELECT @@TRANCOUNT;
    RETURN 0;
END;
GO

-- Procedimiento Almacenado Nivel 1
CREATE PROCEDURE [dbo].[SP_Nivel1]
AS
BEGIN
    SET XACT_ABORT ON;
    BEGIN TRANSACTION;

    -- Modificar tablas 1 y 2
    UPDATE Solt_Users SET username = 'Nivel1' WHERE userid = 1;
    UPDATE Solt_UserPersons SET name = 'Nivel1' WHERE userid = 1;

    -- Llamar al Procedimiento Almacenado de Nivel 2
    EXEC [dbo].[SP_Nivel2];

    COMMIT TRANSACTION; 
    SELECT @@TRANCOUNT;
    RETURN 0;
END;
GO

-- Ejemplo de COMMIT exitoso
EXEC [dbo].[SP_Nivel1];
SELECT * FROM Solt_Users WHERE userid = 1;
SELECT * FROM Solt_UserPersons WHERE userid = 1;
SELECT * FROM Solt_Subscriptions WHERE subscriptionid = 1;
SELECT * FROM Solt_SubscriptionPrices WHERE subscriptionid = 1;
SELECT * FROM Solt_PlanFeatures WHERE planFeatureId = 1;
SELECT * FROM Solt_FeaturesPerPlan WHERE subscriptionid = 1 and planFeatureid = 1;
GO

-- Ejemplo de ROLLBACK (descomentar la línea RAISERROR en SP_Nivel3)
--DROP TABLE Solt_Log
--CREATE TABLE [dbo].[Solt_Log](
--    [logid] [int] IDENTITY(1,1) NOT NULL,
--    [eventDate] [datetime] NOT NULL,
--    [spName] [varchar](128) NOT NULL,
--    [message] [varchar](max) NULL,
--    [userid] [int] NULL,
--    [severity] [int] NOT NULL,
-- CONSTRAINT [PK_Solt_Log] PRIMARY KEY CLUSTERED 
--(
--    [logid] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--GO
ALTER PROCEDURE [dbo].[SP_Nivel3]
AS
BEGIN
    SET XACT_ABORT ON;  
    -- Modificar tablas 5 y 6
    UPDATE Solt_PlanFeatures SET name = 'Nivel3' WHERE planFeatureId = 1;
    UPDATE Solt_FeaturesPerPlan SET value = 'Nivel3' WHERE subscriptionid = 1 AND planFeatureid = 1; 
    RAISERROR('Error simulado en Nivel 3', 16, 1);  -- Descomentar para probar el rollback
    SELECT @@TRANCOUNT;
    RETURN 0;
END;
GO
EXEC [dbo].[SP_Nivel1];
SELECT * FROM Solt_Users WHERE userid = 1;
SELECT * FROM Solt_UserPersons WHERE userid = 1;
SELECT * FROM Solt_Subscriptions WHERE subscriptionid = 1;
SELECT * FROM Solt_SubscriptionPrices WHERE subscriptionid = 1;
SELECT * FROM Solt_PlanFeatures WHERE planFeatureId = 1;
SELECT * FROM Solt_FeaturesPerPlan WHERE subscriptionid = 1 and planFeatureid = 1;
GO

DROP PROCEDURE [dbo].[SP_Nivel1];
DROP PROCEDURE [dbo].[SP_Nivel2];
DROP PROCEDURE [dbo].[SP_Nivel3];
GO

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

## Podrá su base de datos soportar un SP transaccional que actualice los contratos de servicio de un proveedor, el proveedor podría ya existir o ser nuevo, si es nuevo, solo se inserta.

```sql
USE Soltura;
GO

-- Tipo de Tabla para las condiciones del contrato
CREATE TYPE [dbo].[ContractConditionsTableType] AS TABLE
(
    [itemId] INT,
    [condition] VARCHAR(200)
);
GO

-- Procedimiento Almacenado para actualizar/insertar contratos de proveedor
CREATE PROCEDURE [dbo].[SP_UpdateProviderContract]
(
    @providerId INT,
    @providerName VARCHAR(200),
    @contractConditions [dbo].[ContractConditionsTableType] READONLY
)
AS
BEGIN
    SET XACT_ABORT ON;
    BEGIN TRANSACTION;

    -- Declarar variable para el ID del proveedor
    DECLARE @existingProviderId INT;

    -- Verificar si el proveedor existe
    SELECT @existingProviderId = providerid
    FROM Solt_Providers
    WHERE providerid = @providerId;

    -- Si el proveedor no existe, insertarlo
    IF @existingProviderId IS NULL
    BEGIN
        INSERT INTO Solt_Providers (name)
        VALUES (@providerName);
        SET @providerId = SCOPE_IDENTITY(); -- Obtener el nuevo ID del proveedor
    END

    -- Actualizar o insertar condiciones del contrato
    MERGE INTO Solt_ProviderContracts AS target
    USING @contractConditions AS source
        ON target.providerid = @providerId AND target.itemid = source.itemId
    WHEN MATCHED THEN
        UPDATE SET target.condition = source.condition
    WHEN NOT MATCHED THEN
        INSERT (providerid, itemid, condition)
        VALUES (@providerId, source.itemId, source.condition)
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    COMMIT TRANSACTION;
END;
GO

-- Ejemplo de uso
-- Declarar e insertar datos en el TVP
DECLARE @ContractConditions [dbo].[ContractConditionsTableType];
INSERT INTO @ContractConditions (itemId, condition)
VALUES
    (1, 'Condición A - Actualizada'),
    (2, 'Condición B'),
    (3, 'Condición C - Nueva');

-- Ejecutar el procedimiento almacenado para un proveedor existente
EXEC [dbo].[SP_UpdateProviderContract] 1, 'Proveedor Existente', @ContractConditions;

-- Ejecutar el procedimiento almacenado para un nuevo proveedor
EXEC [dbo].[SP_UpdateProviderContract] 2, 'Nuevo Proveedor', @ContractConditions;

SELECT * FROM Solt_Providers;
SELECT * FROM Solt_ProviderContracts;

DROP PROCEDURE [dbo].[SP_UpdateProviderContract];
DROP TYPE [dbo].[ContractConditionsTableType];
GO
```

## Crear un SELECT que genere un archivo CSV de datos basado en un JOIN entre dos tablas

```sql
USE Soltura;
GO

-- Generar archivo CSV (simulado)
SELECT
    u.userid AS UserId,
    u.firstName AS FirstName,
    u.lastName AS LastName,
    a.line1 AS AddressLine1,
    a.line2 AS AddressLine2,
    a.zipcode AS ZipCode
FROM Solt_Users u
JOIN Solt_UserAdresses ua ON u.userid = ua.userid
JOIN Solt_Adresses a ON ua.adressid = a.adressid
WHERE u.userid < 5  -- Limitar la cantidad de datos para el ejemplo
ORDER BY u.userid
--En SQL Server, la generación directa de archivos CSV es limitada.  Esta consulta genera los datos.
--Para guardar esto en un archivo, se puede usar la utilidad bcp de SQL Server, o bien
-- SSIS (SQL Server Integration Services).
-- Ejemplo usando bcp (desde la línea de comandos de Windows):
-- bcp "SELECT ... FROM Soltura.dbo.Solt_Users..." queryout C:\data\usuarios.csv -c -t, -Slocalhost -Usa -Ppassword
```
Otra opción es utilizar el SSMS dándole click derecho a los resultados y utilizando la opción "Guardar Resultados Como ... " y guardarlo como un CSS.  
## Configurar una tabla de bitácora en otro servidor SQL Server accesible vía Linked Servers con impersonación segura desde los SP del sistema.
```sql
USE Soltura;
GO

-- Paso 1: Configurar el Linked Server (Ejecutar en el servidor principal)
-- Reemplazar <NombreServidorRemoto> con el nombre real del servidor remoto.
EXEC sp_addlinkedserver
    @server = N'NombreServidorRemoto',
    @srvproduct = N'SQL Server';
GO

-- Paso 2: Configurar la seguridad del Linked Server (Ejecutar en el servidor principal)
--  Usar la cuenta de servicio de SQL Server para la suplantación (o una cuenta específica con los permisos requeridos).
EXEC sp_addlinkedsrvlogin
    @rmtsrvname = N'<NombreServidorRemoto>',
    @useself = N'True';  -- Usa la suplantación
GO

-- Paso 3: Crear la tabla de bitácora en el servidor remoto (Ejecutar en el servidor remoto)
USE [DBRemoto]; -- Reemplazar YourRemoteDatabase
GO
CREATE TABLE [dbo].[Solt_Log](
    [logid] [int] IDENTITY(1,1) NOT NULL,
    [eventDate] [datetime] NOT NULL,
    [spName] [varchar](128) NOT NULL,
    [message] [varchar](max) NULL,
    [userid] [int] NULL,
    [severity] [int] NOT NULL,
 CONSTRAINT [PK_Solt_Log] PRIMARY KEY CLUSTERED
(
    [logid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-- Paso 4: Crear el procedimiento almacenado genérico (Ejecutar en el servidor principal)
CREATE PROCEDURE [dbo].[SP_LogMessage]
(
    @spName VARCHAR(128),
    @message VARCHAR(MAX),
    @userid INT = NULL,
    @severity INT = 0
)
AS
BEGIN
    -- Insertar en la tabla de bitácora en el servidor remoto.
    INSERT INTO [NombreServidorRemoto].[DBRemoto].[dbo].[Solt_Log] (eventDate, spName, message, userid, severity)
    VALUES (GETDATE(), @spName, @message, @userid, @severity);
END;
GO

-- Paso 5:  Ejemplo de uso del SP genérico desde otro SP (Ejecutar en el servidor principal)
CREATE PROCEDURE [dbo].[SP_SomeOtherSP]
AS
BEGIN
    -- Hacer algo...
    -- Llamar al SP de bitácora para registrar un mensaje.
    EXEC [dbo].[SP_LogMessage]
        @spName = 'SP_SomeOtherSP',
        @message = 'Este es un mensaje de bitácora desde SP_SomeOtherSP.',
        @userid = 123,  -- Reemplazar con el ID de usuario apropiado
        @severity = 1;

    -- Más lógica del SP...
END;
GO

DROP PROCEDURE [dbo].[SP_SomeOtherSP];
DROP PROCEDURE [dbo].[SP_LogMessage];
-- El linked server se debe eliminar manualmente en SSMS
```










