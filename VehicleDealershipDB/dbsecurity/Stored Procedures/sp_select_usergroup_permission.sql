-- =============================================
-- Author:		HOCK
-- Create date: 9.6.2019
-- Description:	select permission by user_group
-- =============================================
CREATE PROCEDURE [dbsecurity].[sp_select_usergroup_permission] 
	-- Add the parameters for the stored procedure here
	@usergroup nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	p.[permission],
	p.[permission_desc]

FROM [dbsecurity].[usergroup_permission] UGP

JOIN [dbsecurity].[permission] P
	ON UGP.[permission] = P.[permission]

WHERE UGP.[usergroup] = @usergroup

END
