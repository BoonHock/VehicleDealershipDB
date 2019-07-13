-- =============================================
-- Author:		hock
-- Create date: 16.6.2019
-- Description:	delete usergroup
-- =============================================
CREATE PROCEDURE [dbsecurity].[sp_delete_usergroup] 
	-- Add the parameters for the stored procedure here
	@user INT,
	@usergroup nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO dbhistory.usergroup
(
	[usergroup],
	[usergroup_desc],
	[modified_by],
	[modified_on]
)
SELECT
	[usergroup],
	[usergroup_desc],
	@user,
	SYSDATETIME()
FROM dbsecurity.usergroup
WHERE usergroup = @usergroup


DELETE FROM [dbsecurity].[usergroup]
WHERE [usergroup] = @usergroup

END
