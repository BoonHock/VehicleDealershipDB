-- =============================================
-- Author:		hock
-- Create date: 26.8.2019
-- Description:	select salestarget
-- =============================================
CREATE PROCEDURE hr.sp_select_salestarget 
	-- Add the parameters for the stored procedure here
	@salesperson INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	[salestarget],
	[target_description],
	SALESTARGET.[salesperson],
	SALESPERSON.[person],
	HRPERSON.[name],
	[target1],
	[target2],
	[target3],
	[target4],
	[target5],
	[target6],
	[target7],
	[target8],
	[target9],
	[target10],
	[target11],
	[target12],
	SECURITYUSER.[name] AS [modified_by]

FROM [hr].[salestarget] SALESTARGET

JOIN [hr].[salesperson] SALESPERSON
	ON SALESPERSON.[salesperson] = SALESTARGET.[salesperson]

JOIN [hr].[person] HRPERSON
	ON HRPERSON.[person] = SALESPERSON.[person]

JOIN [dbsecurity].[user] SECURITYUSER
	ON SECURITYUSER.[user] = SALESTARGET.[modified_by]

WHERE SALESTARGET.[salesperson] = @salesperson

END