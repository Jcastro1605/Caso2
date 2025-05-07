CREATE VIEW dbo.vw_PartnerFeatures
WITH SCHEMABINDING
AS
SELECT
    P.partnerid,  
    F.planFeatureid,  
    P.name AS Proveedor,
    F.name AS Beneficio,
    F.enabled AS Habilitado,
    PD.expirationDate AS FechaExpiracion,
    RM.methodid,
    RM.name AS MetodoCanje,
    COUNT_BIG(*) AS ConteoFilas 
FROM dbo.Solt_PlanFeatures F
INNER JOIN dbo.Solt_FeaturePerDeal FPD ON FPD.planFeatureid = F.planFeatureid
INNER JOIN dbo.Solt_PartnerDeals PD ON PD.partnerDealid = FPD.partnerDealid
INNER JOIN dbo.Solt_Partners P ON P.partnerid = PD.partnerid
INNER JOIN dbo.Solt_RedemptionDetails RD ON RD.planFeatureid = F.planFeatureid
INNER JOIN dbo.Solt_RedemptionMethod RM ON RM.methodid = RD.methodid
GROUP BY
    P.partnerid,
    F.planFeatureid,
    P.name,
    F.name,
    F.enabled,
    PD.expirationDate,
    RM.methodid,
    RM.name;
GO


CREATE UNIQUE CLUSTERED INDEX Index_VW_PartnerFeatures
ON dbo.vw_PartnerFeatures (partnerid, planFeatureid, methodid);
GO

