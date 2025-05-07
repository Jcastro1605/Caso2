-- Script para llenar la base de datos appassistant con datos de prueba
-- Considerando los requisitos especificados

-- 1. Configuración inicial
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

USE `appassistant`;

-- 2. Limpiar tablas (opcional, solo para pruebas)
-- Descomentar si se necesita limpiar las tablas antes de insertar
-- SET FOREIGN_KEY_CHECKS = 0;
-- TRUNCATE TABLE `appusers`;
-- TRUNCATE TABLE `appempresas`;
-- TRUNCATE TABLE `appsubscriptions`;
-- TRUNCATE TABLE `appplanprices`;
-- TRUNCATE TABLE `appplanperperson`;
-- TRUNCATE TABLE `apppersonplanlimits`;
-- TRUNCATE TABLE `approles`;
-- TRUNCATE TABLE `apppermissions`;
-- TRUNCATE TABLE `appuserspermissions`;
-- TRUNCATE TABLE `appusersroles`;
-- SET FOREIGN_KEY_CHECKS = 1;

-- 3. Insertar datos básicos necesarios

-- Países
INSERT INTO `appcountries` (`name`, `currency`, `currencySymbol`, `language`) VALUES 
('Estados Unidos', 'Dólar estadounidense', 'USD', 'en-US'),
('México', 'Peso mexicano', 'MXN', 'es-MX'),
('España', 'Euro', 'EUR', 'es-ES'),
('Colombia', 'Peso colombiano', 'COP', 'es-CO'),
('Argentina', 'Peso argentino', 'ARS', 'es-AR');

-- Estados (para México como ejemplo)
INSERT INTO `appstates` (`name`, `appCountriesid`) VALUES 
('Ciudad de México', 2),
('Estado de México', 2),
('Jalisco', 2),
('Nuevo León', 2),
('Puebla', 2);

-- Ciudades
INSERT INTO `appcities` (`name`, `appStatesID`) VALUES 
('Ciudad de México', 1),
('Ecatepec', 2),
('Guadalajara', 3),
('Monterrey', 4),
('Puebla', 5);

-- Direcciones (ejemplo)
INSERT INTO `appaddresses` (`line1`, `line2`, `zipcode`, `location`, `appCitiesid`) VALUES 
('Av. Insurgentes Sur 123', 'Piso 5', '06700', POINT(19.4326, -99.1332), 1),
('Calz. de Tlalpan 456', 'Col. Roma', '06760', POINT(19.4126, -99.1632), 1),
('Av. Juárez 789', 'Centro', '44100', POINT(20.6736, -103.344), 3);

-- Monedas
INSERT INTO `appcurrencysymbol` (`name`, `acronym`, `symbol`) VALUES 
('Dólar estadounidense', 'USD', '$'),
('Peso mexicano', 'MXN', '$'),
('Euro', 'EUR', '€'),
('Peso colombiano', 'COP', '$'),
('Peso argentino', 'ARS', '$');

-- Tipos de cambio
INSERT INTO `appcurrencyexchangerate` (`startDate`, `endDate`, `exchangeRate`, `enabled`, `currencyId`) VALUES 
('2023-01-01 00:00:00', '2023-12-31 23:59:59', 1.0, 1, 1),
('2023-01-01 00:00:00', '2023-12-31 23:59:59', 18.5, 1, 2),
('2023-01-01 00:00:00', '2023-12-31 23:59:59', 0.85, 1, 3);

-- Tipos de contacto
INSERT INTO `appcontactinfotype` (`name`) VALUES 
('Email'),
('Teléfono'),
('Celular'),
('LinkedIn'),
('Twitter');

-- Módulos de la aplicación
INSERT INTO `appmodules` (`appModulesid`, `name`) VALUES 
(1, 'Dashboard'),
(2, 'Asistente IA'),
(3, 'Tareas'),
(4, 'Pagos'),
(5, 'Configuración'),
(6, 'Reportes');

-- Permisos
INSERT INTO `apppermissions` (`description`, `code`, `appModulesid`) VALUES 
('Ver dashboard', 'DASH_VIEW', 1),
('Editar dashboard', 'DASH_EDIT', 1),
('Usar asistente IA', 'IA_USE', 2),
('Configurar IA', 'IA_CONF', 2),
('Crear tareas', 'TASK_CRET', 3),
('Editar tareas', 'TASK_EDIT', 3),
('Ver pagos', 'PAY_VIEW', 4),
('Realizar pagos', 'PAY_DO', 4),
('Configuración general', 'CONF_GEN', 5),
('Ver reportes', 'REP_VIEW', 6),
('Exportar reportes', 'REP_EXP', 6);

-- Roles
INSERT INTO `approles` (`name`, `enabled`) VALUES 
('Administrador', 1),
('Usuario Premium', 1),
('Usuario Básico', 1),
('Soporte', 1),
('Empresa', 1);

-- Asignar permisos a roles
-- Administrador tiene todos los permisos
INSERT INTO `approlespermissions` (`enabled`, `deleted`, `lastUpdate`, `username`, `checksum`, `roleID`, `appPermissionsid`) 
SELECT 1, 0, NOW(), 'system', UNHEX(SHA2(CONCAT(1, p.appPermissionsid, NOW()), 256)), 1, p.appPermissionsid 
FROM `apppermissions` p;

-- Usuario Premium
INSERT INTO `approlespermissions` (`enabled`, `deleted`, `lastUpdate`, `username`, `checksum`, `roleID`, `appPermissionsid`) VALUES 
(1, 0, NOW(), 'system', UNHEX(SHA2(CONCAT(2, 1, NOW()), 256)), 2, 1),
(1, 0, NOW(), 'system', UNHEX(SHA2(CONCAT(2, 3, NOW()), 256)), 2, 3),
(1, 0, NOW(), 'system', UNHEX(SHA2(CONCAT(2, 5, NOW()), 256)), 2, 5),
(1, 0, NOW(), 'system', UNHEX(SHA2(CONCAT(2, 7, NOW()), 256)), 2, 7),
(1, 0, NOW(), 'system', UNHEX(SHA2(CONCAT(2, 10, NOW()), 256)), 2, 10);

-- Usuario Básico
INSERT INTO `approlespermissions` (`enabled`, `deleted`, `lastUpdate`, `username`, `checksum`, `roleID`, `appPermissionsid`) VALUES 
(1, 0, NOW(), 'system', UNHEX(SHA2(CONCAT(3, 1, NOW()), 256)), 3, 1),
(1, 0, NOW(), 'system', UNHEX(SHA2(CONCAT(3, 3, NOW()), 256)), 3, 3),
(1, 0, NOW(), 'system', UNHEX(SHA2(CONCAT(3, 5, NOW()), 256)), 3, 5);

-- Planes de suscripción
INSERT INTO `appsubscriptions` (`descripcion`) VALUES 
('Plan Básico - Mensual'),
('Plan Premium - Mensual'),
('Plan Básico - Anual'),
('Plan Premium - Anual');

-- Características de planes
INSERT INTO `appplanfeatures` (`description`, `enabled`, `datatype`) VALUES 
('Tareas activas', 1, 'number'),
('Uso de IA (mensual)', 1, 'minutes'),
('Almacenamiento', 1, 'MB'),
('Soporte prioritario', 1, 'boolean'),
('Exportación de datos', 1, 'boolean');

-- Asignar características a planes
-- Plan Básico Mensual
INSERT INTO `appfeatureperplan` (`value`, `enabled`, `subscriptionId`, `planFeaturesId`) VALUES 
('10', 1, 1, 1),
('60', 1, 1, 2),
('100', 1, 1, 3),
('0', 1, 1, 4),
('0', 1, 1, 5);

-- Plan Premium Mensual
INSERT INTO `appfeatureperplan` (`value`, `enabled`, `subscriptionId`, `planFeaturesId`) VALUES 
('50', 1, 2, 1),
('300', 1, 2, 2),
('500', 1, 2, 3),
('1', 1, 2, 4),
('1', 1, 2, 5);

-- Plan Básico Anual
INSERT INTO `appfeatureperplan` (`value`, `enabled`, `subscriptionId`, `planFeaturesId`) VALUES 
('10', 1, 3, 1),
('720', 1, 3, 2),
('100', 1, 3, 3),
('0', 1, 3, 4),
('0', 1, 3, 5);

-- Plan Premium Anual
INSERT INTO `appfeatureperplan` (`value`, `enabled`, `subscriptionId`, `planFeaturesId`) VALUES 
('50', 1, 4, 1),
('3600', 1, 4, 2),
('500', 1, 4, 3),
('1', 1, 4, 4),
('1', 1, 4, 5);

-- Horarios de facturación
INSERT INTO `appschedules` (`name`, `recurrentType`, `repetition`, `endType`, `endDate`) VALUES 
('Mensual', 'monthly', 1, 'none', NULL),
('Anual', 'yearly', 1, 'none', NULL);

-- Precios de planes
INSERT INTO `appplanprices` (`amount`, `postTime`, `enable`, `endDate`, `subscriptionId`, `scheduleId`, `currencyId`) VALUES 
(9.99, NOW(), 1, '2025-12-31 23:59:59', 1, 1, 1),  -- Básico Mensual en USD
(19.99, NOW(), 1, '2025-12-31 23:59:59', 2, 1, 1), -- Premium Mensual en USD
(99.99, NOW(), 1, '2025-12-31 23:59:59', 3, 2, 1),  -- Básico Anual en USD
(199.99, NOW(), 1, '2025-12-31 23:59:59', 4, 2, 1); -- Premium Anual en USD

-- 4. Crear empresas (20% de usuarios son empresas)
INSERT INTO `appempresas` (`companyName`, `signInDate`, `enabled`, `deleted`) VALUES 
('Tech Solutions Inc.', NOW(), 1, 0),
('Innovatech MX', NOW(), 1, 0),
('Asistente Digital SA', NOW(), 1, 0),
('AI Partners', NOW(), 1, 0),
('Data Analytics Group', NOW(), 1, 0),
('Cloud Services Corp', NOW(), 1, 0),
('Software Factory', NOW(), 1, 0),
('Digital Transform', NOW(), 1, 0),
('NextGen Tech', NOW(), 1, 0),
('Smart Solutions', NOW(), 1, 0),
('Inteligencia MX', NOW(), 1, 0),
('AI Consultants', NOW(), 1, 0),
('Data Science Co', NOW(), 1, 0),
('Tech Innovators', NOW(), 1, 0),
('Digital Assist', NOW(), 1, 0),
('Future Tech', NOW(), 1, 0),
('AI Experts', NOW(), 1, 0),
('Machine Learning Inc', NOW(), 1, 0),
('NLP Solutions', NOW(), 1, 0),
('Vision AI', NOW(), 1, 0);

-- Información de contacto para empresas
INSERT INTO `appcontactinfoempresas` (`valorContacto`, `enable`, `lastUpdate`, `empresaId`, `contactInfoTypeId`) VALUES 
('contacto@techsolutions.com', 1, NOW(), 1, 1),
('+525512345678', 1, NOW(), 1, 2),
('@techsolutions', 1, NOW(), 1, 5),
('ventas@innovatech.mx', 1, NOW(), 2, 1),
('+525576543210', 1, NOW(), 2, 2),
('info@asistentedigital.com', 1, NOW(), 3, 1),
('+525598765432', 1, NOW(), 3, 2),
('soporte@aipartners.com', 1, NOW(), 4, 1),
('@aipartners', 1, NOW(), 4, 5),
('contacto@dataanalytics.com', 1, NOW(), 5, 1);

-- 5. Crear usuarios (1000 usuarios activos)
DELIMITER //
CREATE PROCEDURE InsertarUsuarios()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE esEmpresa BIT;
    DECLARE empresaId INT;
    DECLARE planId INT;
    DECLARE planTipo INT;
    DECLARE userId INT;
    
    WHILE i <= 1000 DO
        -- 20% de usuarios son empresas (asociados a una empresa)
        IF i % 5 = 0 THEN
            SET esEmpresa = 1;
            SET empresaId = FLOOR(1 + RAND() * 20); -- 20 empresas disponibles
        ELSE
            SET esEmpresa = 0;
            SET empresaId = NULL;
        END IF;
        
        -- Crear usuario
        INSERT INTO `appusers` (`appUsersid`, `firstName`, `lastName`, `password`, `fechaNacimiento`, `enabled`, `empresaId`, `contact`) 
        VALUES (
            i,
            CONCAT('Usuario', i),
            CONCAT('Apellido', i),
            UNHEX(SHA2(CONCAT('tempPassword', i), 256)), -- Password temporal que deberán cambiar
            DATE_ADD('1980-01-01', INTERVAL FLOOR(RAND() * 20) YEAR),
            1,
            empresaId,
            CONCAT('usuario', i, '@example.com')
        );
        
        -- Información de contacto del usuario
        INSERT INTO `appcontactinfouser` (`valueContact`, `enable`, `lastupdate`, `appUsersid`, `contactInfoID`) 
        VALUES (
            CONCAT('usuario', i, '@example.com'),
            1,
            NOW(),
            i,
            1
        );
        
        -- 70% tienen plan mensual, 30% anual
        IF i % 10 < 7 THEN
            SET planTipo = 1; -- Mensual
        ELSE
            SET planTipo = 2; -- Anual
        END IF;
        
        -- 50% básico, 50% premium (aproximadamente)
        IF i % 2 = 0 THEN
            SET planId = planTipo; -- Básico mensual o anual (1 o 3)
        ELSE
            SET planId = planTipo + 1; -- Premium mensual o anual (2 o 4)
        END IF;
        
        -- Asignar plan al usuario
        INSERT INTO `appplanperperson` (`addDate`, `enabled`, `appUsersid`, `scheduleId`, `planPriceId`) 
        VALUES (
            DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY),
            1,
            i,
            CASE WHEN planId IN (1,2) THEN 1 ELSE 2 END,
            planId
        );
        
        -- Asignar límites del plan al usuario
        -- Obtener características del plan seleccionado
        INSERT INTO `apppersonplanlimits` (`limit`, `planFeaturesId`, `planPerPersonId`)
        SELECT fp.value, fp.planFeaturesId, pp.planPerPersonId
        FROM `appfeatureperplan` fp
        JOIN `appplanperperson` pp ON fp.subscriptionId = pp.planPriceId
        WHERE pp.appUsersid = i;
        
        -- Asignar roles a usuarios
        -- 5% administradores, 15% soporte, 30% empresas, 50% usuarios normales
        IF i % 20 = 0 THEN
            -- Administrador
            INSERT INTO `appusersroles` (`lastUpdate`, `username`, `checksum`, `enabled`, `deleted`, `appUsersid`) 
            VALUES (NOW(), 'system', SHA2(CONCAT(i, 1, NOW()), 256), 1, 0, i);
        ELSEIF i % 7 = 0 THEN
            -- Soporte
            INSERT INTO `appusersroles` (`lastUpdate`, `username`, `checksum`, `enabled`, `deleted`, `appUsersid`) 
            VALUES (NOW(), 'system', SHA2(CONCAT(i, 4, NOW()), 256), 1, 0, i);
        ELSEIF esEmpresa = 1 THEN
            -- Empresa
            INSERT INTO `appusersroles` (`lastUpdate`, `username`, `checksum`, `enabled`, `deleted`, `appUsersid`) 
            VALUES (NOW(), 'system', SHA2(CONCAT(i, 5, NOW()), 256), 1, 0, i);
        ELSE
            -- Usuario normal (50% básico, 50% premium)
            IF i % 2 = 0 THEN
                -- Básico
                INSERT INTO `appusersroles` (`lastUpdate`, `username`, `checksum`, `enabled`, `deleted`, `appUsersid`) 
                VALUES (NOW(), 'system', SHA2(CONCAT(i, 3, NOW()), 256), 1, 0, i);
            ELSE
                -- Premium
                INSERT INTO `appusersroles` (`lastUpdate`, `username`, `checksum`, `enabled`, `deleted`, `appUsersid`) 
                VALUES (NOW(), 'system', SHA2(CONCAT(i, 2, NOW()), 256), 1, 0, i);
            END IF;
        END IF;
        
        -- Asignar permisos directos a algunos usuarios (10%)
        IF i % 10 = 0 THEN
            INSERT INTO `appuserspermissions` (`enabled`, `deleted`, `lastUpdate`, `username`, `checksum`, `appUsersid`, `appPermissionsid`) 
            VALUES (1, 0, NOW(), 'system', SHA2(CONCAT(i, 3, NOW()), 256), i, 3); -- IA_USE
        END IF;
        
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

-- Ejecutar el procedimiento para insertar usuarios
CALL InsertarUsuarios();

-- Eliminar el procedimiento después de usarlo
DROP PROCEDURE IF EXISTS InsertarUsuarios;
DROP PROCEDURE IF EXISTS InsertarPagos;

-- 6. Crear pagos históricos para los planes
DELIMITER //
CREATE PROCEDURE InsertarPagos()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE j INT;
    DECLARE userId INT;
    DECLARE planId INT;
    DECLARE monto FLOAT;
    DECLARE fechaPago DATETIME;
    DECLARE metodoId INT;
    DECLARE metodoPagoId INT;
    DECLARE currencyId INT;
    
    -- Insertar métodos de pago disponibles
    INSERT INTO `appmetodospago` (`name`, `apiURL`, `secretKey`, `key`, `enable`) VALUES 
    ('Tarjeta crédito', 'https://api.pagos.com/credit', UNHEX(SHA2('secret1', 256)), UNHEX(SHA2('key1', 256)), 1),
    ('PayPal', 'https://api.paypal.com/v1', UNHEX(SHA2('secret2', 256)), UNHEX(SHA2('key2', 256)), 1),
    ('Transferencia', 'https://api.bancos.com/transfer', UNHEX(SHA2('secret3', 256)), UNHEX(SHA2('key3', 256)), 1);
    
    -- Crear métodos de pago para usuarios (3 por usuario)
    SET i = 1;
    WHILE i <= 1000 DO
        -- Método 1
        INSERT INTO `appmetodosdisponibles` (`name`, `configuracionDetalles`, `refreshToken`, `token`, `expToken`, `maskAccount`, `appUsersid`, `metodoId`) 
        VALUES (
            'Tarjeta principal',
            '{"last4":"1234","brand":"Visa"}',
            CONCAT('rt_', UUID()),
            UNHEX(SHA2(CONCAT('token1_', i), 256)),
            DATE_ADD(NOW(), INTERVAL 1 YEAR),
            '****1234',
            i,
            1
        );
        
        -- Método 2
        INSERT INTO `appmetodosdisponibles` (`name`, `configuracionDetalles`, `refreshToken`, `token`, `expToken`, `maskAccount`, `appUsersid`, `metodoId`) 
        VALUES (
            'PayPal',
            CONCAT('{"email":"usuario', i, '@paypal.com"}'),
            CONCAT('rt_', UUID()),
            UNHEX(SHA2(CONCAT('token2_', i), 256)),
            DATE_ADD(NOW(), INTERVAL 1 YEAR),
            CONCAT('usuario', i, '@paypal.com'),
            i,
            2
        );
        
        -- Método 3 (solo 50% de usuarios)
        IF i % 2 = 0 THEN
            INSERT INTO `appmetodosdisponibles` (`name`, `configuracionDetalles`, `refreshToken`, `token`, `expToken`, `maskAccount`, `appUsersid`, `metodoId`) 
            VALUES (
                'Transferencia bancaria',
                '{"clabe":"123456789012345678","banco":"BBVA"}',
                CONCAT('rt_', UUID()),
                UNHEX(SHA2(CONCAT('token3_', i), 256)),
                DATE_ADD(NOW(), INTERVAL 1 YEAR),
                '****5678',
                i,
                3
            );
        END IF;
        
        SET i = i + 1;
    END WHILE;
    
    -- Crear pagos históricos para cada usuario según su plan
    SET i = 1;
    WHILE i <= 1000 DO
        -- Obtener información del plan del usuario
        SELECT pp.planPriceId, pp.appUsersid, pp.addDate, pr.amount, pr.currencyId 
        INTO planId, userId, fechaPago, monto, currencyId
        FROM `appplanperperson` pp
        JOIN `appplanprices` pr ON pp.planPriceId = pr.planPriceId
        WHERE pp.appUsersid = i;
        
        -- Determinar método de pago aleatorio para este usuario
        SET metodoId = FLOOR(1 + RAND() * 3);
        SELECT metodoDisponibleId INTO metodoPagoId 
        FROM `appmetodosdisponibles` 
        WHERE appUsersid = i AND metodoId = metodoId 
        LIMIT 1;
        
        -- Crear pagos históricos (entre 1 y 12 pagos según antigüedad)
        SET j = 1;
        WHILE j <= FLOOR(1 + RAND() * 12) DO
            -- Insertar pago
            INSERT INTO `apppagos` (
                `monto`, `actualMonto`, `result`, `authnumber`, `reference`, `chargeToken`, 
                `description`, `error`, `fecha`, `checksum`, `metodoPagoId`, `metodoId`, 
                `appUsersid`, `appModulesid`, `currencyId`
            ) VALUES (
                monto, monto, 'approved', CONCAT('AUTH', FLOOR(RAND() * 1000000)), 
                CONCAT('REF', FLOOR(RAND() * 1000000)), UNHEX(SHA2(CONCAT('charge', i, j), 256)),
                CONCAT('Pago plan ', planId), '', 
                DATE_ADD(fechaPago, INTERVAL (j-1) * CASE WHEN planId IN (1,2) THEN 1 ELSE 12 END MONTH),
                UNHEX(SHA2(CONCAT(i, j, NOW()), 256)), metodoPagoId, metodoId, i, 4, currencyId
            );
            
            -- Insertar transacción asociada al pago
            INSERT INTO `apptransactions` (
                `amount`, `description`, `date`, `postTime`, `refNumber`, `checksum`, 
                `convertedAmount`, `appUsersid`, `appPagos_pagoId`, `transactionTypeId`, 
                `transactionSubTypeId`, `currencyExchangeRateId`
            ) VALUES (
                monto, CONCAT('Pago plan ', planId), 
                DATE_ADD(fechaPago, INTERVAL (j-1) * CASE WHEN planId IN (1,2) THEN 1 ELSE 12 END MONTH),
                TIME(NOW()), CONCAT('TXN', FLOOR(RAND() * 1000000)), UNHEX(SHA2(CONCAT('txn', i, j), 256)),
                monto, i, LAST_INSERT_ID(), 1, 1, 1
            );
            
            SET j = j + 1;
        END WHILE;
        
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

-- Ejecutar el procedimiento para insertar pagos
CALL InsertarPagos();

-- Eliminar el procedimiento después de usarlo
DROP PROCEDURE IF EXISTS InsertarPagos;

-- 7. Insertar datos de IA (opcional)
-- Modelos de IA
INSERT INTO `appiamodels` (`name`, `enable`) VALUES 
('GPT-4', 1),
('GPT-3.5', 1),
('Claude', 1),
('Llama', 1),
('Bard', 1);

-- Roles de IA
INSERT INTO `appiaroles` (`name`, `description`) VALUES 
('Asistente', 'Asistente general para responder preguntas y ayudar con tareas'),
('Analista', 'Analiza datos y proporciona insights'),
('Traductor', 'Traduce texto entre idiomas'),
('Resumidor', 'Crea resúmenes de texto largo'),
('Programador', 'Ayuda con código y problemas técnicos');

-- Modalities
INSERT INTO `appmodalities` (`name`, `enabled`) VALUES 
('Chat', 1),
('Completado', 1),
('Edición', 1),
('Embedding', 1);

-- Chat status
INSERT INTO `appchatstatus` (`name`) VALUES 
('Iniciado'),
('En progreso'),
('Completado'),
('Fallido');

-- Notification status
INSERT INTO `appnotificationstatus` (`name`, `enabled`) VALUES 
('Nuevo', 1),
('Leído', 1),
('Archivado', 1),
('Eliminado', 0);

-- 8. Restaurar configuraciones
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- 9. Mensaje final
SELECT 'Datos de prueba insertados correctamente. 1000 usuarios creados (70% con planes mensuales, 30% anuales).' AS Resultado;
