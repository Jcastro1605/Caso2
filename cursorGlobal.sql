USE Soltura;
GO

-- hay 2 o mas monedas?
IF NOT EXISTS (SELECT 1 FROM dbo.Solt_Currencies WHERE acronym IN ('CRC', 'USD'))
BEGIN
    PRINT 'Error: La base de datos no tiene las monedas CRC y USD configuradas.';
    RETURN;
END

-- Verificamos que existan usuarios con y sin suscripción
IF NOT EXISTS (
    SELECT 1 FROM dbo.Solt_Users U
    LEFT JOIN dbo.Solt_UserPerGroup UP ON U.userid = UP.userid
    LEFT JOIN dbo.Solt_PlansPerGroup PG ON UP.userGroupid = PG.userGroupid
    GROUP BY U.userid
    HAVING COUNT(PG.subscriptionid) = 0
)
BEGIN
    PRINT 'Error: No hay usuarios sin suscripción en la base de datos.';
    RETURN;
END

-- mostrar info de ciudades con usuarios y sus monedas asociadas
DECLARE cityCursorGlobal CURSOR GLOBAL
FOR 
    SELECT 
        C.cityid,
        C.name AS CityName,
        S.name AS StateName,
        CO.name AS CountryName,
        CR.acronym AS Currency,
        COUNT(DISTINCT U.userid) AS UserCount,
        SUM(CASE WHEN PG.subscriptionid IS NOT NULL THEN 1 ELSE 0 END) AS SubscribedUsers,
        SUM(CASE WHEN PG.subscriptionid IS NULL THEN 1 ELSE 0 END) AS NonSubscribedUsers
    FROM dbo.Solt_Cities C
    JOIN dbo.Solt_States S ON C.stateid = S.stateid
    JOIN dbo.Solt_Countries CO ON S.countryid = CO.countryid
    JOIN dbo.Solt_Currencies CR ON CO.currencyid = CR.currencyid
    LEFT JOIN dbo.Solt_Adresses A ON C.cityid = A.cityid
    LEFT JOIN dbo.Solt_UserAdresses UA ON A.adressid = UA.adressid
    LEFT JOIN dbo.Solt_Users U ON UA.userid = U.userid
    LEFT JOIN dbo.Solt_UserPerGroup UP ON U.userid = UP.userid AND UP.enabled = 1
    LEFT JOIN dbo.Solt_PlansPerGroup PG ON UP.userGroupid = PG.userGroupid AND PG.enabled = 1
    GROUP BY C.cityid, C.name, S.name, CO.name, CR.acronym
    ORDER BY CO.name, S.name, C.name;

OPEN cityCursorGlobal;

-- variables para almacenar resultados
DECLARE @cityid INT, @cityName NVARCHAR(60), @stateName NVARCHAR(40), @countryName NVARCHAR(60);
DECLARE @currency CHAR(3), @userCount INT, @subscribedUsers INT, @nonSubscribedUsers INT;

-- encabezado del reporte
PRINT 'Reporte de Ciudades con Distribucion de Usuarios y Monedas';
PRINT '==========================================================';
PRINT '';

-- primeros 10 registros 
DECLARE @rowCount INT = 0;
FETCH NEXT FROM cityCursorGlobal INTO @cityid, @cityName, @stateName, @countryName, @currency, @userCount, @subscribedUsers, @nonSubscribedUsers;

WHILE @@FETCH_STATUS = 0 AND @rowCount < 10
BEGIN
    PRINT 'Ciudad: ' + @cityName;
    PRINT 'Ubicación: ' + @stateName + ', ' + @countryName;
    PRINT 'Moneda: ' + @currency;
    PRINT 'Total Usuarios: ' + CAST(@userCount AS VARCHAR);
    PRINT '  - Con suscripción: ' + CAST(@subscribedUsers AS VARCHAR);
    PRINT '  - Sin suscripción: ' + CAST(@nonSubscribedUsers AS VARCHAR);
    PRINT '----------------------------------------';
    
    SET @rowCount = @rowCount + 1;
    FETCH NEXT FROM cityCursorGlobal INTO @cityid, @cityName, @stateName, @countryName, @currency, @userCount, @subscribedUsers, @nonSubscribedUsers;
END

-- mostrar mensaje si hay mas datos
IF @@FETCH_STATUS = 0
BEGIN
    PRINT '... (más ciudades disponibles en el cursor)';
    PRINT '';
END
