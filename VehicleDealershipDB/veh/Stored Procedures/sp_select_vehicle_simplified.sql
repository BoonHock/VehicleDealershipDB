-- =============================================
-- Author:		hock
-- Create date: 9.9.2019
-- Description:	select vehicle
-- =============================================
CREATE PROCEDURE [veh].[sp_select_vehicle_simplified] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	CASE WHEN VEHSALE.[vehicle] IS NULL THEN 
		CASE WHEN VEHRETURN.[vehicle] IS NULL THEN 
			'UNSOLD'
		ELSE 
			'RETURNED' 
		END
	ELSE 
		'SOLD'
	END AS [vehicle_status],

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
	END AS [acquire_method],
	VEHICLE.[reference_no],
	VEHICLE.[vehicle],
	VEHICLE.[registration_no],
	ISNULL(HRPERSON.[name], HRORG.[name]) AS [seller_name],
	ORGBRANCH.[branch_name],
	ISNULL(VEHMODEL.[vehicle_model_name], '') AS [vehicle_model],
	VEHICLE.[purchase_date],
	MISCLOCATION.[location_name] AS [location],
	VEHCHASSIS.[chassis_no],
	VEHICLE.[engine_no],
	VEHMODEL.[year_make],

	SECURITYUSER.[name] AS [modified_by]


FROM [veh].[vehicle] VEHICLE

LEFT JOIN [misc].[location] MISCLOCATION
	ON MISCLOCATION.[location] = VEHICLE.[location]

LEFT JOIN [hr].[person] HRPERSON
	ON HRPERSON.[person] = VEHICLE.[seller_person]

LEFT JOIN [hr].[organisation_branch] ORGBRANCH
	ON ORGBRANCH.[organisation_branch] = VEHICLE.[seller_organisation_branch]

LEFT JOIN [hr].[organisation] HRORG
	ON HRORG.[organisation] = ORGBRANCH.[organisation]

JOIN [veh].[chassis] VEHCHASSIS
	ON VEHCHASSIS.[chassis] = VEHICLE.[chassis]

JOIN [veh].[vehicle_model] VEHMODEL
	ON VEHMODEL.[vehicle_model] = VEHCHASSIS.[vehicle_model]

LEFT JOIN [fin].[vehicle_sale] VEHSALE
	ON VEHSALE.[vehicle] = VEHICLE.[vehicle]

LEFT JOIN [fin].[vehicle_return] VEHRETURN
	ON VEHRETURN.[vehicle] = VEHICLE.[vehicle]

JOIN [dbsecurity].[user] SECURITYUSER
	ON SECURITYUSER.[user] = VEHICLE.[modified_by]

END