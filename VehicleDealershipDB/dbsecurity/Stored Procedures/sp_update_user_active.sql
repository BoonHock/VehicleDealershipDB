-- =============================================
-- Author:		HOCK
-- Create date: 9.6.2019
-- Description:	UPDATE user
-- =============================================
CREATE PROCEDURE [dbsecurity].[sp_update_user_active] 
	-- Add the parameters for the stored procedure here
	@user INT,
	@is_active BIT,
	@modified_by INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbsecurity].[user]

SET [is_active] = @is_active,
	[modifed_by] = @modified_by

WHERE [user] = @user
	AND [is_active] <> @is_active -- only update if there's a change
	AND [user] <> 1

END
