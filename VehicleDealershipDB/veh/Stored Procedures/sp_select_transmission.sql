-- =============================================
-- Author:		hock
-- Create date: 15.8.2019
-- Description:	select fuel type
-- =============================================
CREATE PROCEDURE [veh].[sp_select_transmission] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	[transmission],
	[transmission_name]

FROM [VehicleDealership].[veh].[transmission]

ORDER BY [transmission_name]

END