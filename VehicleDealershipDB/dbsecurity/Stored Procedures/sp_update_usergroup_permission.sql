-- =============================================
-- Author:		HOCK
-- Create date: 16.6.2019
-- Description:	update permission for usergroup
-- =============================================
CREATE PROCEDURE [dbsecurity].[sp_update_usergroup_permission] 
	-- Add the parameters for the stored procedure here
	@usergroup NVARCHAR(50),
	@arr_perm nvarchar(max),
	@uid INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
DECLARE @PERM_TABLE AS TABLE (
	permission NVARCHAR(50)
);

INSERT INTO @PERM_TABLE
SELECT * 
FROM string_split(@arr_perm, ',')
WHERE value IN 
(
	SELECT [permission]
	FROM [dbsecurity].[permission]
)

DELETE FROM [dbsecurity].[usergroup_permission]
WHERE [usergroup] = @usergroup
	AND [permission] NOT IN (SELECT * FROM @PERM_TABLE);

INSERT INTO [dbsecurity].[usergroup_permission]
(
	[usergroup],
	[permission],
	[modified_by]
)
SELECT 
	@usergroup,
	[permission],
	@uid

FROM @PERM_TABLE PERMTABLE
WHERE NOT EXISTS (
	SELECT *
	FROM [dbsecurity].[usergroup_permission] UP
	WHERE [usergroup] = @usergroup
		AND PERMTABLE.[permission] = UP.[permission]
) 


END
