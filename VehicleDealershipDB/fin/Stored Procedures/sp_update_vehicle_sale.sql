-- =============================================
-- Author:		HOCK
-- Create date: 26.11.2019
-- Description:	update vehicle sale
-- =============================================
CREATE PROCEDURE [fin].[sp_update_vehicle_sale] 
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@customer_person int,
	@customer_org_branch int,
	@sale_date date,
	@sale_price decimal(18,4),
	@road_tax_amount decimal(18,4),
	@road_tax_month tinyint,
	@loan int,
	@loan_amount decimal(18,4),
	@loan_month int,
	@loan_interest_percentage decimal(5,2),
	@loan_monthly_installment decimal(18,4),
	@loan_ref_no nvarchar(50),
	@loan_approval_date date,
	@loan_ownership_claim_no nvarchar(50),
	@guarantor_person int,

	@insurance int,
	@insurance_cover_note_no nvarchar(50),
	@insurance_endorsement_no nvarchar(50),
	@insurance_policy_no nvarchar(50),
	@insurance_date date,
	@insurance_type bit,
	@insurance_basic decimal(18,4),
	@insurance_sum_insured decimal(18,4),
	@insurance_comprehensive int,
	@insurance_add_comprehensive decimal(18,4),
	@insurance_adjustment decimal(18,4),
	@insurance_loading_age_percent decimal(5, 2),
	@insurance_loading_percent decimal(5,2),
	@insurance_ncd_percent decimal(5,2),
	@insurance_stamp_duty decimal(18,4),
	@insurance_windscreen_sum_insured decimal(18,4),
	@insurance_windscreen decimal(18,4),
	@insurance_total_payable decimal(18,4),

	@salesperson int,
	@remark nvarchar(255),
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [fin].[vehicle_sale]
SET	[customer_person] = @customer_person,
	[customer_organisation_branch] = @customer_org_branch,
	[sale_date] = @sale_date, 
	[sale_price] = @sale_price, 
	[road_tax_amount] = @road_tax_amount, 
	[road_tax_month] = @road_tax_month, 
	[loan] = @loan, 
	[loan_amount] = @loan_amount, 
	[loan_month] = @loan_month, 
	[loan_interest_percentage] = @loan_interest_percentage, 
	[loan_monthly_installment] = @loan_monthly_installment, 
	[loan_ref_no] = @loan_ref_no, 
	[loan_approval_date] = @loan_approval_date, 
	[loan_ownership_claim_no] = @loan_ownership_claim_no, 
	[guarantor_person] = @guarantor_person, 


	[insurance] = @insurance, 
	[insurance_cover_note_no] = @insurance_cover_note_no, 
	[insurance_endorsement_no] = @insurance_endorsement_no, 
	[insurance_policy_no] = @insurance_policy_no, 
	[insurance_date] = @insurance_date, 
	[insurance_type] = @insurance_type, 
	[insurance_basic_premium] = @insurance_basic,
	[insurance_sum_insured] = @insurance_sum_insured,
	[insurance_comprehensive] = @insurance_comprehensive,
	[insurance_additional_comprehensive] = @insurance_add_comprehensive,
	[insurance_adjustment] = @insurance_adjustment,
	[insurance_loading_age_percent] = @insurance_loading_age_percent,
	[insurance_loading_percent] = @insurance_loading_percent,
	[insurance_ncd_percent] = @insurance_ncd_percent, 
	[insurance_stamp_duty] = @insurance_stamp_duty, 
	[insurance_windscreen_sum_insured] = @insurance_windscreen_sum_insured, 
	[insurance_windscreen] = @insurance_windscreen, 
	[insurance_total_payable] = @insurance_total_payable,

	[salesperson] = @salesperson, 
	[remark] = @remark, 
	[modified_by] = @modified_by

WHERE [vehicle] = @vehicle

END