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

CLOSE userCursorLocal;
DEALLOCATE userCursorLocal;
