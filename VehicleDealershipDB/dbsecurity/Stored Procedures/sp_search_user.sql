-- =============================================
-- Author:		hock
-- Create date: 14.04.2019
-- Description:	select user
-- =============================================
CREATE PROCEDURE [dbsecurity].[sp_search_user] 
	-- Add the parameters for the stored procedure here
	@search nvarchar(200) = '', -- 'ALL' to select all
	@is_active bit = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
SELECT 
	U.[user],
	U.[username],
	U.[name],
	UG.[usergroup],
	U.[ic_no],
	U.[is_active],
	U.[join_date],
	U.[leave_date]

FROM [dbsecurity].[user] U

LEFT JOIN [dbsecurity].[user_usergroup] UUG
	ON U.[user] = UUG.[user]

LEFT JOIN [dbsecurity].[usergroup] UG
	ON UUG.[usergroup] = UG.[usergroup]

WHERE (U.[username] LIKE '%' + @search + '%'
		OR U.[name] LIKE '%' + @search + '%'
		OR U.[ic_no] LIKE '%' + @search + '%')
	AND (@is_active IS NULL OR U.[is_active] = @is_active)

END
