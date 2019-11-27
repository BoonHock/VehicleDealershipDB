-- =============================================
-- Author:		hock
-- Create date: 19.11.2019
-- Description:	select loan
-- =============================================
CREATE PROCEDURE [hr].[sp_select_loan] 
	-- Add the parameters for the stored procedure here
	@loan int = -1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT
	HRLOAN.[loan],
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
	HRLOAN.[remark]

FROM [hr].[loan] HRLOAN

JOIN [hr].[organisation_branch] ORGBRANCH
	ON ORGBRANCH.[organisation_branch] = HRLOAN.[loan]

JOIN [hr].[organisation] HRORG
	ON HRORG.[organisation] = ORGBRANCH.[organisation]

JOIN [hr].[country] HRCOUNTRY
	ON HRCOUNTRY.[country] = ORGBRANCH.[country]

WHERE @loan = -1
	OR HRLOAN.[loan] = @loan

ORDER BY
	HRORG.[name],
	ORGBRANCH.[branch_name]

END