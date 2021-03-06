﻿-- =============================================
-- Author:		hock
-- Create date: 26.8.2019
-- Description:	select salesperson
-- =============================================
CREATE PROCEDURE [hr].[sp_select_salesperson] 
	-- Add the parameters for the stored procedure here
	@salesperson int, -- -1 to select all salesperson
	@is_active INT -- -1 to select all, 1 to select active, 0 to select inactive
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	SALESPERSON.[salesperson],
	SALESPERSON.[person],
	SALESPERSON.[organisation_branch],
	HRPERSON.[name],
	'' AS [branch_name],
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
	AND (@is_active = -1 
		OR (@is_active = 1 AND (SALESPERSON.[date_leave] IS NULL OR SALESPERSON.[date_leave] > GETDATE()))
		OR (@is_active = 0 AND SALESPERSON.[date_leave] IS NOT NULL AND SALESPERSON.[date_leave] <= GETDATE()))

UNION

SELECT 
	SALESPERSON.[salesperson],
	SALESPERSON.[person],
	SALESPERSON.[organisation_branch],
	HRORG.[name],
	ORGBRANCH.[branch_name],
	HRORG.[registration_no],
	SALESPERSON.[location],
	SALESPERSON.[date_join],
	SALESPERSON.[date_leave],
	SALESPERSON.[remark]

FROM [hr].[salesperson] SALESPERSON

JOIN [hr].[organisation_branch] ORGBRANCH
	ON ORGBRANCH.[organisation_branch] = SALESPERSON.[organisation_branch]

JOIN [hr].[organisation] HRORG
	ON HRORG.[organisation] = ORGBRANCH.[organisation]

WHERE SALESPERSON.[organisation_branch] IS NOT NULL
	AND (@salesperson = -1 
		OR SALESPERSON.[salesperson] = @salesperson)
	AND (@is_active = -1 
		OR (@is_active = 1 AND (SALESPERSON.[date_leave] IS NULL OR SALESPERSON.[date_leave] > GETDATE()))
		OR (@is_active = 0 AND SALESPERSON.[date_leave] IS NOT NULL AND SALESPERSON.[date_leave] <= GETDATE()))


END