-- =============================================
-- Author:		HOCK
-- Create date: 27.8.2019
-- Description:	select organisation type
-- =============================================
CREATE PROCEDURE hr.sp_select_organisation_type 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	[organisation_type],
	[organisation_type_description]

FROM [hr].[organisation_type]

ORDER BY [organisation_type_description]



END