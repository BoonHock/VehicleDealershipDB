-- =============================================
-- Author:		hock
-- Create date: 30.7.2019
-- Description:	select vehicle brands
-- =============================================
CREATE PROCEDURE veh.sp_option_vehicle_brand 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	[vehicle_brand] AS [value],
	[vehicle_brand_name] AS [display]

FROM [veh].[vehicle_brand]

ORDER BY [vehicle_brand_name]


END