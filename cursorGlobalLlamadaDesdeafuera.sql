GO

-- usar cursor global desde otro batch
BEGIN
    DECLARE @cityid INT, @cityName NVARCHAR(60), @stateName NVARCHAR(40), @countryName NVARCHAR(60);
    DECLARE @currency CHAR(3), @userCount INT, @subscribedUsers INT, @nonSubscribedUsers INT;
    
    PRINT '';
    PRINT 'Continuando con el cursor global desde otro batch:';
    PRINT '-----------------------------------------------';
    
    -- saltar los primeros 10 que ya mostramos
    DECLARE @skipCount INT = 0;
    WHILE @skipCount < 10 AND @@FETCH_STATUS = 0
    BEGIN
        FETCH NEXT FROM cityCursorGlobal INTO @cityid, @cityName, @stateName, @countryName, @currency, @userCount, @subscribedUsers, @nonSubscribedUsers;
        SET @skipCount = @skipCount + 1;
    END
    
    DECLARE @showCount INT = 0;
    WHILE @showCount < 5 AND @@FETCH_STATUS = 0
    BEGIN
        PRINT 'Ciudad: ' + @cityName + ' (' + @currency + ') - Usuarios: ' + CAST(@userCount AS VARCHAR);
        FETCH NEXT FROM cityCursorGlobal INTO @cityid, @cityName, @stateName, @countryName, @currency, @userCount, @subscribedUsers, @nonSubscribedUsers;
        SET @showCount = @showCount + 1;
    END
    
    CLOSE cityCursorGlobal;
    DEALLOCATE cityCursorGlobal;
    PRINT '';
    PRINT 'Cursor global "cityCursorGlobal" ha sido liberado.';
END