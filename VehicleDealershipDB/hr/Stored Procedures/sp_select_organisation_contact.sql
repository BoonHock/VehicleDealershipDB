-- =============================================
-- Author:		hock
-- Create date: 1.9.2019
-- Description:	select contact
-- =============================================
CREATE PROCEDURE [hr].[sp_select_organisation_contact] 
	-- Add the parameters for the stored procedure here
	@org INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	[contact],
	[remark]

FROM [hr].[organisation_contact]

WHERE [organisation] = @org

END