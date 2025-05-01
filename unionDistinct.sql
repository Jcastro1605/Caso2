USE Soltura;
GO

-- 1. UNION entre planes individuales y empresariales

SELECT 
    subscriptionid AS PlanID,
    name AS NombrePlan,
    description AS Descripcion,
    'Individual' AS TipoPlan,
    (SELECT COUNT(*) 
     FROM dbo.Solt_PlansPerGroup PPG 
     JOIN dbo.Solt_UserPerGroup UPG ON PPG.userGroupid = UPG.userGroupid
     WHERE PPG.subscriptionid = S.subscriptionid) AS UsuariosActivos
FROM dbo.Solt_Subscriptions S
WHERE isCustom = 0 AND temporary = 0 AND name LIKE '%Individual%'

UNION

SELECT 
    subscriptionid AS PlanID,
    name AS NombrePlan,
    description AS Descripcion,
    'Empresarial' AS TipoPlan,
    (SELECT COUNT(*) 
     FROM dbo.Solt_PlansPerGroup PPG 
     JOIN dbo.Solt_UserPerGroup UPG ON PPG.userGroupid = UPG.userGroupid
     WHERE PPG.subscriptionid = S.subscriptionid) AS UsuariosActivos
FROM dbo.Solt_Subscriptions S
WHERE isCustom = 0 AND temporary = 0 AND name LIKE '%Empresarial%'

ORDER BY UsuariosActivos DESC, NombrePlan;
GO

-- 2. DISTINCT para evitar duplicados en servicios asignados

SELECT DISTINCT
    PF.name AS ServicioUnico,
    PF.description AS DescripcionServicio
FROM dbo.Solt_PlanFeatures PF
JOIN dbo.Solt_FeaturesPerPlan FPP ON PF.planFeatureid = FPP.planFeatureid
JOIN dbo.Solt_Subscriptions S ON FPP.subscriptionid = S.subscriptionid
WHERE FPP.enabled = 1
ORDER BY ServicioUnico;
GO
