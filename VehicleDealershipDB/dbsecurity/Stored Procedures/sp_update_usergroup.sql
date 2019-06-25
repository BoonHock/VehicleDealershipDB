-- =============================================
-- Author:		hock
-- Create date: 12.6.2019
-- Description:	update usergroup
-- =============================================
CREATE PROCEDURE dbsecurity.sp_update_usergroup 
	-- Add the parameters for the stored procedure here
	@usergroup_new nvarchar(20),
	@usergroup_desc nvarchar(150),
	@usergroup_old nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbsecurity].[usergroup]
SET [usergroup] = @usergroup_new,
	[usergroup_desc] = @usergroup_desc

WHERE [usergroup] = @usergroup_old

END
