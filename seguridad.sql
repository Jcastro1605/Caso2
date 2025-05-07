USE Soltura
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'MiClave'

CREATE CERTIFICATE CertGeneral -- Crea automáticamente la llave asimétrica protegida por la llave maestra
WITH SUBJECT = 'Certificado general de la base de datos'

CREATE SYMMETRIC KEY DataEncryption 
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE CertGeneral


---------------------------------------------------------------

OPEN SYMMETRIC KEY DataEncryption
DECRYPTION BY CERTIFICATE CertGeneral;
INSERT INTO dbo.Solt_StatusTypes (statusTypeId, name, cifrado)
VALUES (2, 'Nombre',
	ENCRYPTBYKEY(KEY_GUID('DataEncryption'), 'DATO ENCRIPTADO'));
CLOSE SYMMETRIC KEY DataEncryption


OPEN SYMMETRIC KEY DataEncryption
DECRYPTION BY CERTIFICATE CertGeneral;
SELECT statusTypeId, name, CONVERT(VARCHAR, DECRYPTBYKEY(cifrado)) AS  teamowner FROM dbo.Solt_StatusTypes;
