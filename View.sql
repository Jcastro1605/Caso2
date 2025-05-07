USE [Soltura]

-- -------------------------
--        TRIGGERS
-- -------------------------
DROP TRIGGER if EXISTS trg_LogReedemQR;

GO
CREATE TRIGGER trg_LogReedemQR -- Trigger para crear un log cuando se utiliza un cupon QR
ON dbo.Solt_RedemptionCodes
AFTER UPDATE
AS
BEGIN
    DECLARE @description VARCHAR(100) = 'Código QR redimido';
	DECLARE @userid INT;
    DECLARE @computer VARCHAR(50);
	DECLARE @redemptionCodeid INT;
	DECLARE @redemptionStatusid TINYINT;
    DECLARE @username NVARCHAR(100);
	DECLARE @trace VARCHAR(100) = ' ';

	DECLARE @concatString NVARCHAR(500);
	DECLARE @checksum VARBINARY(128);
	DECLARE @logTypeid INT;
	SELECT @logTypeid = logTypeId
    FROM Solt_LogTypes
    WHERE name = 'Redeems';

	SELECT 
        @userid = i.userid, 
        @redemptionCodeid = i.redemptionCodeid,
		@redemptionStatusid =i.redemptionStatusid,
		@username = u.username
    FROM inserted i
	INNER JOIN dbo.Solt_Users u ON i.userid = u.userid

	SET @computer = 'PC de ' + @username;
	SET @concatString = CAST(@description AS NVARCHAR) + 
                        CAST(@computer AS NVARCHAR) + 
                        CAST(@username AS NVARCHAR) + 
                        CAST(@trace AS NVARCHAR) + 
                        CAST(@redemptionCodeid AS NVARCHAR) + 
                        CAST(@redemptionStatusid AS NVARCHAR) + 
                        CAST(@logTypeid as NVARCHAR) + '1' + '1'; -- LogType = Redeems | LogSource = Database | LogSeverity = Exito
	SET @checksum = HASHBYTES('SHA2_256', @concatString)

	INSERT INTO dbo.Solt_Log (description, computer, username, trace, referenceid1, value1, checksum, logtypeid, logsourceid, logseverityid)
    VALUES (@description, @computer, @username, @trace, @redemptionCodeid, CAST(@redemptionStatusid AS VARCHAR), @checksum, @logTypeid, 1, 1);
END;
GO

--update Solt_RedemptionCodes 
--set redemptionStatusid = 1
--where redemptionCodeid = 1;
-- ---------------------------
-- SCHEMABINGING EN VISTAS
-- ---------------------------
DROP VIEW IF EXISTS dbo.vw_GruposActivos;

GO
CREATE VIEW dbo.vw_GruposActivos
WITH SCHEMABINDING
AS
SELECT groupOwner, name AS groupName, creationDate
FROM dbo.Solt_UserGroups
GO

SELECT * FROM vw_GruposActivos;
ALTER TABLE dbo.Solt_UserGroups DROP COLUMN enabled; -- Ya no permite alterar la tabla, pues la vista usa SCHEMABINDING
-- ---------------------------
-- SCHEMABINGING EN FUNCIONES
-- ---------------------------
DROP FUNCTION IF EXISTS dbo.VerifiyRedemptionCode;

GO
CREATE FUNCTION dbo.VerifiyRedemptionCode (@redemptionCodeid int)
	RETURNS BIT
WITH SCHEMABINDING
AS
BEGIN
	DECLARE @enabled BIT;

	SELECT @enabled = CASE
		WHEN expirationTime >= GETDATE() THEN 1
		ELSE 0
	END
	FROM dbo.Solt_RedemptionCodes
	WHERE redemptionCodeid = @redemptionCodeid;

	RETURN @enabled;
END
GO
-- ---------------------------
-- WITH ENCRYPTION EN SP
-- ---------------------------
DROP PROCEDURE IF EXISTS ObtainPartnerShare;

GO
CREATE PROCEDURE ObtainPartnerShare
	@featureid INT,
    @partnerShareAmount DECIMAL(10,2) OUTPUT -- La operación regresa la cantidad de dinero correspondiente al Partner
WITH ENCRYPTION
AS
BEGIN
	DECLARE @totalCost FLOAT = 0;
    DECLARE @partnerShare DECIMAL(5,2) = 0.00;
	DECLARE @IVA DECIMAL(5,2) = 0.13;

    -- Se calcula el share
    SELECT 
        @totalCost = totalCost, @partnerShare = partnerShare      
    FROM dbo.Solt_FeaturePerDeal
    WHERE featurePerDealid = @featureid

    SET @partnerShareAmount = (@totalCost - @totalCost*@IVA) * @partnerShare;

    RETURN @partnerShareAmount;
END
GO

DECLARE @amount DECIMAL(10,2);
EXEC ObtainPartnerShare 1, @amount;
SELECT COALESCE(CAST(@amount AS NVARCHAR), 'Not established') AS PartnerShareAmount;

-- ---------------------------
-- EXECUTE AS
-- ---------------------------

CREATE ROLE LowTierAdmins;
CREATE USER LowTierAdminTest WITHOUT login;
ALTER ROLE LowTierAdmins ADD MEMBER LowTierAdminTest;

--GRANT EXEC TO LowTierAdmins;

DROP PROCEDURE IF EXISTS CheckUsersEmail;
GO
CREATE PROCEDURE CheckUsersEmail
AS
BEGIN
	SELECT value, contactInfoTypeid
    FROM dbo.Solt_ContactInfoPerson
    WHERE contactInfoTypeid = 1;
END
GO

EXECUTE AS USER = 'LowTierAdminTest';
EXEC CheckUsersEmail;

REVERT; -- Regresa al usuario original
DROP USER if EXISTS LowTierAdminTest;
DROP ROLE if EXISTS LowTierAdmins;

