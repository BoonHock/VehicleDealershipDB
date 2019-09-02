-- =============================================
-- Author:		hock
-- Create date: 1.9.2019
-- Description:	select org
-- =============================================
CREATE PROCEDURE [hr].[sp_select_organisation] 
	-- Add the parameters for the stored procedure here
	@org int = 0

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	HRORG.[organisation],
	HRORG.[name],
	HRORG.[registration_no],
	HRORG.[organisation_type],
	ORGTYPE.[organisation_type_description],
	HRORG.[branch],
	HRORG.[address],
	HRORG.[city],
	HRORG.[state],
	HRORG.[postcode],
	HRORG.[country],
	HRCOUNTRY.[country_name],
	HRORG.[url]
	

FROM [hr].[organisation] HRORG

JOIN [hr].[organisation_type] ORGTYPE
	ON ORGTYPE.[organisation_type] = HRORG.[organisation_type]

JOIN [hr].[country] HRCOUNTRY
	ON HRCOUNTRY.[country] = HRORG.[country]

WHERE HRORG.[organisation] = @org

END