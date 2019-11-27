-- =============================================
-- Author:		hock
-- Create date: 17.9.2019
-- Description:	select vehicle
-- =============================================
CREATE PROCEDURE [veh].[sp_select_vehicle] 
	-- Add the parameters for the stored procedure here
	@vehicle int = -1,
	@reg_no nvarchar(10) = '',
	@chassis_no nvarchar(20) = ''

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	VEHICLE.[vehicle],
	VEHICLE.[reference_no_prefix],
	VEHICLE.[reference_no],
	VEHICLE.[purchase_date],
	VEHICLE.[seller_person],
	VEHICLE.[seller_organisation_branch],
	SELLERPERSON.[name] AS [seller_person_name],
	SELLERORG.[name] AS [seller_org_name],
	SELLERORGBRANCH.[branch_name] AS [seller_branch_name],

	VEHICLE.[registration_no],
	VEHICLE.[prev_registration_no],
	VEHICLE.[chassis],
	CHASSIS.[chassis_no],
	CHASSIS.[vehicle_model],
	VEHMODEL.[vehicle_model_name],
	VEHMODEL.[vehicle_group],
	VEHGROUP.[vehicle_group_name],
	VEHGROUP.[vehicle_brand],
	VEHBRAND.[vehicle_brand_name],
	VEHICLE.[colour],
	COLOUR.[colour_name],
	VEHICLE.[is_new],
	VEHMODEL.[year_make],
	CHASSIS.[registration_date],
	VEHICLE.[location],
	ISNULL(MISCLOCATION.[location_name], '') AS [location_name],

	VEHICLE.[engine_no],
	VEHICLE.[engine_cc],
	VEHICLE.[mileage],
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
	CASE WHEN VEHSALE.[vehicle] IS NULL THEN 
		CASE WHEN VEHRETURN.[vehicle] IS NULL THEN 
			'UNSOLD'
		ELSE 
			'RETURNED' 
		END
	ELSE 
		'SOLD'
	END AS [vehicle_status],

	VEHICLE.[vehicle_sale],
	VEHSALE.[reference_no] AS [sale_ref_no],
	VEHICLE.[consignment_mortgage],

	VEHICLE.[door_key],
	VEHICLE.[ignition_key],

	VEHICLE.[date_received],
	VEHICLE.[settlement_date],

	VEHICLE.[invoice_no],
	VEHICLE.[jpj_serial_no],

	VEHICLE.[road_tax],
	VEHICLE.[road_tax_expiry_date],

	VEHICLE.[purchase_price],
	VEHICLE.[overtrade],
	VEHICLE.[list_price],
	VEHICLE.[max_can_loan],
	
	VEHICLE.[loan_balance],
	VEHICLE.[loan_installment_amount],
	VEHICLE.[loan_finance],
	LOANORGBRANCH.[branch_name] AS [loan_branch_name],
	LOANORG.[name] AS [loan_org_name],
	VEHICLE.[loan_installment_day_of_month],
	VEHICLE.[loan_settlement_date],
	VEHICLE.[loan_agreement_no],

	VEHICLE.[remark],

	VEHICLE.[checked_by] AS [checked_by_id],
	CHECKER.[name] AS [checked_by],
	MODIFIEDBY.[name] AS [modified_by],
	GETDATE() AS [last_modified_on] -- @TODO: temporary

FROM [veh].[vehicle] VEHICLE

LEFT JOIN [hr].[person] SELLERPERSON
	ON SELLERPERSON.[person] = VEHICLE.[seller_person]

LEFT JOIN [hr].[organisation_branch] SELLERORGBRANCH
	ON SELLERORGBRANCH.[organisation_branch] = VEHICLE.[seller_organisation_branch]

LEFT JOIN [hr].[organisation] SELLERORG
	ON SELLERORG.[organisation] = SELLERORGBRANCH.[organisation]

LEFT JOIN [misc].[location] MISCLOCATION
	ON MISCLOCATION.[location] = VEHICLE.[location]

LEFT JOIN [hr].[organisation_branch] LOANORGBRANCH
	ON LOANORGBRANCH.[organisation_branch] = VEHICLE.[loan_finance]

LEFT JOIN [hr].[organisation] LOANORG
	ON LOANORG.[organisation] = LOANORGBRANCH.[organisation]

LEFT JOIN [dbsecurity].[user] CHECKER
	ON CHECKER.[user] = VEHICLE.[checked_by]

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

JOIN [dbsecurity].[user] MODIFIEDBY
	ON MODIFIEDBY.[user] = VEHICLE.[modified_by]

LEFT JOIN [fin].[vehicle_sale] VEHSALE
	ON VEHSALE.[vehicle] = VEHICLE.[vehicle]

LEFT JOIN [fin].[vehicle_return] VEHRETURN
	ON VEHRETURN.[vehicle] = VEHICLE.[vehicle]

WHERE (VEHICLE.[vehicle] = @vehicle OR @vehicle = -1)
	AND (VEHICLE.[registration_no] = @reg_no OR @reg_no = '')
	AND (CHASSIS.[chassis_no] = @chassis_no OR @chassis_no = '')


END