-- =============================================
-- Author:		hock
-- Create date: 22.5.2019
-- Description:	check_has_permission
-- =============================================
CREATE PROCEDURE [dbsecurity].[sp_check_user_permission] 
	-- Add the parameters for the stored procedure here
	@user int, 
	@permission nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select COUNT(*)
from [dbsecurity].[user_usergroup] uug

join [dbsecurity].[usergroup_permission] ugp
	on [uug].[usergroup] = ugp.[usergroup]

where uug.[user] = @user
	and ugp.[permission] = @permission
	

END
