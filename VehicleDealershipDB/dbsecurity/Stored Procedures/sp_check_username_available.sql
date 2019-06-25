-- =============================================
-- Author:		hock
-- Create date: 14.04.2019
-- Description:	select user
-- =============================================
CREATE PROCEDURE [dbsecurity].[sp_check_username_available] 
	-- Add the parameters for the stored procedure here
	@username nvarchar(20) = '',
	@user INT -- use 0 to select all
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
SELECT COUNT(*)

FROM [dbsecurity].[user]
WHERE [username] = @username
	AND (@user = 0 OR [user] <> @user)


END
