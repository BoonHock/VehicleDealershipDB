-- =============================================
-- Author:		hock
-- Create date: 3.9.2019
-- Description:	select finance
-- =============================================
CREATE PROCEDURE [hr].[sp_select_finance] 
	-- Add the parameters for the stored procedure here
	@finance int = -1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT
	HRFINANCE.[finance],
	HRORG.[organisation],
	HRORG.[name],
	ORGBRANCH.[branch_name],
	HRORG.[registration_no],
	ORGBRANCH.[address],
	ORGBRANCH.[city],
	ORGBRANCH.[state],
	ORGBRANCH.[postcode],
	HRCOUNTRY.[country_name],
	HRORG.[url],
	HRFINANCE.[remark]

FROM [hr].[finance] HRFINANCE

JOIN [hr].[organisation_branch] ORGBRANCH
	ON ORGBRANCH.[organisation_branch] = HRFINANCE.[finance]

JOIN [hr].[organisation] HRORG
	ON HRORG.[organisation] = ORGBRANCH.[organisation]

JOIN [hr].[country] HRCOUNTRY
	ON HRCOUNTRY.[country] = ORGBRANCH.[country]

WHERE @finance = -1
	OR HRFINANCE.[finance] = @finance

ORDER BY
	HRORG.[name],
	ORGBRANCH.[branch_name]

END