-- =============================================
-- Author:		HOCK
-- Create date: 15.7.2019
-- Description:	check vehicle brand name available. 1 - available. 0 - not available
-- =============================================
CREATE PROCEDURE [veh].[sp_is_vehicle_brand_name_available] 
	-- Add the parameters for the stored procedure here
	@vbrand_to_exclude INT = 1, -- if user editing and doesnt change brand name, will return true
	@vbrand_name nvarchar(20) = 'TOYOTA'

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT CAST(CASE WHEN COUNT(*) = 0 THEN 1 ELSE 0 END AS bit)
FROM veh.vehicle_brand

WHERE vehicle_brand <> @vbrand_to_exclude
	AND vehicle_brand_name = @vbrand_name;

END