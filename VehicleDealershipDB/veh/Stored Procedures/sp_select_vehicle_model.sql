-- =============================================
-- Author:		HOCK
-- Create date: 3.8.2019
-- Description:	select vehicle model
-- =============================================
CREATE PROCEDURE [veh].[sp_select_vehicle_model] 
	-- Add the parameters for the stored procedure here
	@int_country INT = 80,
	@int_vbrand INT = -1,
	@int_vgroup INT = -1,
	@int_vmodel INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT
	VMODEL.[vehicle_model],
	VMODEL.[vehicle_model_name],
	VMODEL.[year_make],
	VMODEL.[engine_capacity],
	VMODEL.[no_of_door],
	VMODEL.[seat_capacity],
	VMODEL.[fuel_type],
	FUELTYPE.[fuel_type_name],
	VMODEL.[transmission],
	TRANSMISSION.[transmission_name],
	VMODEL.[remarks],
	VMODEL.[vehicle_group],
	VGROUP.[vehicle_group_name],
	VGROUP.[vehicle_brand],
	VBRAND.[vehicle_brand_name],
	VBRAND.[country],
	HRCOUNTRY.[country_name]
	
FROM [veh].[vehicle_model] VMODEL

JOIN [veh].[vehicle_group] VGROUP
	ON VGROUP.[vehicle_group] = VMODEL.[vehicle_group]

JOIN [veh].[vehicle_brand] VBRAND
	ON VBRAND.[vehicle_brand] = VGROUP.[vehicle_brand]

JOIN [hr].[country] HRCOUNTRY
	ON HRCOUNTRY.[country] = VBRAND.[country]

JOIN [veh].[fuel_type] FUELTYPE
	ON FUELTYPE.[fuel_type] = VMODEL.[fuel_type]

JOIN [veh].[transmission] TRANSMISSION
	ON TRANSMISSION.[transmission] = VMODEL.[transmission]
	
WHERE (@int_country = -1 OR VBRAND.[country] = @int_country)
	AND (@int_vbrand = -1 OR VBRAND.[vehicle_brand] = @int_vbrand)
	AND (@int_vgroup = -1 OR VGROUP.[vehicle_group] = @int_vgroup)
	AND (@int_vmodel = -1 OR VMODEL.[vehicle_model] = @int_vmodel)


END