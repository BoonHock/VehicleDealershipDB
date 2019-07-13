-- =============================================
-- Author:		HOCK
-- Create date: 13.7.2019
-- Description:	check_user_has_permission
-- =============================================
CREATE FUNCTION dbsecurity.svf_check_user_permission 
(
	-- Add the parameters for the function here
	@user int = 3, 
	@permission nvarchar(50) = 'ADD_USER'
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result bit

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = (
	select CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0 END
	from [dbsecurity].[user_usergroup] uug

	join [dbsecurity].[usergroup_permission] ugp
		on [uug].[usergroup] = ugp.[usergroup]

	where uug.[user] = @user
		and ugp.[permission] = @permission
	)

	-- Return the result of the function
	RETURN @Result

END