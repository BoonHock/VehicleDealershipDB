-- =============================================
-- Author:		hock
-- Create date: 14.04.2019
-- Description:	select user
-- =============================================
CREATE PROCEDURE [dbsecurity].[sp_update_user_password] 
	-- Add the parameters for the stored procedure here
	@password nvarchar(MAX),
	@uid INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
UPDATE [dbsecurity].[user]
	SET [password] = @password
WHERE [user] = @uid


END
