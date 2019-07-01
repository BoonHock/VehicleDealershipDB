-- =============================================
-- Author:		hock
-- Create date: 1.7.2019
-- Description:	assign all permission to administrator
-- =============================================
CREATE PROCEDURE dbsecurity.usp_assign_all_permission_to_administrator 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO dbsecurity.usergroup_permission

SELECT 
	UG.usergroup, 
	P.permission
FROM dbsecurity.usergroup UG

JOIN dbsecurity.permission P
	ON 1=1

WHERE UG.[usergroup] = 'ADMINISTRATOR'
	AND NOT EXISTS (
		SELECT *
		FROM dbsecurity.usergroup_permission UGP
		WHERE UG.usergroup = UGP.usergroup
			AND P.[permission] = UGP.permission
	)

END