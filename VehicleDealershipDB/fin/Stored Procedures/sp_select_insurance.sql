-- =============================================
-- Author:		hock
-- Create date: 29.10.2019
-- Description:	select insurance
-- =============================================
CREATE PROCEDURE [fin].[sp_select_insurance] 
	-- Add the parameters for the stored procedure here
	@insurance int = -1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT
	HRINSURANCE.[insurance],
	ORGBRANCH.[organisation],
	HRORG.[name],
	ORGBRANCH.[branch_name],
	HRORG.[registration_no],
	ORGBRANCH.[address],
	ORGBRANCH.[city],
	ORGBRANCH.[state],
	ORGBRANCH.[postcode],
	HRCOUNTRY.[country_name],
	HRORG.[url],
	HRINSURANCE.[remark]

FROM [hr].[insurance] HRINSURANCE

JOIN [hr].[organisation_branch] ORGBRANCH
	ON ORGBRANCH.[organisation_branch] = HRINSURANCE.[insurance]

JOIN [hr].[organisation] HRORG
	ON HRORG.[organisation] = ORGBRANCH.[organisation]

JOIN [hr].[country] HRCOUNTRY
	ON HRCOUNTRY.[country] = ORGBRANCH.[country]

WHERE @insurance = -1
	OR HRINSURANCE.[insurance] = @insurance

ORDER BY
	HRORG.[name],
	ORGBRANCH.[branch_name]

END