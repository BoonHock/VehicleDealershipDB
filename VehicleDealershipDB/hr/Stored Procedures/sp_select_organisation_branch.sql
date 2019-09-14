-- =============================================
-- Author:		hock
-- Create date: 14.9.2019
-- Description:	select organisation branch
-- =============================================
CREATE PROCEDURE hr.sp_select_organisation_branch 
	-- Add the parameters for the stored procedure here
	@org int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	[organisation_branch],
	[branch_name],
	[address],
	[city],
	[state],
	[postcode],
	[country],
	[modified_by]

FROM [hr].[organisation_branch]

WHERE [organisation] = @org

END