-- =============================================
-- Author:		hock
-- Create date: 26.8.2019
-- Description:	select salesperson
-- =============================================
CREATE PROCEDURE hr.sp_select_salesperson 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	SALESPERSON.[salesperson],
	HRPERSON.[name],
	HRPERSON.[ic_no] AS [registration_no],
	SALESPERSON.[location],
	SALESPERSON.[date_join],
	SALESPERSON.[date_leave]

FROM [hr].[salesperson] SALESPERSON

JOIN [hr].[person] HRPERSON
	ON HRPERSON.[person] = SALESPERSON.[person]

WHERE SALESPERSON.[person] IS NOT NULL

UNION

SELECT 
	SALESPERSON.[salesperson],
	HRORG.[name],
	HRORG.[registration_no],
	SALESPERSON.[location],
	SALESPERSON.[date_join],
	SALESPERSON.[date_leave]

FROM [hr].[salesperson] SALESPERSON

JOIN [hr].[organisation] HRORG
	ON HRORG.[organisation] = SALESPERSON.[organisation]

WHERE SALESPERSON.[organisation] IS NOT NULL



END