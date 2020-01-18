-- =============================================
-- Author:		hock
-- Create date: 2.1.2020
-- Description:	vehicle sale doc
-- =============================================
CREATE PROCEDURE [fin].[sp_vehicle_sale_doc] 
	-- Add the parameters for the stored procedure here
	@vehicle_sale INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


SELECT
	SECURITYCOMPANY.[company_name],
	SECURITYCOMPANY.[registration_no] AS [company_registration_no],
	SECURITYCOMPANY.[address] AS [company_address],
	SECURITYCOMPANY.[tel_no] AS [company_tel_no],
	SECURITYCOMPANY.[fax_no] AS [company_fax_no],
	SECURITYCOMPANY.[email] AS [company_email],

	VSALE.[reference_no],
	VSALE.[reference_no_ext],
	VSALE.[sale_date],
	VSALE.[sale_price],
	VSALE.[road_tax_amount],
	VSALE.[road_tax_month],
	VSALE.[loan_amount],
	VSALE.[loan_month],
	VSALE.[loan_interest_percentage],
	VSALE.[loan_monthly_installment],
	VSALE.[loan_ref_no],
	VSALE.[loan_approval_date],
	VSALE.[loan_ownership_claim_no],
	VSALE.[insurance_cover_note_no],
	VSALE.[insurance_endorsement_no],
	VSALE.[insurance_policy_no],
	VSALE.[insurance_date],
	CASE WHEN VSALE.[insurance_type] = 1 THEN 'COMPREHENSIVE' ELSE 'THIRD PARTY' END AS [insurance_type],
	VSALE.[insurance_basic_premium],
	VSALE.[insurance_sum_insured],
	VSALE.[insurance_additional_comprehensive],
	VSALE.[insurance_adjustment],
	VSALE.[insurance_loading_age_percent],
	VSALE.[insurance_loading_percent],
	VSALE.[insurance_ncd_percent],
	VSALE.[insurance_stamp_duty],
	VSALE.[insurance_windscreen_sum_insured],
	VSALE.[insurance_windscreen],
	VSALE.[insurance_total_payable],
	VSALE.[remark],

	ISNULL(CUSTOMERORG.[name], CUSTOMERPERSON.[name]) AS [customer_name_short],
	CASE WHEN VSALE.[customer_person] IS NULL THEN CUSTOMERORG.[name] + CHAR(13)+CHAR(10) + 
		CUSTOMERORGBRANCH.[branch_name] ELSE CUSTOMERPERSON.[name] END AS [customer_name_long],
	CASE WHEN VSALE.[customer_person] IS NULL THEN CUSTOMERORG.[registration_no] ELSE CUSTOMERPERSON.[ic_no] END AS [customer_registration_no],
	CASE WHEN VSALE.[customer_person] IS NULL THEN 'Reg. no. :' + CUSTOMERORG.[registration_no] ELSE 'IC no. :' + CUSTOMERPERSON.[ic_no] END AS [customer_registration_no_with_text],
	CASE WHEN VSALE.[customer_person] IS NULL THEN CUSTOMERORGBRANCH.[address] ELSE CUSTOMERPERSON.[address] END AS [customer_address],

	ISNULL(SALESPERSONPERSON.[name], SALESPERSONORG.[name]) AS [salesperson],

	VEHICLE.[engine_cc],
	VEHICLE.[engine_no],
	VEHICLE.[registration_no],

	VEHBRAND.[vehicle_brand_name],
	VEHGROUP.[vehicle_group_name],
	VEHMODEL.[vehicle_model_name],
	VEHMODEL.[year_make],

	COLOUR.[colour_name],
	CHASSIS.[chassis_no],
	CHASSIS.[registration_date],

	ISNULL(VCHARGES.[amount], 0) AS [total_charges],
	ISNULL(VEXPENSES.[amount], 0) AS [total_expenses],
	ISNULL(TRADEIN.[amount], 0) AS [total_trade_in],
	ISNULL(PAID.[amount], 0) AS [total_paid],

	VSALE.[sale_price] + ISNULL(VEXPENSES.[amount], 0) + ISNULL(VCHARGES.[amount], 0) + 
		VSALE.[road_tax_amount] AS [Net_selling_price],

	VSALE.[sale_price] + ISNULL(VEXPENSES.[amount], 0) + ISNULL(VCHARGES.[amount], 0) + 
		VSALE.[road_tax_amount] - ISNULL(TRADEIN.[amount], 0) AS [Total_amount], 

	VSALE.[sale_price] + ISNULL(VEXPENSES.[amount], 0) + ISNULL(VCHARGES.[amount], 0) + 
		VSALE.[road_tax_amount] - ISNULL(TRADEIN.[amount], 0) - 
		ISNULL(PAID.[amount], 0) AS [Unpaid_balance] -- CHECK THIS 



FROM [fin].[vehicle_sale] VSALE

LEFT JOIN [hr].[person] CUSTOMERPERSON
	ON CUSTOMERPERSON.[person] = VSALE.[customer_person]

LEFT JOIN [hr].[organisation_branch] CUSTOMERORGBRANCH
	ON CUSTOMERORGBRANCH.[organisation_branch] = VSALE.[customer_organisation_branch]

LEFT JOIN [hr].[organisation] CUSTOMERORG
	ON CUSTOMERORG.[organisation] = CUSTOMERORGBRANCH.[organisation]

LEFT JOIN [hr].[salesperson] SALESPERSON
	ON SALESPERSON.[salesperson] = VSALE.[salesperson]

LEFT JOIN [hr].[person] SALESPERSONPERSON
	ON SALESPERSONPERSON.[person] = SALESPERSON.[person]

LEFT JOIN [hr].[organisation_branch] SALESPERSONORGBRANCH
	ON SALESPERSONORGBRANCH.[organisation] = SALESPERSON.[organisation_branch]

LEFT JOIN [hr].[organisation] SALESPERSONORG
	ON SALESPERSONORG.[organisation] = SALESPERSONORGBRANCH.[organisation]

LEFT JOIN [hr].[organisation_branch] LOANORGBRANCH
	ON LOANORGBRANCH.[organisation_branch] = VSALE.[loan]

LEFT JOIN [hr].[organisation] LOANORG
	ON LOANORG.[organisation] = LOANORGBRANCH.[organisation]

LEFT JOIN [hr].[organisation_branch] INSURANCEORGBRANCH
	ON INSURANCEORGBRANCH.[organisation_branch] = VSALE.[insurance]

LEFT JOIN [hr].[organisation] INSURANCEORG
	ON INSURANCEORG.[organisation] = INSURANCEORGBRANCH.[organisation]

LEFT JOIN [hr].[person] GUARANTOR
	ON GUARANTOR.[person] = VSALE.[guarantor_person]

JOIN [dbsecurity].[company] SECURITYCOMPANY
	ON 1 = 1

JOIN [veh].[vehicle] VEHICLE
	ON VSALE.[vehicle] = VEHICLE.[vehicle]

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

LEFT JOIN 
(
	SELECT 
		[vehicle],
		SUM([amount]) AS [amount]

	FROM [fin].[vehicle_sale_charges]

	WHERE [vehicle] = @vehicle_sale 

	GROUP BY [vehicle]
) VCHARGES
	ON VCHARGES.[vehicle] = VSALE.[vehicle]

LEFT JOIN 
(
	SELECT 
		VEXP.[vehicle],
		SUM(PAYOUT.[amount]) AS [amount]

	FROM [fin].[vehicle_expenses] VEXP

	JOIN [fin].[payment_out] PAYOUT
		ON PAYOUT.[payment_out] = VEXP.[payment]

	--WHERE [vehicle] = @vehicle_sale 

	GROUP BY VEXP.[vehicle]
) VEXPENSES
	ON VEXPENSES.[vehicle] = VSALE.[vehicle]

LEFT JOIN 
(
	SELECT 
		@vehicle_sale AS [vehicle_sale],
		SUM([purchase_price]) AS [amount]
	FROM [veh].[vehicle]

	WHERE [vehicle_sale] = @vehicle_sale
) TRADEIN
	ON TRADEIN.[vehicle_sale] = VSALE.[vehicle]

LEFT JOIN 
(
	SELECT 
		@vehicle_sale AS [vehicle_sale],
		SUM(PAYMENT.[amount]) AS [amount]
	FROM [fin].[veh_sale_payment_customer] VSALE

	JOIN [fin].[payment_in] PAYMENT
		ON PAYMENT.[payment_in] = VSALE.[payment_in]

	WHERE [vehicle] = @vehicle_sale
) PAID
	ON PAID.[vehicle_sale] = VSALE.[vehicle]

WHERE VSALE.[vehicle] = @vehicle_sale





END