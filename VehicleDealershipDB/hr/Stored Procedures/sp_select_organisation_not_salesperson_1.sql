﻿-- =============================================
-- Author:		hock
-- Create date: 27.8.2019
-- Description:	select organisation not salesperson
-- =============================================
CREATE PROCEDURE [hr].[sp_select_organisation_not_salesperson] 
	-- Add the parameters for the stored procedure here
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
	ORGBRANCH.[branch_name],
	HRORG.[registration_no],
	HRORG.[url]

FROM [hr].[organisation_branch] ORGBRANCH

JOIN [hr].[organisation] HRORG
	ON HRORG.[organisation] = ORGBRANCH.[organisation]

WHERE ORGBRANCH.[organisation_branch] NOT IN
(
	SELECT [salesperson].[organisation_branch]
	FROM [hr].[salesperson]
	WHERE [salesperson].[organisation_branch] IS NOT NULL
)

ORDER BY 
	HRORG.[name],
	ORGBRANCH.[branch_name]

END