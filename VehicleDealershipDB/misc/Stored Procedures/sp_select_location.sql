-- =============================================
-- Author:		hock
-- Create date: 19.9.2019
-- Description:	select location
-- =============================================
CREATE PROCEDURE [misc].[sp_select_location] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	[location],
	[location_name],
	[modified_by]

FROM [misc].[location]

END