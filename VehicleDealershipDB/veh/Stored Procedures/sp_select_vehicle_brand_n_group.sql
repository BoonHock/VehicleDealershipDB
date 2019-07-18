-- =============================================
-- Author:		HOCK
-- Create date: 15.7.2019
-- Description:	select all vehicle brand and groups
-- =============================================
CREATE PROCEDURE [veh].[sp_select_vehicle_brand_n_group] 
	-- Add the parameters for the stored procedure here
	@vbrand INT = -1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	VGROUP.[vehicle_group],
	VGROUP.[vehicle_group_name],
	VGROUP.[vehicle_brand],
	VBRAND.[vehicle_brand_name],
	VBRAND.[country],
	HRCOUNTRY.[country_name]

FROM [veh].[vehicle_group] VGROUP

JOIN [veh].[vehicle_brand] VBRAND
	ON VGROUP.vehicle_brand = VBRAND.vehicle_brand

JOIN [hr].[country] HRCOUNTRY
	ON VBRAND.[country] = HRCOUNTRY.[country]

WHERE (@vbrand = -1 OR VBRAND.vehicle_brand = @vbrand)


END