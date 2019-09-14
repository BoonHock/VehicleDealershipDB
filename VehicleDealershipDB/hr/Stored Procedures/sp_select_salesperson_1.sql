﻿-- =============================================
-- Author:		hock
-- Create date: 26.8.2019
-- Description:	select salesperson
-- =============================================
CREATE PROCEDURE [hr].[sp_select_salesperson] 
	-- Add the parameters for the stored procedure here
	@salesperson int -- -1 to select all salesperson

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	SALESPERSON.[salesperson],
	SALESPERSON.[person],
	SALESPERSON.[organisation],
	SALESPERSON.[organisation_branch],
	'' AS [branch_name],
	HRPERSON.[name],
	HRPERSON.[ic_no] AS [registration_no],
	SALESPERSON.[location],
	SALESPERSON.[date_join],
	SALESPERSON.[date_leave],
	SALESPERSON.[remark]

FROM [hr].[salesperson] SALESPERSON

JOIN [hr].[person] HRPERSON
	ON HRPERSON.[person] = SALESPERSON.[person]

WHERE SALESPERSON.[person] IS NOT NULL
	AND (@salesperson = -1 
		OR SALESPERSON.[salesperson] = @salesperson)

UNION

SELECT 
	SALESPERSON.[salesperson],
	SALESPERSON.[person],
	SALESPERSON.[organisation],
	SALESPERSON.[organisation_branch],
	ORGBRANCH.[branch_name],
	HRORG.[name],
	HRORG.[registration_no],
	SALESPERSON.[location],
	SALESPERSON.[date_join],
	SALESPERSON.[date_leave],
	SALESPERSON.[remark]

FROM [hr].[salesperson] SALESPERSON

JOIN [hr].[organisation] HRORG
	ON HRORG.[organisation] = SALESPERSON.[organisation]

LEFT JOIN [hr].[organisation_branch] ORGBRANCH
	ON ORGBRANCH.[organisation_branch] = SALESPERSON.[organisation_branch]

WHERE SALESPERSON.[organisation] IS NOT NULL
	AND (@salesperson = -1 
		OR SALESPERSON.[salesperson] = @salesperson)


END