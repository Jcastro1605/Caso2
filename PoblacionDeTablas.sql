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
	DECLARE @ModulesData TABLE (moduleId INT, name NVARCHAR(50));
	INSERT INTO @ModulesData (moduleId, name) VALUES
	  (1, N'Cobro Suscripción'),
	  (2, N'Procesador Pagos'),
	  (3, N'Reintento Automático');

	INSERT INTO dbo.Solt_Modules (moduleId, name)
	SELECT moduleId, name
	FROM @ModulesData;

	-- Solt_Partners
	DECLARE @PartnersData TABLE
	(
	  name NVARCHAR(100),
	  startDate DATE,
	  endDate DATE,
	  enabled BIT,
	  partnerAdressid INT
	);
	INSERT INTO @PartnersData VALUES
	 (N'SmartFit Costa Rica','2024-01-01',NULL, 1, 1),
	 (N'WashIt Laundry','2024-02-15',NULL, 1, 2),
	 (N'EcoFuel Stations','2023-11-01',NULL, 1, 3),
	 (N'Kolbi Telecom','2022-05-10',NULL, 1, 4),
	 (N'PetGroom CR','2024-03-20',NULL, 1, 5),
	 (N'Healthy Meals Co.','2024-01-25',NULL, 1, 6),
	 (N'Urban Parking','2023-09-30',NULL, 1, 7);

	DECLARE @InsertedPartners TABLE(partnerid INT, name NVARCHAR(100));
	INSERT INTO dbo.Solt_Partners (name, startDate, endDate, enabled, partnerAdressid)
	OUTPUT inserted.partnerid, inserted.name INTO @InsertedPartners
	SELECT name, startDate, endDate, enabled, partnerAdressid
	FROM @PartnersData;


	-- Solt_PartnerDeals
	DECLARE @PartnerDealsData TABLE
	(
	  partnerName NVARCHAR(100),
	  sealDate DATE,
	  expirationDate DATE,
	  enabled BIT,
	  dealDescription NVARCHAR(200),
	  dealTypeName NVARCHAR(100)
	);
	INSERT INTO @PartnerDealsData VALUES
	 (N'SmartFit Costa Rica','2025-01-15',NULL,1,N'10 % de descuento en membresías',     N'Descuento %'),
	 (N'WashIt Laundry','2025-01-20',NULL,1,N'20 % de descuento en lavandería',      N'Descuento %'),
	 (N'EcoFuel Stations','2025-01-05',NULL,1,N'3 % de cashback en combustible',      N'Cashback'),
	 (N'Kolbi Telecom','2025-01-10',NULL,1,N'Plan móvil ilimitado a precio preferencial', N'Descuento %'),
	 (N'PetGroom CR','2025-01-18',NULL,1,N'Primer grooming gratis al mes',       N'Producto Gratis'),
	 (N'Healthy Meals Co.','2025-01-22',NULL,1,N'15 % de descuento en menús saludables', N'Descuento %'),
	 (N'Urban Parking','2025-01-08',NULL,1,N'5 % de cashback en estacionamientos',  N'Cashback');

	DECLARE @InsertedPartnerDeals TABLE(partnerDealid INT, partnerid INT);
	INSERT INTO dbo.Solt_PartnerDeals (partnerid, sealDate, expirationDate, enabled, dealDescription, dealTypeid)
	OUTPUT inserted.partnerDealid, inserted.partnerid INTO @InsertedPartnerDeals
	SELECT
	  ip.partnerid, pd.sealDate, pd.expirationDate,
	  pd.enabled, pd.dealDescription, dt.dealTypeid
	FROM @PartnerDealsData AS pd
	JOIN @InsertedPartners AS ip
	ON ip.name = pd.partnerName
	JOIN dbo.Solt_DealType AS dt
	ON dt.name = pd.dealTypeName;

	-- Solt_FeaturePerDeal
	DECLARE @FeatureDealData TABLE
	(
	  partnerDealid INT,
	  featName NVARCHAR(40),
	  solturaShare DECIMAL(5,2),
	  partnerShare DECIMAL(5,2),
	  totalCost DECIMAL(10,2)
	);
	INSERT INTO @FeatureDealData VALUES
	 (1, N'Gimnasio', 25.00, 75.00,100.0),
	 (2, N'Lavandería', 30.00, 70.00,100.0),
	 (3, N'Combustible', 20.00, 80.00,100.0),
	 (4, N'Plan Móvil', 35.00, 65.00,100.0),
	 (5, N'Grooming Mascota', 40.00, 60.00,100.0),
	 (6, N'Lavandería', 25.00, 75.00,100.0),
	 (7, N'Combustible', 20.00, 80.00,100.0);

	INSERT INTO dbo.Solt_FeaturePerDeal
	  (partnerDealid, planFeatureid, solturaShare, partnerShare, totalCost)
	SELECT
	  fpd.partnerDealid,
	  pf.planFeatureid,
	  fpd.solturaShare,
	  fpd.partnerShare,
	  fpd.totalCost
	FROM @FeatureDealData AS fpd
	JOIN dbo.Solt_PlanFeatures AS pf
	ON pf.name = fpd.featName
	JOIN @InsertedPartnerDeals AS ipd
	ON ipd.partnerDealid = fpd.partnerDealid;

	-- Solt_ErrorTypes
	DECLARE @PayErrors TABLE
	(
	  payErrorTypeId TINYINT PRIMARY KEY,
	  name NVARCHAR(50)
	);

	INSERT INTO @PayErrors (payErrorTypeId, name) VALUES
	  (1, N'Tarjeta Rechazada'),
	  (2, N'Fondos Insuficientes'),
	  (3, N'Error Red'),
	  (4, N'Token Expirado');

	INSERT INTO dbo.Solt_PayErrorTypes (payErrorTypeId, name)
	SELECT payErrorTypeId, name
	FROM   @PayErrors;

	-- Solt_PaymentAttempts
	DECLARE @Attempts TABLE
	(
	  paymentAttemptId INT PRIMARY KEY,
	  amount DECIMAL(10,4),
	  currentAmount DECIMAL(10,4),
	  userId INT,
	  moduleId INT,
	  chargeToken VARBINARY(128),
	  description NVARCHAR(200),
	  result NVARCHAR(200),
	  statusTypeId TINYINT,
	  creationDate DATETIME2,
	  currencyId INT,
	  availableMethodId INT,
	  checksum VARBINARY(500),
	  payErrorTypeId TINYINT
	);

	INSERT INTO @Attempts VALUES
	 (1, 59.9000, 59.9000, 1, 2,
		CONVERT(VARBINARY(128),'tok-u1'),
		N'Cobro mensual abril', N'Tarjeta rechazada',
		2, GETDATE(), 1, 1,
		CONVERT(VARBINARY(500),'chk-pa-1'), 1),
	 (2, 59.9000, 59.9000, 2, 2,
		CONVERT(VARBINARY(128),'tok-u2'),
		N'Cobro mensual abril (reintento)', N'Fondos insuficientes',
		2, GETDATE(), 1, 2,
		CONVERT(VARBINARY(500),'chk-pa-2'), 2),
	 (3, 79.9000, 79.9000, 3, 3,
		CONVERT(VARBINARY(128),'tok-u3'),
		N'Cobro nómada digital abril', N'Error de red: timeout',
		2, GETDATE(), 1, 3,
		CONVERT(VARBINARY(500),'chk-pa-3'), 3);

	INSERT INTO dbo.Solt_PaymentAttempts
	 (paymentAttemptId, amount, currentAmount,
	  userId, moduleId, chargeToken,
	  description, result, statusTypeId,
	  creationDate, currencyId, availableMethodId,
	  checksum, payErrorTypeId)
	SELECT
	  paymentAttemptId, amount, currentAmount,
	  userId, moduleId, chargeToken,
	  description, result, statusTypeId,
	  creationDate, currencyId, availableMethodId,
	  checksum, payErrorTypeId
	FROM @Attempts;

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
