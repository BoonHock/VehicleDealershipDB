-- =============================================
-- Author:		hock
-- Create date: 14.04.2019
-- Description:	select user
-- =============================================
CREATE PROCEDURE [dbsecurity].[sp_select_user_all] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
SELECT 
	U.[user],
	U.[username],
	U.[name],
	UUG.[usergroup],
	U.[ic_no],
	CASE WHEN U.[is_active] = 1 THEN 'ACTIVE' ELSE 'INACTIVE' END AS [is_active],
	U.[join_date],
	U.[leave_date]

FROM [dbsecurity].[user] U

LEFT JOIN [dbsecurity].[user_usergroup] UUG
	ON U.[user] = UUG.[user]

LEFT JOIN [dbsecurity].[usergroup] UG
	ON UUG.[usergroup] = UG.[usergroup]

END