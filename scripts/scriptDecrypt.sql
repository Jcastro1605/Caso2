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
