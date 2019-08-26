-- =============================================
-- Author:		hock
-- Create date: 26.8.2019
-- Description:	select organisation simplified
-- =============================================
CREATE PROCEDURE hr.sp_select_organisation1 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	[organisation],
	[name],
	[registration_no]

FROM [hr].[organisation]



END