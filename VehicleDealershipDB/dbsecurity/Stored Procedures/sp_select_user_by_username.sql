-- =============================================
-- Author:		hock
-- Create date: 14.04.2019
-- Description:	select user
-- =============================================
CREATE PROCEDURE [dbsecurity].[sp_select_user_by_username] 
	-- Add the parameters for the stored procedure here
	@username nvarchar(20) = '' 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
SELECT 
	U.[user],
	U.[username],
	U.[name],
	U.[ic_no],
	U.[is_active],
	U.[join_date],
	U.[leave_date],
	U.[image],
	UUG.[usergroup]

FROM [dbsecurity].[user] U

LEFT JOIN [dbsecurity].[user_usergroup] UUG
	ON U.[user] = UUG.[user]

WHERE [username] = @username

END
