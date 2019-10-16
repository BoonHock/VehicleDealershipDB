-- =============================================
-- Author:		hock
-- Create date: 15.10.2019
-- Description:	select for vehicle received note
-- =============================================
create PROCEDURE fin.[sp_vehicle_received_note] 
	-- Add the parameters for the stored procedure here
	@vehicle INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	VEHICLE.[vehicle],
	SECURITYCOMPANY.[company_name],
	SECURITYCOMPANY.[registration_no] AS [company_registration_no],
	VEHICLE.[reference_no],
	CASE WHEN VEHICLE.[seller_person] IS NULL THEN SELLERORG.[name] + CHAR(13)+CHAR(10) + 
		SELLERORGBRANCH.[branch_name] ELSE SELLERPERSON.[name] END AS [customer_name],
	CASE WHEN VEHICLE.[seller_person] IS NULL THEN SELLERORG.[registration_no] ELSE SELLERPERSON.[ic_no] END AS [customer_registration_no],
	CASE WHEN VEHICLE.[seller_person] IS NULL THEN SELLERORGBRANCH.[address] ELSE SELLERPERSON.[address] END AS [customer_address],
	CHASSIS.[chassis_no],
	VEHBRAND.[vehicle_brand_name] + ' ' + VEHGROUP.[vehicle_group_name] + 
		' ' + VEHMODEL.[vehicle_model_name] AS [vehicle_name],
	COLOUR.[colour_name],
	VEHMODEL.[year_make],
	CHASSIS.[registration_date],

	VEHICLE.[registration_no],
	VEHICLE.[invoice_no],

	VEHICLE.[purchase_date],
	VEHICLE.[date_received],

	VEHICLE.[engine_no],
	VEHICLE.[engine_cc],

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

	VEHICLE.[road_tax],
	VEHICLE.[road_tax_expiry_date],

	VEHICLE.[purchase_price],
	VEHICLE.[overtrade],
	VEHICLE.[max_can_loan],

	VEHICLE.[purchase_price] - VEHICLE.[overtrade] AS [purchase_cost],
	ISNULL(VEXP.[amount],0) AS [total_expenses],

	VEHICLE.[purchase_price] - VEHICLE.[overtrade] + ISNULL(VEXP.[amount],0) AS [total_cost],

	VEHICLE.[loan_balance],
	VEHICLE.[loan_installment_amount],
	LOANORGBRANCH.[branch_name] AS [loan_branch_name],
	LOANORG.[name] AS [loan_org_name],
	VEHICLE.[loan_installment_day_of_month],
	VEHICLE.[loan_settlement_date],
	VEHICLE.[loan_agreement_no],

	VEHICLE.[remark],

	CHECKER.[name] AS [checked_by]

FROM [veh].[vehicle] VEHICLE

LEFT JOIN [hr].[person] SELLERPERSON
	ON SELLERPERSON.[person] = VEHICLE.[seller_person]

LEFT JOIN [hr].[organisation_branch] SELLERORGBRANCH
	ON SELLERORGBRANCH.[organisation_branch] = VEHICLE.[seller_organisation_branch]

LEFT JOIN [hr].[organisation] SELLERORG
	ON SELLERORG.[organisation] = SELLERORGBRANCH.[organisation]

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

JOIN [dbsecurity].[company] SECURITYCOMPANY
	ON 1 = 1

LEFT JOIN (
	SELECT
		VEXP.[vehicle],
		SUM(PAYMENT.[amount]) AS [amount]

	FROM [fin].[vehicle_expenses] VEXP

	JOIN [fin].[payment] PAYMENT
		ON PAYMENT.[payment] = VEXP.[payment]

	GROUP BY VEXP.[vehicle]
) VEXP
	ON VEXP.[vehicle] = VEHICLE.[vehicle]

WHERE VEHICLE.[vehicle] = @vehicle

END