USE [Soltura]

DECLARE @nameSP nvarchar(200);
DECLARE @numSP int = 1;
DECLARE @i smallint = 1;

SELECT @numSP = COUNT(1) FROM sys.procedures;

WHILE @i<=@numSP
BEGIN

	SELECT @nameSP = name FROM (
        SELECT name, ROW_NUMBER() OVER (ORDER BY name) AS id
        FROM sys.procedures
    ) AS tablaSP
    WHERE id = @i;

	EXEC sp_recompile @nameSP;
	SET @i = @i+1;

END;
