-- =============================================
-- Author:		hock
-- Create date: 8.11.2019
-- Description:	select unsold vehicle
-- =============================================
CREATE PROCEDURE veh.sp_select_vehicle_unsold 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	VEHICLE.[vehicle],
	VEHICLE.[purchase_date],

	VEHICLE.[registration_no],
	CHASSIS.[chassis_no],
	VEHMODEL.[vehicle_model_name],
	VEHGROUP.[vehicle_group_name],
	VEHBRAND.[vehicle_brand_name],
	COLOUR.[colour_name],

	CASE WHEN VEHICLE.[vehicle_sale] IS NULL THEN 
		CASE WHEN VEHICLE.[consignment_mortgage] IS NULL THEN
			'PURCHASE'
		ELSE 
			CASE WHEN VEHICLE.[consignment_mortgage] = 1 THEN
				'CONSIGNMENT'
			ELSE 
				'MORTGAGE'
			END
		END
	ELSE 
		'TRADE-IN'
	END AS [acquire_method]

FROM [veh].[vehicle] VEHICLE

JOIN [veh].[chassis] CHASSIS
	ON CHASSIS.[chassis] = VEHICLE.[chassis]

JOIN [veh].[vehicle_model] VEHMODEL
	ON VEHMODEL.[vehicle_model] = CHASSIS.[vehicle_model]

JOIN [veh].[vehicle_group] VEHGROUP
	ON VEHGROUP.[vehicle_group] = VEHMODEL.[vehicle_group]

JOIN [veh].[vehicle_brand] VEHBRAND
	ON VEHBRAND.[vehicle_brand] = VEHGROUP.[vehicle_brand]

JOIN [misc].[colour] COLOUR
	ON COLOUR.[colour] = VEHICLE.[colour]

LEFT JOIN [fin].[vehicle_sale] VEHSALE
	ON VEHSALE.[vehicle] = VEHICLE.[vehicle]

LEFT JOIN [fin].[vehicle_return] VEHRETURN
	ON VEHRETURN.[vehicle] = VEHICLE.[vehicle]

WHERE VEHSALE.[vehicle] IS NULL 
	AND VEHRETURN.[vehicle] IS NULL

END