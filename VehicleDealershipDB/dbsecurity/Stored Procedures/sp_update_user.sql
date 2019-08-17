-- =============================================
-- Author:		HOCK
-- Create date: 9.6.2019
-- Description:	UPDATE user
-- =============================================
CREATE PROCEDURE [dbsecurity].[sp_update_user] 
	-- Add the parameters for the stored procedure here
	@user INT,
	@username NVARCHAR(20),
	@name NVARCHAR(200),
	@ic_no nvarchar(30),
	@join_date date,
	@leave_date date,
	@img varbinary(max) = NULL,
	@usergroup nvarchar(20),
	@modified_by INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF @user = 1 
RETURN -- user 1 is admin. cannot be edited


UPDATE [dbsecurity].[user]
SET [username] = @username,
	[name] = @name,
	[ic_no] = @ic_no,
	[join_date] = @join_date,
	[leave_date] = @leave_date,
	[image] = @img,
	[modifed_by] = @modified_by
WHERE [user] = @user

IF (SELECT COUNT(*) FROM [dbsecurity].[user_usergroup] WHERE [user] = @user) > 0 
	UPDATE [dbsecurity].[user_usergroup]
	SET [usergroup] = @usergroup
	WHERE [user] = @user
ELSE
	INSERT INTO [dbsecurity].[user_usergroup]
	(
		[user],
		[usergroup],
		[modified_by]
	)
	VALUES (@user, @usergroup, @modified_by)

END
