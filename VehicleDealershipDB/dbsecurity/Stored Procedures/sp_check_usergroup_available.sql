-- =============================================
-- Author:		HOCK
-- Create date: 9.6.2019
-- Description:	check usergroup available
-- =============================================
CREATE PROCEDURE [dbsecurity].[sp_check_usergroup_available] 
	-- Add the parameters for the stored procedure here
	@usergroup NVARCHAR(20), -- usergroup to exclude from COUNT(*)
	@exclude_usergroup NVARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT COUNT(*)
FROM [dbsecurity].[usergroup]

WHERE [usergroup] = @usergroup
	AND [usergroup] <> @exclude_usergroup

END
