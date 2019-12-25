-- =============================================
-- Author:		HOCK
-- Create date: 18.12.2019
-- Description:	select insurance comprehensive rate
-- =============================================
CREATE PROCEDURE [fin].[sp_select_insurance_comprehensive_rate] 
	-- Add the parameters for the stored procedure here
	@insurance_comprehensive int ,
	@cc int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	IC.[insurance_comprehensive], 
	IC.[cc_min], 
	IC.[cc_max], 
	IC.[value], 
	DBUSER.[name] AS [modified_by]

FROM [fin].[insurance_comprehensive_rate] IC

JOIN [dbsecurity].[user] DBUSER
	ON DBUSER.[user] = IC.[modified_by]

WHERE IC.[insurance_comprehensive] = @insurance_comprehensive
	AND (@cc = -1 OR @cc BETWEEN IC.[cc_min] AND IC.[cc_max])


END