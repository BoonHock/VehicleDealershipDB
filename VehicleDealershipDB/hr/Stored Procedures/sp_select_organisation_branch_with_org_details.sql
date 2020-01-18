-- =============================================
-- Author:		hock
-- Create date: 16.9.2019
-- Description:	select org branch
-- =============================================
CREATE PROCEDURE [hr].[sp_select_organisation_branch_with_org_details]
	-- Add the parameters for the stored procedure here
	@orgbranch int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT
	ORGBRANCH.[organisation_branch],
	ORGBRANCH.[organisation],
	HRORG.[name],
	HRORG.[registration_no],
	ORGBRANCH.[branch_name],
	ORGBRANCH.[address],
	ORGBRANCH.[city],
	ORGBRANCH.[state],
	ORGBRANCH.[postcode],
	ORGBRANCH.[country],
	HRCOUNTRY.[country_name],
	HRORG.[organisation_type],
	ORGTYPE.[organisation_type_description],
	HRORG.[url]

FROM [hr].[organisation_branch] ORGBRANCH

JOIN [hr].[organisation] HRORG
	ON HRORG.[organisation] = ORGBRANCH.[organisation]

JOIN [hr].[organisation_type] ORGTYPE
	ON ORGTYPE.[organisation_type] = HRORG.[organisation_type]

JOIN [hr].[country] HRCOUNTRY
	ON HRCOUNTRY.[country] = ORGBRANCH.[country]

WHERE @orgbranch = -1 OR [organisation_branch] = @orgbranch


END