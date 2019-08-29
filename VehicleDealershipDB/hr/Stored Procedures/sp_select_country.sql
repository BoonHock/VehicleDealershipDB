-- =============================================
-- Author:		hock
-- Create date: 29.8.2019
-- Description:	select country
-- =============================================
CREATE PROCEDURE hr.sp_select_country 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	[country],
	[cc_iso],
	[country_name]

FROM [hr].[country]

ORDER BY [country_name]

END