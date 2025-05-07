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
        IF EXISTS (SELECT 1 FROM sys.openkeys WHERE key_name = 'DataEncryption') -- Esto es por si SP falla después del OPEN
            CLOSE SYMMETRIC KEY DataEncryption;
        DECLARE @MensajeError NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR('Error al desencriptar: %s', 16, 1, @MensajeError);
        RETURN 1; 
    END CATCH
END;