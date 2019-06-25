-- =============================================
-- Author:		hock
-- Create date: 11.6.2019
-- Description:	create new usergroup
-- =============================================
CREATE PROCEDURE dbsecurity.sp_insert_usergroup 
	-- Add the parameters for the stored procedure here
	@usergroup nvarchar(20),
	@usergroup_desc nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbsecurity].[usergroup]
(
	[usergroup],
	[usergroup_desc]
)
VALUES 
(
	@usergroup,
	@usergroup_desc
)

END
