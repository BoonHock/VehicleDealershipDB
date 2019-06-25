-- =============================================
-- Author:		hock
-- Create date: 14.04.2019
-- Description:	select user
-- =============================================
CREATE PROCEDURE [dbsecurity].[sp_user_login] 
	-- Add the parameters for the stored procedure here
	@username nvarchar(20) = '' -- 'ALL' to select all
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
SELECT 
	[is_active],
	[password]

FROM [dbsecurity].[user]

WHERE [username] = @username

END
