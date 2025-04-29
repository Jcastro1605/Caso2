USE [Soltura]

-- SET IDENTITY_INSERT Solt_CurrencyConversions OFF;

DBCC FREEPROCCACHE;
GO
DBCC DROPCLEANBUFFERS;

SET IDENTITY_INSERT Solt_Currencies OFF;

DELETE from Solt_CurrencyConversions;
DBCC CHECKIDENT ('Solt_CurrencyConversions', RESEED, 0);
DELETE from Solt_Currencies;

DELETE from Solt_PaymentMethods;
DBCC CHECKIDENT ('Solt_PaymentMethods', RESEED, 0);

DELETE from Solt_ContactInfoPerson;
DBCC CHECKIDENT ('Solt_ContactInfoPerson', RESEED, 0);

DELETE from Solt_ContactInfoTypes;

DELETE from Solt_Users;
DBCC CHECKIDENT ('Solt_Users', RESEED, 0);

DELETE from Solt_UserPersons;
DBCC CHECKIDENT ('Solt_UserPersons', RESEED, 0);

-- SET IDENTITY_INSERT Solt_CurrencyConversions ON;

/* -----------------------Tabla de Currencies----------------------- */
SET IDENTITY_INSERT Solt_Currencies ON;
INSERT into Solt_Currencies(currencyid, name, acronym, symbol) values
(1, 'Costa Rican Colon', 'CRC', '₡'),
(2, 'US Dollar', 'USD', '$')
SET IDENTITY_INSERT Solt_Currencies OFF;

/* ------------------Tabla de CurrencyConversions------------------- */
INSERT into Solt_CurrencyConversions(enddate, exchangeRate, source_currencyid, destination_currencyid) values
(NULL, 0.0020, 1, 2),
(NULL, 505.85, 2, 1)

/* ---------------------- Tablas de Users ---------------------- */

DROP PROCEDURE IF EXISTS InsertUserPersons;

GO
CREATE PROCEDURE InsertUserPersons
AS
BEGIN

	DECLARE @cantidadUsuarios int = 50;
	DECLARE @name varchar(30) = 'Usuario';
	DECLARE @firstlastname varchar(30) = 'Apellido1';
	DECLARE @secondlastname varchar(30) = 'Apellido2';
	DECLARE @birthdate varchar(30);
	DECLARE @i int = 1;
	DECLARE @randomNumber int;

    WHILE @i<=@cantidadUsuarios
	BEGIN

	SET @randomNumber = FLOOR(RAND() * 20) + 1;
 
		SELECT @name = CASE @randomNumber
            WHEN 1 THEN 'Juan'
            WHEN 2 THEN 'Ana'
            WHEN 3 THEN 'Carlos'
            WHEN 4 THEN 'Maria'
            WHEN 5 THEN 'Luis'
            WHEN 6 THEN 'Pedro'
            WHEN 7 THEN 'Marta'
            WHEN 8 THEN 'Javier'
            WHEN 9 THEN 'Lucia'
            WHEN 10 THEN 'Jose'
			WHEN 11 THEN 'Fernando'
			WHEN 12 THEN 'Elena'
			WHEN 13 THEN 'Ricardo'
			WHEN 14 THEN 'Rosa'
			WHEN 15 THEN 'Alejandro'
			WHEN 16 THEN 'Beatriz'
			WHEN 17 THEN 'Santiago'
			WHEN 18 THEN 'Valeria'
			WHEN 19 THEN 'Manuel'
			WHEN 20 THEN 'Patricia'
        END;

		SET @randomNumber = FLOOR(RAND() * 20) + 1;

		SELECT @firstlastname = CASE @randomNumber
			WHEN 1 THEN 'Gonzalez'
			WHEN 2 THEN 'Rodriguez'
			WHEN 3 THEN 'Martinez'
			WHEN 4 THEN 'Fernandez'
			WHEN 5 THEN 'Perez'
			WHEN 6 THEN 'Gomez'
			WHEN 7 THEN 'Diaz'
			WHEN 8 THEN 'Vazquez'
			WHEN 9 THEN 'Castillo'
			WHEN 10 THEN 'Silva'
			WHEN 11 THEN 'Lopez'
			WHEN 12 THEN 'Jimenez'
			WHEN 13 THEN 'Torres'
			WHEN 14 THEN 'Ruiz'
			WHEN 15 THEN 'Morales'
			WHEN 16 THEN 'Herrera'
			WHEN 17 THEN 'Cabrera'
			WHEN 18 THEN 'Soto'
			WHEN 19 THEN 'Ramos'
			WHEN 20 THEN 'Navarro'
		END;

		SET @randomNumber = FLOOR(RAND() * 20) + 1;

		SELECT @secondlastname = CASE @randomNumber
			WHEN 1 THEN 'Gonzalez'
			WHEN 2 THEN 'Rodriguez'
			WHEN 3 THEN 'Martinez'
			WHEN 4 THEN 'Fernandez'
			WHEN 5 THEN 'Perez'
			WHEN 6 THEN 'Gomez'
			WHEN 7 THEN 'Diaz'
			WHEN 8 THEN 'Vazquez'
			WHEN 9 THEN 'Castillo'
			WHEN 10 THEN 'Silva'
			WHEN 11 THEN 'Lopez'
			WHEN 12 THEN 'Jimenez'
			WHEN 13 THEN 'Torres'
			WHEN 14 THEN 'Ruiz'
			WHEN 15 THEN 'Morales'
			WHEN 16 THEN 'Herrera'
			WHEN 17 THEN 'Cabrera'
			WHEN 18 THEN 'Soto'
			WHEN 19 THEN 'Ramos'
			WHEN 20 THEN 'Navarro'
		END;

		SET @birthdate = DATEADD(DAY, FLOOR(RAND() * 7300), '1980-01-01');

        INSERT INTO Solt_UserPersons(name, firstLastname, secondLastname, birthdate)
        VALUES (@name, @firstlastname, @secondlastname, @birthdate);
		
		SET @i = @i+1;
	END
END;
GO

EXEC InsertUserPersons;

DROP PROCEDURE IF EXISTS InsertUsers;

GO
CREATE PROCEDURE InsertUsers
AS
BEGIN

	DECLARE @cantidadUsuarios int = 50;
	DECLARE @username varchar(30) = 'Usuario';
	DECLARE @password varbinary(250);
	DECLARE @name varchar(30);
	DECLARE @firstlastname varchar(30);
	DECLARE @secondlastname varchar(30);
	DECLARE @i int = 1;
	DECLARE @randomNumber int;

    WHILE @i<=@cantidadUsuarios
	BEGIN

	SELECT @name = name, @firstlastName = firstLastname, @secondlastname = secondLastname
	FROM Solt_UserPersons 
	WHERE userPersonid = @i;

	SET @randomNumber = FLOOR(RAND() * 20) + 1;

		SET @username = @name + SUBSTRING(@firstlastname, 1, 3) + SUBSTRING(@secondlastname, 1, 1) + CAST(FLOOR(RAND() * 100) AS VARCHAR); 

		SET @password = CONVERT(VARBINARY(250),
			CHAR(FLOOR(65 + RAND() * 26))+  -- Letra aleatoria mayúscula
			CHAR(FLOOR(65 + RAND() * 26))+  -- Letra aleatoria mayúscula
			CHAR(FLOOR(97 + RAND() * 26))+  -- Letra aleatoria minúscula
			CHAR(FLOOR(97 + RAND() * 26))+  -- Letra aleatoria minúscula
			CAST(FLOOR(0 + RAND() * 10) AS VARCHAR)+         -- Dígito aleatorio
			CAST(FLOOR(0 + RAND() * 10) AS VARCHAR)+         -- Dígito aleatorio
			CHAR(FLOOR(33 + RAND() * 15))   -- Carácter especial
		);

        INSERT INTO Solt_Users(username, password, userPersonid)
        VALUES (@username, @password, @i);
		
		SET @i = @i+1;
	END
END;
GO

EXEC InsertUsers;

/* ---------------------- Tablas de Contactos ---------------------- */
SET IDENTITY_INSERT Solt_ContactInfoTypes ON;
INSERT into Solt_ContactInfoTypes(contactInfoTypeid, name) values
(1, 'Email'),
(2, 'Card'),
(3, 'Phonenumber'),
(4, 'Cryptocurrency')
SET IDENTITY_INSERT Solt_ContactInfoTypes OFF;

-- ------ContactInfoPerson
DROP PROCEDURE IF EXISTS InsertContactInfoPerson;

GO
CREATE PROCEDURE InsertContactInfoPerson
AS
BEGIN

	DECLARE @cantidadUsuarios int = 50;
	DECLARE @value varchar(100) = 'Vacio';

	DECLARE @name varchar(30);
	DECLARE @firstlastname varchar(30);
	DECLARE @secondlastname varchar(30);
	DECLARE @birthdate DATE;

	DECLARE @i int = 1;
	DECLARE @randomNumber int;

    WHILE @i<=@cantidadUsuarios
	BEGIN

	SELECT @name = name, @firstlastName = firstLastname, @secondlastname = secondLastname, @birthdate = birthdate
	FROM Solt_Users
	JOIN Solt_UserPersons ON Solt_Users.userPersonid = Solt_UserPersons.userPersonid
	WHERE userid = @i;
	
	-- CORREO
	SET @value = LOWER(@name + SUBSTRING(@firstlastname,1,3) + CAST(DAY(@birthdate) AS VARCHAR) + CAST(MONTH(@birthdate) AS VARCHAR) + '@gmail.com');
	
	INSERT INTO Solt_ContactInfoPerson(value, contactInfoTypeid, userid)
    VALUES (@value, 1, @i);

	-- TARJETA
    SET @value = @name + ' '+ @firstlastname+ '''s Card';

	INSERT INTO Solt_ContactInfoPerson(value, contactInfoTypeid, userid)
    VALUES (@value, 2, @i);
	-- NUMERO TELEFONO
	SET @randomNumber = FLOOR(RAND() * 8999) + 2222;
    SET @value = CAST(@randomNumber AS VARCHAR);
	SET @randomNumber = FLOOR(RAND() * 9999) + 1111;
    SET @value = @value+'-'+ CAST(@randomNumber AS VARCHAR);

	INSERT INTO Solt_ContactInfoPerson(value, contactInfoTypeid, userid)
    VALUES (@value, 3, @i);

	-- CRIPTO
	SET @value = @name + ' '+ @firstlastname + '''s Wallet';

	INSERT INTO Solt_ContactInfoPerson(value, contactInfoTypeid, userid)
    VALUES (@value, 4, @i);

		
		SET @i = @i+1;
	END
END;
GO

EXEC InsertContactInfoPerson;


-- ------ContactInfoPerson
DROP PROCEDURE IF EXISTS InsertPaymentMethods;

GO
CREATE PROCEDURE InsertPaymentMethods
AS
BEGIN

	DECLARE @cantidadUsuarios int = 50;
	
	DECLARE @name varchar(30);
	DECLARE @API varchar(255);
	DECLARE @contact int = 1;
	DECLARE @type varchar(30);
	DECLARE @key varbinary(500);
	DECLARE @secretKey varbinary(500);

	DECLARE @i int = 1;
	DECLARE @randomNumber int;

    WHILE @i<=@cantidadUsuarios
	BEGIN
		
		-- Se selecciona uno de los cuatro metodos de pago de los usuarios insertados.
		SET @randomNumber = FLOOR(RAND() * 4) + 1;
		SET @contact = (4 * (@i-1)) + @randomNumber;

		-- Se obtiene el tipo de pago
		SELECT @type = name
		FROM Solt_ContactInfoPerson
		JOIN Solt_ContactInfoTypes ON Solt_ContactInfoPerson.contactInfoTypeid = Solt_ContactInfoTypes.contactInfoTypeid
		WHERE contactInfoPersonid = @contact;

		SELECT @API = CASE @type
			WHEN 'Email' THEN 'https://api.paypal.com'
			WHEN 'Card' THEN 'https://www.bncr.fi.cr/api/payments'
			WHEN 'Phonenumber' THEN 'https://www.baccredomatic.com/api/sinpe'
			WHEN 'Cryptocurrency' THEN 'https://www.firstatlanticcommerce.com/api'
		END;

		SET @secretKey = HASHBYTES('SHA2_256', CAST(NEWID() AS NVARCHAR(50)));
		SET @key = HASHBYTES('SHA2_256', CAST(@secretKey AS NVARCHAR(50)));
	
		INSERT into Solt_PaymentMethods(name, APIurl, secretKey, [key], logoIconURL, contactInfoPersonId, templateJSON) values
		('Payment through ' + @type, @API, @secretKey, @key, NULL, @contact, NULL);

		SET @i = @i+1;
	END
END;
GO

EXEC InsertPaymentMethods;


/* ------------------    Select    ------------------- */

SELECT * FROM Solt_Currencies
SELECT * FROM Solt_CurrencyConversions

SELECT * FROM Solt_ContactInfoTypes
SELECT * FROM Solt_AvailableMethods
SELECT * FROM Solt_PaymentMethods

SELECT * FROM Solt_Users
SELECT * FROM Solt_UserPersons
SELECT * FROM Solt_ContactInfoPerson