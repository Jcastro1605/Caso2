# Caso 2
Entregable para el caso 2 del curso de Bases de Datos I  
# Integrantes:  
Julián Castro Barrantes - 2024119346  
Lindsay Marín Sánchez - 2024163904  
Elías Ramírez Hernández - 2024090300  
Andrés Rodríguez Brizuela - 2024256537  

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
      "icon": "https://soltura-cloud-imgs/iconBath.png"
    },
    {
      "title": "Corte de Pelo",
      "description": "Estilizado según raza o preferencia del dueño",
      "icon": "https://soltura-cloud-imgs/iconScissor.png"
    },
    {
      "title": "Atención Especializada",
      "description": "Personal capacitado en manejo animal",
      "icon": "https://soltura-cloud-imgs/iconPaws.png"
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
# Población de la base de datos  
```sql
USE Soltura;
SET NOCOUNT ON;

IF OBJECT_ID('dbo.Solt_Log') IS NOT NULL
BEGIN
    /* Apagar Flags antes del intento */
    SET IDENTITY_INSERT dbo.Solt_Log OFF;
	SET IDENTITY_INSERT dbo.Solt_ScheduleDetails OFF;
	SET IDENTITY_INSERT dbo.Solt_DealMedia OFF;
END
GO    

/* RESET de IDENTITY_INSERT */
BEGIN TRY
    SET IDENTITY_INSERT dbo.Solt_UserPersons            OFF;
    SET IDENTITY_INSERT dbo.Solt_UserGroups             OFF;
    SET IDENTITY_INSERT dbo.Solt_UserPerGroup           OFF;
    SET IDENTITY_INSERT dbo.Solt_UserAdresses           OFF;
    SET IDENTITY_INSERT dbo.Solt_MethodPerUser          OFF;
    SET IDENTITY_INSERT dbo.Solt_LimitBalance           OFF;
    SET IDENTITY_INSERT dbo.Solt_PlanFeatures           OFF;
    SET IDENTITY_INSERT dbo.Solt_PlansPerGroup          OFF;
    SET IDENTITY_INSERT dbo.Solt_Subscriptions          OFF;
    SET IDENTITY_INSERT dbo.Solt_PartnerDeals           OFF;
    SET IDENTITY_INSERT dbo.Solt_Partners               OFF;
    SET IDENTITY_INSERT dbo.Solt_ScheduleDetails        OFF;
    SET IDENTITY_INSERT dbo.Solt_RedemptionDetails      OFF;
    SET IDENTITY_INSERT dbo.Solt_RedemptionCodes        OFF;
    SET IDENTITY_INSERT dbo.Solt_FeaturesPerPlan        OFF;
    SET IDENTITY_INSERT dbo.Solt_PaymentAttempts        OFF;
    SET IDENTITY_INSERT dbo.Solt_PartnerPaymentMethods  OFF;
    SET IDENTITY_INSERT dbo.Solt_MediaTypes             OFF;
    SET IDENTITY_INSERT dbo.Solt_MediaFile              OFF;
    SET IDENTITY_INSERT dbo.Solt_DealMedia              OFF;
    SET IDENTITY_INSERT dbo.Solt_LogSources             OFF;
    SET IDENTITY_INSERT dbo.Solt_LogTypes               OFF;
    SET IDENTITY_INSERT dbo.Solt_Log                    OFF;
END TRY
BEGIN CATCH
    -- Se ignora
END CATCH

BEGIN TRY

    /*-------------------
    1. Limpieza de Tablas
    -------------------*/

	DELETE FROM dbo.Solt_DealMedia;         -- hijo
    DELETE FROM dbo.Solt_MediaFile;         -- padre de DealMedia
    DELETE FROM dbo.Solt_Log;               -- hijo
    DELETE FROM dbo.Solt_LogTypes;
    DELETE FROM dbo.Solt_LogSeverity;
    DELETE FROM dbo.Solt_LogSources;
	DELETE FROM dbo.Solt_MediaTypes;
	DELETE FROM dbo.Solt_RedemptionDetails;
    DELETE FROM dbo.Solt_RedemptionCodes;
    DELETE FROM dbo.Solt_ScheduleDetails;     -- hijo de Solt_Schedules
	DELETE FROM dbo.Solt_Transactions;
    DELETE FROM dbo.Solt_TransactionSubTypes; -- hijo conceptual de TransactionTypes
    DELETE FROM dbo.Solt_TransactionTypes; 
	DELETE FROM dbo.Solt_PartnerPaymentMethods;
	DELETE FROM dbo.Solt_PaymentAttempts;     -- hijo de PayErrorTypes + Modules + Users
    DELETE FROM dbo.Solt_PayErrorTypes;       -- padre de Attempts
    DELETE FROM dbo.Solt_Modules;
	DELETE FROM dbo.Solt_FeaturePerDeal;      -- hijo de PartnersDeals + PlanFeatures
    DELETE FROM dbo.Solt_PartnerDeals;		  -- hijo de Partners
    DELETE FROM dbo.Solt_Partners;
	DELETE FROM dbo.Solt_AuthSessions;        -- hijo de Users + AuthPlatforms
	DELETE FROM dbo.Solt_MethodPerUser;       -- hijo de Users + AvailableMethods
	DELETE FROM dbo.Solt_UserPerGroup;        -- hijo de UserGroups + Users
	DELETE FROM dbo.Solt_PlansPerGroup;       -- hijo de UserGroups + Subscriptions + Schedules
	DELETE FROM dbo.Solt_UserAdresses;        -- hijo de Users + Adresses
	DELETE FROM dbo.Solt_AvailableMethods;    -- hijo de PaymentMethods
	DELETE FROM dbo.Solt_PaymentMethods;      -- hijo de ContactInfoPerson
	DELETE FROM dbo.Solt_ContactInfoPerson;   -- hijo de Users
	DELETE FROM dbo.Solt_UserPersons;         -- hijo de Users
	DELETE FROM dbo.Solt_PlanLimits;          -- hijo de PlanFeatures + LimitBalance + Schedules
	DELETE FROM dbo.Solt_FeaturesPerPlan;     -- hijo de PlanFeatures + Subscriptions
	DELETE FROM dbo.Solt_SubscriptionPrices;  -- hijo de Subscriptions
	DELETE FROM dbo.Solt_LimitBalance;        -- hijo de LimitBalanceTypes + Currencies
	DELETE FROM dbo.Solt_PlanFeatures;        -- padre de FeatureMethod + PlanLimits + FeaturesPerPlan
	DELETE FROM dbo.Solt_Subscriptions;       -- padre de Prices + FeaturesPerPlan + PlansPerGroup
	DELETE FROM dbo.Solt_Schedules;           -- padre de PlanLimits + PlansPerGroup
	DELETE FROM dbo.Solt_UserGroups;          -- hijo de GroupType + Users
	DELETE FROM dbo.Solt_Adresses;            -- hijo de Cities
	DELETE FROM dbo.Solt_Cities;              -- hijo de States
	DELETE FROM dbo.Solt_States;              -- hijo of Countries
	DELETE FROM dbo.Solt_Countries;           -- hijo de Currencies
	DELETE FROM dbo.Solt_CurrencyConversions;
	DELETE FROM dbo.Solt_Users;
	DELETE FROM dbo.Solt_GroupType;
	DELETE FROM dbo.Solt_ContactInfoTypes;
	DELETE FROM dbo.Solt_LimitBalanceTypes;
	DELETE FROM dbo.Solt_RedemptionMethod;
	DELETE FROM dbo.Solt_DealType;
	DELETE FROM dbo.Solt_StatusTypes;
	DELETE FROM dbo.Solt_AuthPlatforms;
	DELETE FROM dbo.Solt_Currencies;

    /*-----------------
    2. RESEED de tablas
    -----------------*/
    DBCC CHECKIDENT ('dbo.Solt_CurrencyConversions',RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_Cities',             RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_States',             RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_Countries',          RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_DealType',           RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_RedemptionMethod',   RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_LimitBalanceTypes',  RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_GroupType',          RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_ContactInfoTypes',   RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_Currencies',         RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_UserPerGroup',		RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_ContactInfoPerson',	RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_UserGroups',			RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_Adresses',			RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_UserPersons',		RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_Users',				RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_PlansPerGroup',		RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_PlanLimits',			RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_LimitBalance',		RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_FeaturesPerPlan',	RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_SubscriptionPrices', RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_PlanFeatures',		RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_Subscriptions',		RESEED, 0);
	DBCC CHECKIDENT ('dbo.Solt_FeaturePerDeal',     RESEED, 0);
	DBCC CHECKIDENT ('dbo.Solt_PartnerDeals',       RESEED, 0);
	DBCC CHECKIDENT ('dbo.Solt_Partners',           RESEED, 0);
	DBCC CHECKIDENT ('dbo.Solt_ScheduleDetails',    RESEED, 0);
	DBCC CHECKIDENT ('dbo.Solt_RedemptionDetails',  RESEED, 0);
	DBCC CHECKIDENT ('dbo.Solt_PartnerPaymentMethods', RESEED, 0);
	DBCC CHECKIDENT ('dbo.Solt_DealMedia',			RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_MediaFile',			RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_LogTypes',			RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_LogSources',			RESEED, 0);
    DBCC CHECKIDENT ('dbo.Solt_MediaTypes',			RESEED, 0);

/*--------
3. Inserts
--------*/

/* Bloque 1: Catálogos Base y Configuraciones */

	IF (SELECT 1
		FROM sys.identity_columns
		WHERE object_id = OBJECT_ID('dbo.Solt_MethodPerUser')) = 1
	BEGIN
		SET IDENTITY_INSERT dbo.Solt_MethodPerUser OFF;
	END

    -- Solt_Currencies
    SET IDENTITY_INSERT dbo.Solt_Currencies ON;
    INSERT dbo.Solt_Currencies (currencyid, name, acronym, symbol) VALUES
        (1,'Costa Rican Colón','CRC','₡'),
        (2,'United States Dollar','USD','$'),
        (3,'Euro','EUR','€');
    SET IDENTITY_INSERT dbo.Solt_Currencies OFF;

    -- Solt_ContactInfoTypes
    SET IDENTITY_INSERT dbo.Solt_ContactInfoTypes ON;
    INSERT dbo.Solt_ContactInfoTypes (contactInfoTypeid, name) VALUES
        (1,'Email'),
        (2,'Teléfono'),
        (3,'WhatsApp');
    SET IDENTITY_INSERT dbo.Solt_ContactInfoTypes OFF;

    -- Solt_GroupType
    SET IDENTITY_INSERT dbo.Solt_GroupType ON;
    INSERT dbo.Solt_GroupType (groupTypeid, name, maxSize) VALUES
        (1,'Individual',1),
        (2,'Familiar',5),
        (3,'Corporativo',50);
    SET IDENTITY_INSERT dbo.Solt_GroupType OFF;

    -- Solt_LimitBalanceTypes
    SET IDENTITY_INSERT dbo.Solt_LimitBalanceTypes ON;
    INSERT dbo.Solt_LimitBalanceTypes (limitBalanceTypeid, name, description) VALUES
        (1,'Límite Mensual','Monto máximo de consumo por mes'),
        (2,'Límite Anual','Monto máximo de consumo por año'),
        (3,'Saldo Prepago','Crédito pre‑cargado disponible');
    SET IDENTITY_INSERT dbo.Solt_LimitBalanceTypes OFF;

    -- Solt_RedemptionMethod
    SET IDENTITY_INSERT dbo.Solt_RedemptionMethod ON;
    INSERT dbo.Solt_RedemptionMethod (methodid, name) VALUES
        (1,'Código QR'),
        (2,'NFC'),
        (3,'Código de Barras');
    SET IDENTITY_INSERT dbo.Solt_RedemptionMethod OFF;

    -- Solt_DealType
    SET IDENTITY_INSERT dbo.Solt_DealType ON;
    INSERT dbo.Solt_DealType (dealTypeid, name, typeDesc) VALUES
        (1,'Descuento %','Aplica un porcentaje de descuento'),
        (2,'Cashback','Devuelve parte del pago al usuario'),
        (3,'Producto Gratis','Artículo sin costo al cumplir condiciones');
    SET IDENTITY_INSERT dbo.Solt_DealType OFF;

    -- Solt_StatusTypes
    INSERT dbo.Solt_StatusTypes (statusTypeId, name) VALUES
        (1,'Activo'),
        (2,'Inactivo'),
        (3,'Suspendido'),
        (4,'Expirado');

    -- Solt_Countries
    SET IDENTITY_INSERT dbo.Solt_Countries ON;
    INSERT dbo.Solt_Countries (countryid, name, currencyid) VALUES
        (1,'Costa Rica',1),
        (2,'Estados Unidos',2),
        (3,'España',3);
    SET IDENTITY_INSERT dbo.Solt_Countries OFF;

    -- Solt_States
    SET IDENTITY_INSERT dbo.Solt_States ON;
    INSERT dbo.Solt_States (stateid, name, countryid) VALUES
        (1,'San José',1),
        (2,'California',2),
        (3,'Madrid',3);
    SET IDENTITY_INSERT dbo.Solt_States OFF;

    -- Solt_Cities
    SET IDENTITY_INSERT dbo.Solt_Cities ON;
    INSERT dbo.Solt_Cities (cityid, name, stateid) VALUES
        (1,'Escazú',1),
        (2,'Santa Ana',1),
        (3,'San Francisco',2),
        (4,'Madrid',3);
    SET IDENTITY_INSERT dbo.Solt_Cities OFF;

    -- Solt_CurrencyConversions
    SET IDENTITY_INSERT dbo.Solt_CurrencyConversions ON;
    INSERT dbo.Solt_CurrencyConversions
        (conversionid, startdate, enddate, exchangeRate, enabled,
         isCurrent, source_currencyid, destination_currencyid)
    VALUES
        (1,'2025-04-01',NULL,0.001900,1,1,1,2),
        (2,'2025-04-01',NULL,525.000000,1,1,2,1);
    SET IDENTITY_INSERT dbo.Solt_CurrencyConversions OFF;

/* Bloque 2: Usuarios y Datos Personales */

    -- Solt_AuthPlatforms
	INSERT dbo.Solt_AuthPlatforms(authPlatformId,name,secretKey,[key]) VALUES
	 (1,'Email+Password',0x736563456D4574,0x6B6579456D4574),
	 (2,'Google'        ,0x736563476F6F67,0x6B6579476F6F67),
	 (3,'Apple'         ,0x7365634170706C,0x6B65794170706C);

	-- Nombres y Apellidos
	DECLARE @FirstNames TABLE(fname varchar(20));
	INSERT @FirstNames VALUES
	 ('Alejandro'),('María'),('Laura'),('Diego'),('Camila'),
	 ('Gabriel'),('Valentina'),('Julián'),('Fernanda'),('Andrés'),
	 ('Daniela'),('Sebastián'),('Paola'),('Ricardo'),('Nicole');

	DECLARE @LastNames TABLE(lname varchar(20));
	INSERT @LastNames VALUES
	 ('Rodríguez'),('González'),('Jiménez'),('Soto'),('Ramírez'),
	 ('Morales'),('Vargas'),('Calvo'),('Campos'),('Solano'),
	 ('Salazar'),('Herrera'),('Pineda'),('Rojas'),('Acuña');

	-- Escoger 30 nombres
	DECLARE @UsersData TABLE
	(
	  userid  INT PRIMARY KEY,
	  fname   VARCHAR(20),
	  lname   VARCHAR(20)
	);
	;WITH RandomPairs AS
	(
	  SELECT f.fname, l.lname
	  FROM @FirstNames AS f
	  CROSS JOIN @LastNames  AS l
	),
	Top30 AS
	(
	  SELECT TOP(30) fname, lname
	  FROM RandomPairs
	  ORDER BY NEWID()
	)
	INSERT INTO @UsersData(userid,fname,lname)
	SELECT
	  ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS userid,
	  fname,
	  lname
	FROM Top30;

    -- Solt_Users
	SET IDENTITY_INSERT dbo.Solt_Users ON;
	INSERT dbo.Solt_Users(userid,username,[password],enabled)
	SELECT
	  d.userid,
	  LOWER(
	    LEFT(d.fname,1)
	    + d.lname
	    + CAST(ABS(CHECKSUM(NEWID())) % 1000 + 1 AS varchar(4))
	  ) AS username,
	  HASHBYTES('SHA2_256', CONCAT('P@ss',d.userid,'w0rd')) AS [password],
	  CASE WHEN d.userid <= 25 THEN 1 ELSE 0 END
	FROM @UsersData AS d;
	SET IDENTITY_INSERT dbo.Solt_Users OFF;

	-- Solt_UserPersons
	SET IDENTITY_INSERT dbo.Solt_UserPersons ON;
	INSERT dbo.Solt_UserPersons
		  (userPersonid, userid,
		   name, firstLastname, secondLastname, birthdate)
	SELECT
	  d.userid,
	  d.userid,
	  d.fname,
	  d.lname,
	  (
	    SELECT TOP 1 ln.lname
	    FROM   @LastNames AS ln
	    WHERE  ln.lname <> d.lname
	    ORDER  BY NEWID()
	  ) AS secondLastname,
	  DATEADD(day, -(18 + ABS(CHECKSUM(NEWID())) % 9000), '2005-01-01')
	FROM @UsersData AS d;
	SET IDENTITY_INSERT dbo.Solt_UserPersons OFF;

	-- Solt_ContactInfoPerson
	SET IDENTITY_INSERT dbo.Solt_ContactInfoPerson ON;

	;WITH c AS (
	   SELECT userid,
			  LOWER(LEFT(fname,1)+lname)+'@soltmail.com' AS email,
			  '+506' + RIGHT('2'+CAST(20000000+ABS(CHECKSUM(NEWID()))%8000000 AS varchar(8)),8) AS phone
	   FROM   @UsersData
	)
	INSERT dbo.Solt_ContactInfoPerson(contactInfoPersonid,value,enabled,
									  lastUpdate,contactInfoTypeid,userid)
	SELECT userid*2-1, email ,1,GETDATE(),1,userid FROM c
	UNION ALL
	SELECT userid*2  , phone ,1,GETDATE(),2,userid FROM c;

	SET IDENTITY_INSERT dbo.Solt_ContactInfoPerson OFF;

	-- Solt_PaymentMethods
	INSERT dbo.Solt_PaymentMethods(paymentMethodId,name,APIurl,secretKey,[key],
								   logoIconURL,enabled,contactInfoPersonId,templateJSON)
	VALUES
	 (1,'Visa'       ,'https://api.visa.co'      ,0x73656356697361,0x6B657956697361,NULL,1,NULL,'{}'),
	 (2,'MasterCard' ,'https://api.mastercard.co',0x7365634D432020,0x6B65794D432020,NULL,1,NULL,'{}'),
	 (3,'PayPal'     ,'https://api.paypal.com'   ,0x73656350505020,0x6B657950505020,NULL,1,NULL,'{}'),
	 (4,'Apple Pay'  ,'https://api.applepay.com' ,0x73656341505020,0x6B657941505020,NULL,1,NULL,'{}'),
	 (5,'Google Pay' ,'https://api.gpay.com'     ,0x73656347505020,0x6B657947505020,NULL,1,NULL,'{}');

	-- Solt_AvailableMethods
	INSERT dbo.Solt_AvailableMethods(availableMethodId,name,token,expTokenDate,maskAccount,
									 paymentMethodId,callbackURLGET,callbackPOST,configurationJSON)
	VALUES
	 (1,'Visa estándar',       NULL,NULL,NULL,1,NULL,NULL,'{}'),
	 (2,'MasterCard estándar', NULL,NULL,NULL,2,NULL,NULL,'{}'),
	 (3,'PayPal personal',     NULL,NULL,NULL,3,NULL,NULL,'{}'),
	 (4,'Apple Pay iOS',       NULL,NULL,NULL,4,NULL,NULL,'{}'),
	 (5,'Google Pay Android',  NULL,NULL,NULL,5,NULL,NULL,'{}');

	-- Solt_MethodPerUser
	SET IDENTITY_INSERT dbo.Solt_MethodPerUser ON;

	INSERT dbo.Solt_MethodPerUser(methodPerUserid,userid,
								  availableMethodId,enabled,registrationTime)
	SELECT userid,
		   userid,
		   1+ABS(CHECKSUM(NEWID()))%5,
		   1,
		   DATEADD(day,-ABS(CHECKSUM(NEWID()))%120,GETDATE())
	FROM   dbo.Solt_Users;

	SET IDENTITY_INSERT dbo.Solt_MethodPerUser OFF;

	-- Solt_Adresses
	IF NOT EXISTS (SELECT 1 FROM dbo.Solt_Adresses)
	BEGIN
		INSERT dbo.Solt_Adresses(line1,line2,zipcode,geoposition,cityid)
		VALUES
		  ('Residencial Vista Verde #12',NULL,'10201',NULL,1),
		  ('Apartamentos La Sabana Torre B 505',NULL,'10108',NULL,1),
		  ('Barrio Luján Calle 3 Ave 2',NULL,'10104',NULL,1),
		  ('Residencial Valle del Sol Casa 23',NULL,'10901',NULL,2),
		  ('Ruta 27 Km 5 Cond. Montaña',NULL,'10903',NULL,2),
		  ('123 Main St',NULL,'94105',NULL,3),
		  ('456 Market St',NULL,'94107',NULL,3),
		  ('Plaza Mayor 1',NULL,'28013',NULL,4),
		  ('Calle Alcalá 45',NULL,'28014',NULL,4),
		  ('Paseo de la Castellana 200',NULL,'28046',NULL,4),
		  ('Residencial Los Robles Casa 8',NULL,'10203',NULL,1),
		  ('Edificio Torres Vida Piso 10',NULL,'10102',NULL,1),
		  ('Sunset Boulevard 88',NULL,'90028',NULL,3),
		  ('Hotel Centro Plaza Lobby',NULL,'10105',NULL,1),
		  ('C/ Gran Vía 15',NULL,'28010',NULL,4);
	END
	
	-- Solt_UserGroups
	;WITH Owners AS (
		SELECT TOP (5) u.userid
		FROM   dbo.Solt_Users AS u
		ORDER  BY u.userid
	)
	INSERT INTO dbo.Solt_UserGroups
			   (groupOwner, enabled, creationDate, name, groupTypeid)
	SELECT  
		o.userid,
		1,
		GETDATE(),
		CASE 
		  WHEN ROW_NUMBER() OVER(ORDER BY o.userid) = 1 THEN N'Familia '           + d.fname
		  WHEN ROW_NUMBER() OVER(ORDER BY o.userid) = 2 THEN N'Equipo StartUp '   + d.lname
		  WHEN ROW_NUMBER() OVER(ORDER BY o.userid) = 3 THEN N'Familia '           + d.lname
		  WHEN ROW_NUMBER() OVER(ORDER BY o.userid) = 4 THEN N'Cycling Buddies'
		  ELSE   N'Roomies CR'
		END                     AS name,
		CASE 
		  WHEN ROW_NUMBER() OVER(ORDER BY o.userid) IN (2,4) THEN 3 
		  ELSE 2 
		END                     AS groupTypeid
	FROM Owners AS o
	JOIN @UsersData AS d 
	  ON d.userid = o.userid;

	-- Solt_UserPerGroup
	;WITH G AS (
		SELECT ug.userGroupid,
			   ROW_NUMBER() OVER(ORDER BY ug.userGroupid) AS grpRow
		FROM   dbo.Solt_UserGroups ug
	),
	U AS (
		SELECT u.userid,
			   ROW_NUMBER() OVER(ORDER BY u.userid) AS usrRow
		FROM   dbo.Solt_Users u
		WHERE  u.userid <= 30
	)
	INSERT dbo.Solt_UserPerGroup(userGroupid,userid,joinDate,enabled)
	SELECT  g.userGroupid,
			u.userid,
			DATEADD(day,-ABS(CHECKSUM(NEWID()))%300,GETDATE()),
			1
	FROM   U
	JOIN   G ON ((u.usrRow-1)/6)+1 = g.grpRow
	WHERE  u.usrRow <= 24;

	-- Solt_UserAdresses
	INSERT INTO dbo.Solt_UserAdresses
		(userAdressid, userid, adressid, enabled)
	SELECT
		ROW_NUMBER() OVER (ORDER BY u.userid),
		u.userid,
		1 + ((u.userid - 1) % 15),
		1
	FROM dbo.Solt_Users AS u
	WHERE u.userid <= 15;

	-- Solt_AuthSessions
	INSERT INTO dbo.Solt_AuthSessions
		(authSessionId, sessionId, externalUser,
		 token, refreshToken, lastUpdate,
		 userid, authPlatformId)
	SELECT
		d.userid,
		'sess-' + LOWER(LEFT(d.fname,1) + d.lname),
		NULL,
		CAST(NEWID() AS varbinary(128)),
		CAST(NEWID() AS varbinary(128)),
		GETDATE(),
		d.userid,
		1 + ABS(CHECKSUM(NEWID())) % 3
	FROM @UsersData AS d
	WHERE d.userid <= 10;


/* BLOQUE 3: Planes Features y Beneficios */

	-- Ayudas para insertar
	IF OBJECT_ID('tempdb..#Subs')        IS NOT NULL DROP TABLE #Subs;
	IF OBJECT_ID('tempdb..#Features')    IS NOT NULL DROP TABLE #Features;
	IF OBJECT_ID('tempdb..#Pairs')       IS NOT NULL DROP TABLE #Pairs;
	IF OBJECT_ID('tempdb..#NewLimits')   IS NOT NULL DROP TABLE #NewLimits;

	-- Subscripciones y precios
	IF OBJECT_ID('tempdb..#Subs') IS NOT NULL DROP TABLE #Subs;
	CREATE TABLE #Subs
	(
	  subName        NVARCHAR(50)   PRIMARY KEY,
	  subDesc        NVARCHAR(200),
	  price          DECIMAL(10,2),
	  subscriptionid INT NULL
	);

	INSERT INTO #Subs (subName, subDesc, price) VALUES
	 (N'Profesional Joven',
	  N'Paquete para profesionales jóvenes con foco en bienestar y movilidad', 59.90),
	 (N'Full Modern Family',
	  N'Paquete familiar con fitness, mascotas, transporte y entretenimiento', 139.90),
	 (N'Nómada Digital',
	  N'Paquete flexible para nómadas digitales que viajan con frecuencia',     79.90);

	DECLARE @InsertedSubs TABLE
	(
	  subName        NVARCHAR(50),
	  subscriptionid INT
	);

	-- Solt_Subscriptions
	INSERT INTO dbo.Solt_Subscriptions
	  (description, logoURL, temporary, tempPeriodStart, tempPeriodEnd, name, isCustom)
	OUTPUT inserted.name, inserted.subscriptionid
	  INTO @InsertedSubs(subName, subscriptionid)
	SELECT subDesc, NULL, 0, NULL, NULL, subName, 0
	FROM #Subs;

	UPDATE s
	SET    s.subscriptionid = i.subscriptionid
	FROM   #Subs AS s
	JOIN   @InsertedSubs AS i
	  ON  s.subName = i.subName;

	-- Solt_SubscriptionPrices
	INSERT INTO dbo.Solt_SubscriptionPrices
	  (price, postDate, isCurrent, subscriptionid, recurrencyType)
	SELECT price, SYSDATETIME(), 1, subscriptionid, 1
	FROM   #Subs;

	DECLARE @FeaturesData TABLE
	(
	  featName   NVARCHAR(40) PRIMARY KEY,
	  featDesc   NVARCHAR(100),
	  redemption TINYINT
	);

	INSERT INTO @FeaturesData(featName, featDesc, redemption)
	VALUES
	 (N'Gimnasio',         N'Acceso a gimnasios afiliados',           1),
	 (N'Lavandería',       N'Servicio de lavado y planchado básico',  1),
	 (N'Combustible',      N'Monto mensual en estaciones afiliadas',  1),
	 (N'Plan Móvil',       N'Datos y voz ilimitados con operador aliado', 2),
	 (N'Grooming Mascota', N'Baño y corte en pet-shops aliados',     1);

	-- Solt_PlanFeatures
	INSERT INTO dbo.Solt_PlanFeatures (name, description, enabled)
	SELECT featName, featDesc, 1
	FROM   @FeaturesData;

	DECLARE @InsertedFeats TABLE
	(
	  featName NVARCHAR(40) PRIMARY KEY,
	  planFeatureid INT,
	  redemption TINYINT
	);

	INSERT INTO @InsertedFeats(featName, planFeatureid, redemption)
	SELECT fd.featName,
		   pf.planFeatureid,
		   fd.redemption
	FROM dbo.Solt_PlanFeatures pf
	JOIN @FeaturesData    fd
	  ON pf.name = fd.featName;

	-- Solt_FeaturesPerPlan
	INSERT INTO dbo.Solt_FeaturesPerPlan
	  (enabled, value, inclusionDate, planFeatureid, subscriptionid)
	SELECT
	  1,
	  CASE i.featName
		WHEN N'Gimnasio' THEN N'6 h/sem'
		WHEN N'Lavandería' THEN N'4 servicios'
		WHEN N'Combustible' THEN FORMAT(CASE s.subName
									   WHEN N'Profesional Joven' THEN 50000
									   WHEN N'Full Modern Family' THEN 100000
									   ELSE 60000
									   END, 'C', 'es-CR')
		WHEN N'Plan Móvil'THEN N'Ilimitado'
		WHEN N'Grooming Mascota' THEN N'1 servicio'
	    END,
	  SYSDATETIME(),
	  i.planFeatureid,
	  s.subscriptionid
	FROM #Subs AS s
	JOIN @InsertedFeats AS i
	  ON (s.subName = N'Profesional Joven' AND i.featName IN (N'Gimnasio',N'Combustible',N'Plan Móvil'))
	  OR (s.subName = N'Full Modern Family' AND i.featName IN (N'Gimnasio',N'Lavandería',N'Combustible',N'Grooming Mascota'))
	  OR (s.subName = N'Nómada Digital' AND i.featName IN (N'Gimnasio',N'Combustible',N'Plan Móvil'));

	DECLARE @MoneyFeatId INT = 
	  (SELECT planFeatureid FROM @InsertedFeats WHERE featName = N'Combustible');

	CREATE TABLE #Pairs(subscriptionid INT, balance INT);
	INSERT INTO #Pairs(subscriptionid, balance)
	SELECT subscriptionid,
		   CASE subName
			 WHEN N'Profesional Joven' THEN 50000
			 WHEN N'Full Modern Family' THEN 100000
			 ELSE 60000
		   END
	FROM #Subs;

	CREATE TABLE #NewLimits(limitBalanceid INT);
	-- Solt_LimitBalance
	INSERT INTO dbo.Solt_LimitBalance
	(balance, lastBalance, lastUpdate, checksum, frozenAmount, limitBalanceTypeid, currencyid)
	OUTPUT inserted.limitBalanceid INTO #NewLimits
	SELECT p.balance, p.balance, SYSDATETIME(),
		   HASHBYTES('SHA2_256', CONCAT('lim', p.subscriptionid)),
		   0, 1, 1
	FROM #Pairs AS p;

	-- Solt_PlanLimits
	INSERT INTO dbo.Solt_PlanLimits
	  (numericLimit, numericLimitDesc, restricted_scheduleid, renewal_scheduleid, planFeatureid, limitBalanceid)
	SELECT NULL, NULL, NULL, NULL, @MoneyFeatId, nl.limitBalanceid
	FROM   #NewLimits nl;

	-- Solt_Schedules
	DECLARE @MensualId INT, @AnualId INT;
	INSERT INTO dbo.Solt_Schedules (name, recurrencyType, [repeat], endType, startDate)
	VALUES
	  (N'Mensual', 1, 1, 0, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)),
	  (N'Anual'  , 3, 1, 0, DATEFROMPARTS(YEAR(GETDATE()), 1, 1));
	SELECT @MensualId = MIN(scheduleid) FROM dbo.Solt_Schedules WHERE name = N'Mensual';
	SELECT @AnualId   = MIN(scheduleid) FROM dbo.Solt_Schedules WHERE name = N'Anual';

	-- Solt_PlansPerGroup
	INSERT INTO dbo.Solt_PlansPerGroup
	  (acquisitionDate, subscriptionid, userGroupid, enabled, scheduleid)
	SELECT DATEADD(day, -ABS(CHECKSUM(NEWID()))%20, GETDATE()),
		   s.subscriptionid, ug.userGroupid, 1, @MensualId
	FROM dbo.Solt_UserGroups AS ug
	JOIN #Subs AS s
	  ON s.subscriptionid = ug.userGroupid
	WHERE ug.userGroupid <= 3;

/* Bloque 4: Proovedores, acuerdos y relaciones */
	
	-- Solt_Modules
	INSERT INTO dbo.Solt_Modules(moduleId,name) VALUES
	 (1,N'Cobro Suscripción'),
	 (2,N'Procesador Pagos'),
	 (3,N'Reintento Automático');

	-- Solt_Partners
	DECLARE @Partners TABLE(name NVARCHAR(100), adressId INT);
	INSERT INTO @Partners VALUES
	 (N'SmartFit Costa Rica',1),
	 (N'WashIt Laundry',2),
	 (N'EcoFuel Stations',3),
	 (N'Kolbi Telecom',4),
	 (N'PetGroom CR',5),
	 (N'Healthy Meals Co.',6),
	 (N'Urban Parking',7);

	INSERT INTO dbo.Solt_Partners(name,startDate,endDate,enabled,partnerAdressId)
	SELECT name,'2024-01-01',NULL,1,adressId
	FROM   @Partners;

	-- Solt_PartnersDeals
	INSERT INTO dbo.Solt_PartnerDeals
			(partnerId,sealDate,expirationDate,enabled,dealDescription,dealTypeId)
	SELECT p.partnerId,
		   '2025-01-01',NULL,1,
		   CASE p.name
			 WHEN N'SmartFit Costa Rica' THEN N'10 % de descuento en membresías'
			 WHEN N'WashIt Laundry' THEN N'20 % de descuento en lavandería'
			 WHEN N'EcoFuel Stations' THEN N'3 % de cashback en combustible'
			 WHEN N'Kolbi Telecom' THEN N'Plan móvil ilimitado a precio preferencial'
			 WHEN N'PetGroom CR' THEN N'Primer grooming gratis al mes'
			 WHEN N'Healthy Meals Co.' THEN N'15 % de descuento en menús saludables'
			 WHEN N'Urban Parking' THEN N'5 % de cashback en estacionamientos'
		   END,
		   CASE p.name
			 WHEN N'EcoFuel Stations' THEN 2
			 WHEN N'Urban Parking' THEN 2
			 WHEN N'PetGroom CR' THEN 3
			 ELSE 1
		   END
	FROM dbo.Solt_Partners p;

	-- Solt_FeaturePerDeal
	INSERT INTO dbo.Solt_FeaturePerDeal
			(partnerDealId,planFeatureId,solturaShare,partnerShare,totalCost)
	SELECT pd.partnerDealId,
		   pf.planFeatureId,
		   x.solturaShare,
		   x.partnerShare,
		   100.00
	FROM (VALUES
		  (N'SmartFit Costa Rica', N'Gimnasio'        ,25,75),
		  (N'WashIt Laundry'     , N'Lavandería'      ,30,70),
		  (N'EcoFuel Stations'   , N'Combustible'     ,20,80),
		  (N'Kolbi Telecom'      , N'Plan Móvil'      ,35,65),
		  (N'PetGroom CR'        , N'Grooming Mascota',40,60),
		  (N'Healthy Meals Co.'  , N'Lavandería'      ,25,75),
		  (N'Urban Parking'      , N'Combustible'     ,20,80)
		 ) AS x (partnerName,featName,solturaShare,partnerShare)
	JOIN dbo.Solt_Partners     p  ON p.name       = x.partnerName
	JOIN dbo.Solt_PartnerDeals pd ON pd.partnerId = p.partnerId
	JOIN dbo.Solt_PlanFeatures pf ON pf.name      = x.featName;

	-- Solt_PartnerPaymentMethods
	INSERT INTO dbo.Solt_PartnerPaymentMethods
			(partnerObligationId,availableMethodId,enabled,establishmentDate)
	SELECT pd.partnerDealId, am.availableMethodId, 1, '2024-01-01'
	FROM   dbo.Solt_PartnerDeals       pd
	CROSS  JOIN (VALUES (1),(2),(3))  AS am(availableMethodId)  -- Visa, Master, PayPal
	WHERE  pd.enabled = 1;

	-- Solt_PayErrorTypes
	IF NOT EXISTS (SELECT 1 FROM dbo.Solt_PayErrorTypes)
	INSERT INTO dbo.Solt_PayErrorTypes(payErrorTypeId,name) VALUES
	 (1,N'Tarjeta Rechazada'),
	 (2,N'Fondos Insuficientes'),
	 (3,N'Error Red'),
	 (4,N'Token Expirado');

	-- Solt_PaymentAttempts
	INSERT INTO dbo.Solt_PaymentAttempts
			(paymentAttemptId,amount,currentAmount,userId,moduleId,chargeToken,
			 description,result,statusTypeId,creationDate,currencyId,availableMethodId,
			 checksum,payErrorTypeId)
	VALUES
	 (1,59.9000,59.9000,1,2,0x74786E31,
	  N'Cobro Suscripción Abril',N'Aprobado',
	  1,GETDATE(),1,1,
	  0xAAAA,1),

	 (2,139.9000,139.9000,5,2,0x74786E32,
	  N'Compra lavado x4',N'Aprobado',
	  1,GETDATE(),1,2,
	  0xBBBB,1),

	 (3,52500.0000,52500.0000,3,2,0x74786E33,
	  N'Cobro combustible',N'Aprobado',
	  1,GETDATE(),1,3,
	  0xCCCC,1);

	-- Solt_PartnerPaymentMethods
	DECLARE @PPMData TABLE
	(
	  partnerDealid INT,
	  availableMethodId INT,
	  establishmentDate DATE
	);
	INSERT INTO @PPMData VALUES
	 (1,1,'2024-01-01'),
	 (1,2,'2024-01-01'),
	 (2,1,'2024-02-15'),
	 (3,1,'2023-11-01'),
	 (3,3,'2023-11-01'),
	 (4,2,'2022-05-10'),
	 (5,1,'2024-03-20'),
	 (6,1,'2024-01-25'),
	 (6,3,'2024-01-25'),
	 (7,1,'2023-09-30');

	INSERT INTO dbo.Solt_PartnerPaymentMethods
	  (partnerObligationId, availableMethodId, enabled, establishmentDate)
	SELECT
	  partnerDealid,
	  availableMethodId,
	  1,
	  establishmentDate
	FROM @PPMData;

/* Bloque 5: Calendario y Lógica de Uso */

	-- Solt_TransactionTypes
	DECLARE @TxnTypes TABLE
	(
	  transactionTypeId TINYINT PRIMARY KEY,
	  [name] NVARCHAR(50)
	);

	INSERT INTO @TxnTypes (transactionTypeId, [name])
	VALUES
	  (1, N'Cargo'),
	  (2, N'Abono'),
	  (3, N'Ajuste');

	INSERT INTO dbo.Solt_TransactionTypes (transactionTypeId, [name])
	SELECT transactionTypeId, [name]
	FROM   @TxnTypes;

	-- Solt_TransactionSubTypes
	DECLARE @TxnSubTypes TABLE
	(
	  transactionSubTypeId TINYINT PRIMARY KEY,
	  [name] NVARCHAR(100)
	);

	INSERT INTO @TxnSubTypes (transactionSubTypeId, [name])
	VALUES
	  (1, N'Cobro Suscripción Mensual'),
	  (2, N'Compra de Servicio'),
	  (3, N'Reembolso'),
	  (4, N'Cashback'),
	  (5, N'Penalidad por Mora');

	INSERT INTO dbo.Solt_TransactionSubTypes (transactionSubTypeId, [name])
	SELECT transactionSubTypeId, [name]
	FROM @TxnSubTypes;

	-- Solt_Transactions
	DECLARE @TransactionsData TABLE
	(
	  transactionId INT PRIMARY KEY,
	  amount MONEY,
	  userId INT,
	  personId INT,
	  description NVARCHAR(200),
	  transDateTime DATETIME2,
	  postTime DATETIME2,
	  transactionTypeId TINYINT,
	  transactionSubTypeId TINYINT,
	  currencyId INT,
	  paymentAttemptId INT,
	  refNumber NVARCHAR(50),
	  checksum VARBINARY(500)
	);

	INSERT INTO @TransactionsData
	VALUES
	  (1, CAST(59.90  AS money), 1, 1, N'Cobro mensual Profesional Joven', GETDATE(), GETDATE(), 1, 1, 1, 1, N'TX-0001', CONVERT(varbinary(500),'chk-tx-1')),
	  (2, CAST(139.90 AS money), 5, 5, N'Compra lavado x4 Full Modern Family', GETDATE(), GETDATE(), 1, 2, 1, 2, N'TX-0002', CONVERT(varbinary(500),'chk-tx-2')),
	  (3, CAST(52500.0 AS money), 3, 3, N'Cobro combustible EcoFuel Stations', GETDATE(), GETDATE(), 1, 3, 1, 3, N'TX-0003', CONVERT(varbinary(500),'chk-tx-3')),
	  (4, CAST(79.90  AS money), 2, 2, N'Reembolso cashback WashIt Laundry', GETDATE(), GETDATE(), 3, 4, 1, 2, N'TX-0004', CONVERT(varbinary(500),'chk-tx-4')),
	  (5, CAST(100000 AS money), 4, 4, N'Cobro plan Kolbi Telecom', GETDATE(), GETDATE(), 1, 1, 1, NULL, N'TX-0005', CONVERT(varbinary(500),'chk-tx-5'));

	INSERT INTO dbo.Solt_Transactions
	(
	  transactionId, amount, userId,
	  personId, description, transDateTime,
	  postTime, transactionTypeId, transactionSubTypeId,
	  currencyId, paymentAttemptId, refNumber, checksum
	)
	SELECT
	  transactionId, amount, userId,
	  personId, description, transDateTime,
	  postTime, transactionTypeId, transactionSubTypeId,
	  currencyId, paymentAttemptId, refNumber, checksum
	FROM @TransactionsData;

	-- Solt_ScheduleDetails
	DECLARE @SchedDetails TABLE
	(
	  code NVARCHAR(20) PRIMARY KEY,
	  datePart NVARCHAR(2)
	);

	INSERT INTO @SchedDetails (code, datePart)
	VALUES
	  (N'Mensual', N'MM'),
	  (N'Anual', N'YY');

	INSERT INTO dbo.Solt_ScheduleDetails
	  (scheduleid, enabled, baseDate, datePart, lastExecution, nextExecution)
	SELECT
	  s.scheduleid, 1,
	  CASE WHEN sd.datePart = N'MM'
		   THEN DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)
		   ELSE DATEFROMPARTS(YEAR(GETDATE()), 1, 1)
	  END AS baseDate,
	  sd.datePart,
	  NULL,
	  CASE WHEN sd.datePart = N'MM'
		   THEN DATEADD(MONTH,1,DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()),1))
		   ELSE DATEADD(YEAR, 1, DATEFROMPARTS(YEAR(GETDATE()),1,1))
	  END AS nextExecution
	FROM @SchedDetails AS sd
	JOIN dbo.Solt_Schedules AS s
	  ON s.name LIKE sd.code + '%';

/* Bloque 6: Redención de Beneficios */

	-- Solt_RedemptionCodes
	DECLARE @CodesData TABLE
	(
	  redemptionCodeid INT, 
	  code NVARCHAR(50),
	  redemptionStatusid TINYINT,
	  creationTime DATETIME2,
	  expirationTime DATETIME2,
	  userid INT,
	  methodid TINYINT,
	  metadataJson NVARCHAR(MAX)
	);

	INSERT INTO @CodesData
	VALUES
	 (1, N'QR-GYM-u1-202504', 1, SYSDATETIME(), DATEADD(MONTH,1,SYSDATETIME()), 1, 1, N'{"feature":"Gimnasio"}'),
	 (2, N'NFC-FUEL-u2-202504',1, SYSDATETIME(), DATEADD(MONTH,1,SYSDATETIME()), 2, 2, N'{"feature":"Combustible"}'),
	 (3, N'BAR-LAUN-u3-202504',1, SYSDATETIME(), DATEADD(MONTH,1,SYSDATETIME()), 3, 3, N'{"feature":"Lavandería"}');

	INSERT INTO dbo.Solt_RedemptionCodes
	  (redemptionCodeid, code, redemptionStatusid,
	   creationTime, expirationTime, userid,
	   methodid, metadataJson)
	SELECT
	  redemptionCodeid, code, redemptionStatusid,
	  creationTime, expirationTime, userid,
	  methodid, metadataJson
	FROM   @CodesData;

	-- Solt_RedemptionDetails
	DECLARE @DetailsData TABLE
	(
	  code NVARCHAR(50),
	  addressid INT,
	  featureName NVARCHAR(40),
	  transactionid INT,
	  partnerName NVARCHAR(100),
	  methodid TINYINT
	);

	INSERT INTO @DetailsData
	VALUES
	 (N'QR-GYM-u1-202504', 1, N'Gimnasio', 1, N'SmartFit Costa Rica', 1),
	 (N'NFC-FUEL-u2-202504',2, N'Combustible', 2, N'EcoFuel Stations', 2),
	 (N'BAR-LAUN-u3-202504',3, N'Lavandería', 3, N'WashIt Laundry', 3);

	INSERT INTO dbo.Solt_RedemptionDetails
	  (addressid, planFeatureid, transactionid, partnerid, methodid)
	SELECT
	  d.addressid, pf.planFeatureid, d.transactionid,
	  p.partnerid, d.methodid
	FROM @DetailsData AS d
	JOIN dbo.Solt_PlanFeatures AS pf
	ON pf.name = d.featureName
	JOIN dbo.Solt_Partners AS p
	ON p.name = d.partnerName;

/* Bloque 7: Logging y Media */

	-- Solt_LogSeverity
	DECLARE @LogSeverityData TABLE(logseverityid TINYINT, name NVARCHAR(50));
	INSERT INTO @LogSeverityData VALUES
	  (1,N'Info'),
	  (2,N'Warning'),
	  (3,N'Error'),
	  (4,N'Critical');

	INSERT INTO dbo.Solt_LogSeverity (logseverityid, name)
	SELECT logseverityid, name
	FROM   @LogSeverityData;

	-- Solt_LogSources
	DECLARE @LogSourcesData TABLE(logsourceid TINYINT, name NVARCHAR(50));
	INSERT INTO @LogSourcesData VALUES
	  (1,N'API'),
	  (2,N'Web'),
	  (3,N'Mobile'),
	  (4,N'Scheduler');

	SET IDENTITY_INSERT dbo.Solt_LogSources ON;
	INSERT INTO dbo.Solt_LogSources (logsourceid, name)
	SELECT logsourceid, name
	FROM   @LogSourcesData;
	SET IDENTITY_INSERT dbo.Solt_LogSources OFF;

	-- Solt_LogTypes
	DECLARE @LogTypesData TABLE
	(
	  logtypeid TINYINT,
	  name NVARCHAR(50),
	  ref1Desc NVARCHAR(50),
	  ref2Desc NVARCHAR(50),
	  val1Desc NVARCHAR(50),
	  val2Desc NVARCHAR(50)
	);
	INSERT INTO @LogTypesData VALUES
	  (1, N'Autenticación', N'userId', NULL, N'IP', NULL),
	  (2, N'Pago', N'paymentAttemptId', N'transId', N'monto', N'currency'),
	  (3, N'Subscripción', N'subscriptionId', NULL, N'estadoAnt', N'estadoNuevo'),
	  (4, N'Sync-Partner', N'partnerId', NULL, N'resultado', NULL),
	  (5, N'Redeems', N'partnerId', NULL, N'resultado', NULL);

	SET IDENTITY_INSERT dbo.Solt_LogTypes ON;
	INSERT INTO dbo.Solt_LogTypes (logtypeid, name, ref1Desc, ref2Desc, val1Desc, val2Desc)
	SELECT logtypeid, name, ref1Desc, ref2Desc, val1Desc, val2Desc
	FROM   @LogTypesData;
	SET IDENTITY_INSERT dbo.Solt_LogTypes OFF;

	-- Solt_MediaTypes
	DECLARE @MediaTypesData TABLE(mediaTypeid TINYINT, name NVARCHAR(50), impPlayer NVARCHAR(200));
	INSERT INTO @MediaTypesData VALUES
	  (1, N'Imagen', N'<img src="...">'),
	  (2, N'Video', N'<video src="...">'),
	  (3, N'PDF', N'<iframe src="...">');

	SET IDENTITY_INSERT dbo.Solt_MediaTypes ON;
	INSERT INTO dbo.Solt_MediaTypes (mediaTypeid, name, impPlayer)
	SELECT mediaTypeid, name, impPlayer
	FROM @MediaTypesData;
	SET IDENTITY_INSERT dbo.Solt_MediaTypes OFF;

	-- Solt_MediaFile
	DECLARE @MediaFileData TABLE
	(
	  mediaFileid INT,
	  name NVARCHAR(200),
	  url NVARCHAR(500),
	  deleted BIT,
	  lastUpdate DATETIME2,
	  uploadDate DATE,
	  mediaTypeid TINYINT
	);
	INSERT INTO @MediaFileData VALUES
	  (1, N'Gym_10off.jpeg', N'https://cdn.soltura.com/img/gym10.jpg', 0, GETDATE(), '2025-04-15', 1),
	  (2, N'Fuel_Cashback.mp4', N'https://cdn.soltura.com/vid/fuelcashback.mp4',0, GETDATE(), '2025-04-15', 2),
	  (3, N'LaundryPromo.pdf', N'https://cdn.soltura.com/pdf/laundry.pdf', 0, GETDATE(), '2025-04-15', 3);

	SET IDENTITY_INSERT dbo.Solt_MediaFile ON;
	INSERT INTO dbo.Solt_MediaFile (mediaFileid, name, url, deleted, lastUpdate, uploadDate, mediaTypeid)
	SELECT mediaFileid, name, url, deleted, lastUpdate, uploadDate, mediaTypeid
	FROM @MediaFileData;
	SET IDENTITY_INSERT dbo.Solt_MediaFile OFF;

	-- Solt_DealMedia
	DECLARE @DealMediaData TABLE(dealMediaid INT, partnerDealid INT, mediaFileid INT);
	INSERT INTO @DealMediaData VALUES
	  (1, 1, 1),
	  (2, 3, 2),
	  (3, 2, 3);

	SET IDENTITY_INSERT dbo.Solt_DealMedia ON;
	INSERT INTO dbo.Solt_DealMedia (dealMediaid, partnerDealid, mediaFileid)
	SELECT d.dealMediaid, d.partnerDealid, d.mediaFileid
	FROM @DealMediaData AS d
	JOIN dbo.Solt_PartnerDeals AS pd ON pd.partnerDealid = d.partnerDealid
	JOIN dbo.Solt_MediaFile AS mf ON mf.mediaFileid = d.mediaFileid;
	SET IDENTITY_INSERT dbo.Solt_DealMedia OFF;

	-- Solt_Log
	ALTER TABLE Solt_Log ALTER COLUMN checksum VARBINARY(MAX);
	DECLARE @LogData TABLE
	(
	  logid INT,
	  description NVARCHAR(200),
	  postTime DATETIME2,
	  computer NVARCHAR(100),
	  username NVARCHAR(100),
	  trace NVARCHAR(MAX),
	  referenceId1 INT,
	  referenceId2 INT,
	  value1 NVARCHAR(100),
	  value2 NVARCHAR(100),
	  checksum VARBINARY(500),
	  logtypeid TINYINT,
	  logsourceid TINYINT,
	  logseverityid TINYINT
	);
	-- Abrir la llave simétrica usando el certificado
	OPEN SYMMETRIC KEY DataEncryption
	DECRYPTION BY CERTIFICATE CertGeneral;
	INSERT INTO @LogData VALUES
	  (1, N'Login correcto', GETDATE(), N'SRV-API-01', N'user1', NULL, 1, 0, N'192.168.0.10', NULL, 
	   EncryptByKey(Key_GUID('DataEncryption'), 'USR:' + N'user2' + '|AMT:' + N'59.90' + '|CUR:' + N'USD' + 
	    '|DATE:' + CONVERT(NVARCHAR(23), GETDATE(), 121) + '|RAND:' + 
	    CONVERT(NVARCHAR(36), NEWID()) + '|EVT:Pago'), 1, 1, 1),
	  
	  (2, N'Pago aprobado', GETDATE(), N'WEB-01', N'user2', NULL, 1, 1, N'59.90', N'USD', 
	   EncryptByKey(Key_GUID('DataEncryption'), 'USR:system|ERR:Timeout|CODE:HTTP 504|DATE:' + 
	    CONVERT(NVARCHAR(23), GETDATE(), 121) + '|RAND:' + 
	    CONVERT(NVARCHAR(36), NEWID()) + '|EVT:SyncFail'), 2, 2, 1),
	  
	  (3, N'Sync partner #3 falló', GETDATE(), N'SCH-01', N'system', 'Timeout consultando API', 3, 0, N'HTTP 504', NULL, 
	   EncryptByKey(Key_GUID('DataEncryption'), 'USR:system|ERR:Timeout|CODE:HTTP 504|DATE:' + 
	    CONVERT(NVARCHAR(23), GETDATE(), 121) + '|RAND:' + 
	    CONVERT(NVARCHAR(36), NEWID()) + '|EVT:SyncFail'), 4, 4, 3);

	-- Cerrar la llave simétrica después de usarla
	CLOSE SYMMETRIC KEY DataEncryption;

	SET IDENTITY_INSERT dbo.Solt_Log ON;
	INSERT INTO dbo.Solt_Log
	  (logid, description, postTime, computer, username,
	   trace, referenceId1, referenceId2,
	   value1, value2, checksum,
	   logtypeid, logsourceid, logseverityid)
	SELECT
	  logid, description, postTime, computer, username,
	  trace, referenceId1, referenceId2,
	  value1, value2, checksum,
	  logtypeid, logsourceid, logseverityid
	FROM   @LogData;
	SET IDENTITY_INSERT dbo.Solt_Log OFF;

    PRINT 'Query ejecutado correctamente';
END TRY
BEGIN CATCH
    DECLARE
        @Msg NVARCHAR(2048) = ERROR_MESSAGE(),
        @Ln INT = ERROR_LINE(),
        @Nr INT = ERROR_NUMBER();

    RAISERROR('[%d] Línea %d: %s', 16, 1, @Nr, @Ln, @Msg);
END CATCH;

SELECT * FROM Solt_Currencies;
SELECT * FROM Solt_CurrencyConversions;
SELECT * FROM Solt_ContactInfoTypes;
SELECT * FROM Solt_GroupType;
SELECT * FROM Solt_LimitBalanceTypes;
SELECT * FROM Solt_RedemptionMethod;
SELECT * FROM Solt_DealType;
SELECT * FROM Solt_StatusTypes;
SELECT * FROM Solt_Countries;
SELECT * FROM Solt_States;
SELECT * FROM Solt_Cities;
SELECT * FROM Solt_UserPersons;
SELECT * FROM Solt_Users;
SELECT * FROM Solt_ContactInfoPerson;
SELECT * FROM Solt_PaymentMethods;
SELECT * FROM Solt_AvailableMethods;
SELECT * FROM Solt_MethodPerUser;
SELECT * FROM Solt_UserAdresses;
SELECT * FROM Solt_Adresses;
SELECT * FROM Solt_UserGroups;
SELECT * FROM Solt_UserPerGroup;
SELECT * FROM Solt_AuthPlatforms;
SELECT * FROM Solt_AuthSessions;
SELECT * FROM Solt_Subscriptions;
SELECT * FROM Solt_SubscriptionPrices;
SELECT * FROM Solt_PlanFeatures;
SELECT * FROM Solt_FeaturesPerPlan;
SELECT * FROM Solt_PlanLimits;
SELECT * FROM Solt_Schedules;
SELECT * FROM Solt_LimitBalance;
SELECT * FROM Solt_PlansPerGroup;
SELECT * FROM Solt_Modules;
SELECT * FROM Solt_Partners;
SELECT * FROM Solt_PartnerDeals;
SELECT * FROM Solt_FeaturePerDeal;
SELECT * FROM Solt_PayErrorTypes;
SELECT * FROM Solt_PaymentAttempts;
SELECT * FROM Solt_PartnerPaymentMethods;
SELECT * FROM Solt_ScheduleDetails;
SELECT * FROM Solt_TransactionTypes;
SELECT * FROM Solt_TransactionSubTypes;
SELECT * FROM Solt_Transactions;
SELECT * FROM Solt_RedemptionCodes;
SELECT * FROM Solt_RedemptionDetails;
SELECT * FROM Solt_Log;
SELECT * FROM Solt_LogTypes;
SELECT * FROM Solt_LogSeverity;
SELECT * FROM Solt_LogSources;
SELECT * FROM Solt_MediaFile;
SELECT * FROM Solt_MediaTypes;
SELECT * FROM Solt_DealMedia;
GO
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
## Uso de MERGE para sincronizar datos de planes
```sql
DECLARE @StagingPlans TABLE
(
  Name NVARCHAR(50) PRIMARY KEY,
  Description NVARCHAR(200)
);

INSERT INTO @StagingPlans (Name, Description) VALUES
  (N'Profesional Joven', N'Paquete actualizado para profesionales jóvenes'),
  (N'Full Modern Family', N'Paquete familiar con más beneficios'),
  (N'Nómada Digital', N'Paquete flexible para viajeros frecuentes'),
  (N'Plan VIP', N'Nuevo plan VIP con acceso ilimitado');

MERGE dbo.Solt_Subscriptions AS target
USING @StagingPlans AS src
  ON target.Name = src.Name

WHEN MATCHED THEN
  UPDATE SET
    target.Description = src.Description

WHEN NOT MATCHED BY TARGET THEN
  INSERT (description, logoURL, temporary, tempPeriodStart, tempPeriodEnd, name, isCustom)
  VALUES (src.Description, NULL, 0, NULL, NULL, src.Name, 0)

WHEN NOT MATCHED BY SOURCE THEN
  DELETE;
SELECT subscriptionId, name, description
FROM dbo.Solt_Subscriptions
ORDER BY name;
```

## Uso de LTRIM para limpiar strings.
```sql
CREATE OR ALTER PROCEDURE dbo.CleanAddress
  @Line1 NVARCHAR(200),
  @Line2 NVARCHAR(200) = NULL
AS
BEGIN
  SET NOCOUNT ON;
  SELECT
    @Line1 AS OriginalLine1,
    LTRIM(@Line1) AS CleanLine1,
    ISNULL(@Line2, '<NULL>') AS OriginalLine2,
    CASE 
      WHEN @Line2 IS NULL THEN '<NULL>' 
      ELSE LTRIM(@Line2) 
    END AS CleanLine2;
END;
GO

EXEC dbo.CleanAddress
  @Line1 = '   Residencial Vista Verde #12',
  @Line2 = '  Apt. 5B';
EXEC dbo.CleanAddress
  @Line1 = '123 Main St',
  @Line2 = NULL;
EXEC dbo.CleanAddress
  @Line1 = '   Calle Luján Calle 3 Ave 2',
  @Line2 = '   Primer Piso';
GO
```

## Uso de AVG con agrupamiento.
```sql
-- Promedio de montos de transacciones por usuario
SELECT
  t.userId,
  u.username AS Usuario,
  COUNT(*) AS TotalTransacciones,
  AVG(t.amount) AS PromedioMonto
FROM dbo.Solt_Transactions AS t
JOIN dbo.Solt_Users AS u
  ON u.userId = t.userId
GROUP BY
  t.userId,
  u.username
ORDER BY
  PromedioMonto DESC;
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
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Solt_Transactions TO SoporteTecnico;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Solt_PaymentAttempts TO SoporteTecnico;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Solt_TransactionSubTypes TO SoporteTecnico;
DENY SELECT, INSERT, UPDATE, DELETE ON dbo.Solt_TransactionTypes TO SoporteTecnico;
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
## Permitir ejecución de ciertos SPs y denegar acceso directo a las tablas que ese SP utiliza, será que aunque tengo las tablas restringidas, puedo ejecutar el SP?
Vamos a darle acceso al rol de soporte que no tenía permisos de nada, al SP de ConvertirMoneda.
```sql
GRANT EXECUTE ON dbo.ConvertirMonedaTransacciones TO SoporteTecnico;
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
### READ UNCOMMITTED
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
### READ COMMITTED
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
### REPEATABLE READ
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
### SERIALIZABLE
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

### Transacción de volumen
Se considera que la transacción de volumen en la plataforma de Soltura es el Canjeo. Al ser una aplicación centrada en los beneficios que brindan distintos proveedores, los canjes son la actividad principal de todo usuario. Estos pueden darse varias veces al día. Por este motivo, es vital medir su nivel de eficiencia. Esta transacción es un pilar central en el sistema de Soltura.
#### Calcular TPS
Para calcular el número de transacciones que se pueden realizar por segundo, es necesario hacer uso de herramientas externas. En este caso, la herramienta SQLQueryStress resulta conveniente para abrir una serie de threads y ejecutar la transacción de canjeo un número determinado de veces.   

![image](https://github.com/user-attachments/assets/03c12876-a0b0-4ad1-a864-7953afeeddfd)
SQLQueryStress muestra varias estadísticas. Entre ellas la cantidad de segundos que tarda un proceso en terminarse a nivel de cliente. Se trabajará con una saturación máxima en el CPU de un 70%. Calcular las transacciones por segundo de canjes en esta aplicación es vital para entender el nivel de eficiencia que maneja Soltura.
#### Triplicar el valor
Si queremos triplicar el valor de las transacciones por segundo, es vital distribuir la carga en varios threads. Si se conectan más hilos, se repartirá la carga entre diferentes puntos de acceso. Obteniendo así una menor carga en una sola línea de consultas y transacciones más rápidas sin necesidad de modificar hardware ni queries.

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
## Imagine una cosulta que el sistema va a necesitar para mostrar cierta información, o reporte o pantalla, y que esa consulta vaya a requerir:
## 4 JOINs entre tablas.
## 2 funciones agregadas (ej. SUM, AVG).
## 3 subconsultas or 3 CTEs
## Un CASE, CONVERT, ORDER BY, HAVING, una función escalar, y operadores como IN, NOT IN, EXISTS.
## Escriba dicha consulta y ejecutela con el query analizer, utilizando el analizador de pesos y costos del plan de ejecución, reacomode la consulta para que sea más eficiente sin necesidad de agregar nuevos índices.

```sql
-- 0) Función escalar de ejemplo
CREATE OR ALTER FUNCTION dbo.fn_CalcDiscount(@total MONEY)
RETURNS MONEY
AS
BEGIN
  RETURN CASE WHEN @total > 1000 THEN @total * 0.02 ELSE 0 END;
END;
GO

;WITH
-- 1) Intentos del último mes
CTE_Attempts AS (
  SELECT
    pa.userId,
    pa.amount,
    pa.creationDate,
    pa.currencyId
  FROM dbo.Solt_PaymentAttempts AS pa
  WHERE pa.creationDate >= DATEADD(MONTH, -1, GETDATE())
),

-- 2) Estadísticas por usuario
CTE_Stats AS (
  SELECT
    a.userId,
    COUNT(*) AS AttemptCount,
    SUM(a.amount) AS TotalAmount,
    AVG(a.amount) AS AvgAmount,
    MAX(a.currencyId) AS currencyId
  FROM CTE_Attempts AS a
  GROUP BY a.userId
  HAVING COUNT(*) > 0
),

-- 3) Fecha del primer intento
CTE_FirstAttempt AS (
  SELECT
    userId,
    MIN(creationDate) AS FirstAttemptDate
  FROM dbo.Solt_PaymentAttempts
  GROUP BY userId
)

SELECT
  u.userId,
  CONCAT(up.name, ' ',
         up.firstLastname,
         COALESCE(' ' + up.secondLastname, ''))
		 AS FullName,
  s.AttemptCount,
  s.TotalAmount,
  s.AvgAmount,
  CASE 
    WHEN s.TotalAmount > 100 THEN N'High Spender' 
    ELSE N'Regular' 
  END AS UserTier,
  CONVERT(VARCHAR(10), fa.FirstAttemptDate, 103) AS SignupDate,
  dbo.fn_CalcDiscount(s.TotalAmount) AS Discount,
  c.acronym AS Currency
FROM CTE_Stats AS s
JOIN CTE_FirstAttempt AS fa ON fa.userId = s.userId
JOIN dbo.Solt_Users AS u ON u.userId = s.userId
JOIN dbo.Solt_UserPersons AS up ON up.userId = u.userId
JOIN dbo.Solt_Currencies AS c ON c.currencyId = s.currencyId

WHERE u.enabled = 1  
  AND EXISTS (
    SELECT 1
    FROM dbo.Solt_UserPerGroup gp
    WHERE gp.userId = u.userId)
  AND c.acronym NOT IN ('EUR')

ORDER BY s.TotalAmount DESC;
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
DROP PROCEDURE IF EXISTS [dbo].[SP_UpdateProviderContract];
DROP TYPE IF EXISTS [dbo].[ContractConditionsTableType];


CREATE TYPE [dbo].[ContractConditionsTableType] AS TABLE
(
    [itemId] INT,
    [condition] VARCHAR(200)
);
GO

-- Procedimiento Almacenado para actualizar/insertar contratos de proveedor
CREATE PROCEDURE [dbo].[SP_UpdateProviderContract]
(
    @partnerId INT,
    @partnerName VARCHAR(200),
    @contractConditions [dbo].[ContractConditionsTableType] READONLY
)
AS
BEGIN
    SET XACT_ABORT ON;
    BEGIN TRANSACTION;

    -- Declarar variable para el ID del proveedor
    DECLARE @existingPartnerId INT;

    -- Verificar si el proveedor existe
    SELECT @existingPartnerId = partnerid
    FROM Solt_Partners
    WHERE partnerid = @partnerId;

    -- Si el proveedor no existe, insertarlo
    IF @existingPartnerId IS NULL
    BEGIN
        INSERT INTO Solt_Partners (name, startDate, enabled, partnerAdressid)  -- Agregado startDate y enabled
        VALUES (@partnerName, GETDATE(), 1, 1);  -- Agregado valores por defecto
        SET @partnerId = SCOPE_IDENTITY(); -- Obtener el nuevo ID del proveedor
    END

    -- Actualizar o insertar condiciones del contrato
    MERGE INTO Solt_PartnerDeals AS target
    USING @contractConditions AS source
        ON target.partnerid = @partnerId AND target.dealTypeid = source.itemId  -- Usando dealTypeid como itemId
    WHEN MATCHED THEN
        UPDATE SET target.dealDescription = source.condition  -- Actualizando dealDescription
    WHEN NOT MATCHED THEN
        INSERT (partnerid, sealDate, enabled, dealDescription, dealTypeid)  -- Campos requeridos para la inserción
        VALUES (@partnerId, GETDATE(), 1, source.condition, source.itemId); -- Agregado valores por defecto
    --WHEN NOT MATCHED BY SOURCE THEN  -- Removido para evitar borrado inesperado
    --    DELETE;

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

SELECT * FROM Solt_Partners;
SELECT * FROM Solt_PartnerDeals;

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
    u.username as Username,
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
# Migración de AppAsistant
## Collections de Mongo
### Collection: Solt_News
```json
{
  "_id": {
    "$oid": "6815700bddf41ed3002dcd97"
  },
  "newsid": 2,
  "mainTitle": "Soltura lanza integración con Google Pay para usuarios de AppAsistant",
  "abstract": "Desde el 15 de noviembre, los usuarios de Soltura con cuentas en AppAsistant podrán vincular sus membresías directamente a Google Pay para acceder a beneficios sin necesidad de la app",
  "postDate": "2025-06-05T00:00:00Z",
  "image": "https://imgURL.com/google-pay-integration.jpg",
  "subHeadlines": [
    {
      "outerTitle": "Cómo activar la función",
      "relevantDetails": [
        {
          "innerTitle": "Paso a paso",
          "messageText": "Dirígete a PERFIL > MIS MEMBRESÍAS > VINCULAR CON GOOGLE PAY. Acepta los permisos y confirma."
        },
        {
          "innerTitle": "Ventajas",
          "messageText": "Podrás usar tu membresía incluso sin conexión a internet, gracias al almacenamiento local en Google Pay."
        }
      ]
    }
  ],
  "language": "es-ES"
}
```
### Collection: Solt_Partners
```json
{
  "_id": {
    "$oid": "681679892838f8177dd1e9de"
  },
  "partnerCardid": 5,
  "name": "App Asistant",
  "logo": "https://cloud.soltura.com/partnerBanners/l5.png",
  "bannerImg": "https://cloud.soltura.com/partnerLogos/b5.png",
  "description": "Nosotros ofrecemos una plataforma que te ayudará a realizar varias tareas en una gran cantidad de aplicaciones y de todos los tipos.",
  "benefits": [
    "Subscripción incluida de la plataforma App Asistant"
  ],
  "contactInfo": [
    {
      "type": "Phone",
      "value": "8888-8888"
    },
    {
      "type": "website",
      "value": "https://appasistant.com"
    }
  ]
}
```
### Collection: Solt_HomeBanners
```json
{
  "_id": {
    "$oid": "681671582838f8177dd1e9c4"
  },
  "bannerid": 2,
  "title": "Soltura adquire App Asistant!",
  "isFeatured": true,
  "image": "https://cloud.soltura.com/bannerImgs/b2.png",
  "link": "/solturaNews.html",
  "linkText": "Aprende como migrarte aquí",
  "uploadDate": "2025-05-03T09:15:00Z"
}
```

## Migración de datos a SQL

Se utilizó Python con Pandas para realizar este proceso.
Este es el archivo de Python usado para esta tarea: 

```python
import pandas as pd
from sqlalchemy import create_engine, inspect
import json

configuracionMysql = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'password': '', # no voy a leakear mi contraseña
    'database': 'appassistant'
}

configuracionSqlServer = {
    'host': 'ELIPOLIMSI', # mi nombre de compu
    'database': 'Soltura'  # nombre de db
}

def migrarTabla(motorMysql, motorSqlServer, nombreTabla, columnaIdMysql=None, columnaIdSqlServer=None, mapeoIds=None):
    try:
        dataframeMysql = pd.read_sql_table(nombreTabla, motorMysql)
        print(f"Leída tabla '{nombreTabla}' desde MySQL. Filas: {len(dataframeMysql)}")

        # Serializar a JSON la columna 'configuracionDetalles' si existe
        if 'configuracionDetalles' in dataframeMysql.columns:
            dataframeMysql['configuracionDetalles'] = dataframeMysql['configuracionDetalles'].apply(
                lambda x: json.dumps(x) if isinstance(x, dict) else x
            )

        if columnaIdMysql and columnaIdSqlServer and mapeoIds is None:
            dataframeSqlServer = pd.read_sql_query(f"SELECT TOP 0 * FROM {nombreTabla}", motorSqlServer)
            dataframeMysql.to_sql(nombreTabla, motorSqlServer, if_exists='replace', index=False)
            dataframeNuevosIds = pd.read_sql_query(f"SELECT {columnaIdMysql}, {columnaIdSqlServer} FROM {nombreTabla}", motorSqlServer)
            return dataframeNuevosIds.set_index(columnaIdMysql).to_dict()[columnaIdSqlServer]
        elif columnaIdMysql and mapeoIds:
            if columnaIdMysql in dataframeMysql.columns:
                dataframeMysql[columnaIdMysql] = dataframeMysql[columnaIdMysql].map(mapeoIds)
            dataframeMysql.to_sql(nombreTabla, motorSqlServer, if_exists='replace', index=False)
            return None
        else:
            dataframeMysql.to_sql(nombreTabla, motorSqlServer, if_exists='replace', index=False)
            return None
    except Exception as e:
        print(f"Error al migrar la tabla '{nombreTabla}': {e}")
        return None

def migrarTodoConManejoIds(configuracionMysql, configuracionSqlServer):
    motorMysql = create_engine(f"mysql+mysqlconnector://{configuracionMysql['user']}:{configuracionMysql['password']}@{configuracionMysql['host']}:{configuracionMysql['port']}/{configuracionMysql['database']}")
    motorSqlServer = create_engine(f"mssql+pyodbc://{configuracionSqlServer['host']}/{configuracionSqlServer['database']}?driver=ODBC+Driver+17+for+SQL+Server&trusted_connection=yes")
    inspectorMysql = inspect(motorMysql)
    nombresTablas = sorted(inspectorMysql.get_table_names()) 

    mapeoIdUsuarios = None

    print(f"Tablas encontradas en MySQL: {nombresTablas}")

    for nombreTabla in nombresTablas:
        print(f"\n--- Migrando tabla: {nombreTabla} ---")
        if nombreTabla == 'users':
            print("Generando mapeo de IDs para la tabla 'users'.")
            mapeoIdUsuarios = migrarTabla(motorMysql, motorSqlServer, nombreTabla, 'id', 'id') 
            if mapeoIdUsuarios:
                print(f"Mapeo de IDs de usuario generado. Ejemplo: {list(mapeoIdUsuarios.items())[:5]}")
        elif nombreTabla == 'usersAddresses':
            if mapeoIdUsuarios:
                print("Actualizando 'userID' en 'usersAddresses' con los nuevos IDs de usuario.")
                migrarTabla(motorMysql, motorSqlServer, nombreTabla, 'userID', mapeoIds=mapeoIdUsuarios) 
            else:
                print("No se encontró el mapeo de IDs de usuario. Migrando 'usersAddresses' sin actualizar IDs.")
                migrarTabla(motorMysql, motorSqlServer, nombreTabla)
        else:
            migrarTabla(motorMysql, motorSqlServer, nombreTabla)

    motorMysql.dispose()
    motorSqlServer.dispose()

if __name__ == "__main__":
    migrarTodoConManejoIds(configuracionMysql, configuracionSqlServer)
    print("\nMigración de todas las tablas completada")
```






