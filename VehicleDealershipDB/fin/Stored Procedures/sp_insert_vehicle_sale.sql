-- =============================================
-- Author:		hock
-- Create date: 24.11.2019
-- Description:	insert vehicle sale
-- =============================================
CREATE PROCEDURE [fin].[sp_insert_vehicle_sale] 
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@ref_no_prefix nvarchar(5),
	@customer_person int,
	@customer_org_branch int,
	@sale_date date,
	@sale_price decimal(18,4),
	@road_tax_amount decimal(18,4),
	@road_tax_month tinyint,
	@loan int,
	@loan_amount decimal(18,4),
	@loan_month_term tinyint,
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
	@insurance_category int,
	@insurance_type int,
	@insurance_sum_insured decimal(18,4),
	@insurance_premium decimal(18,4),
	@insurance_stamp_duty decimal(18,4),
	@insurance_loading_percent decimal(5,2),
	@insurance_ncb_percent decimal(5,2),
	@insurance_windscreen decimal(18,4),
	@insurance_windscreen_sum_insured decimal(18,4),
	@salesperson int,
	@remark nvarchar(255),
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [fin].[vehicle_sale]
(
	[vehicle],
	[reference_no_prefix],
	[customer_person],
	[customer_organisation_branch],
	[sale_date], 
	[sale_price], 
	[road_tax_amount], 
	[road_tax_month], 
	[loan], 
	[loan_amount], 
	[loan_month_term], 
	[loan_interest_percentage], 
	[loan_monthly_installment], 
	[loan_ref_no], 
	[loan_approval_date], 
	[loan_ownership_claim_no], 
	[guarantor_person], 
	[insurance], 
	[insurance_cover_note_no], 
	[insurance_endorsement_no], 
	[insurance_policy_no], 
	[insurance_date], 
	[insurance_category], 
	[insurance_type], 
	[insurance_sum_insured], 
	[insurance_premium], 
	[insurance_stamp_duty], 
	[insurance_loading_percent], 
	[insurance_ncb_percent], 
	[insurance_windscreen], 
	[insurance_windscreen_sum_insured], 
	[salesperson], 
	[remark], 
	[modified_by]
)
VALUES 
(
	@vehicle,
	@ref_no_prefix,
	@customer_person,
	@customer_org_branch,
	@sale_date,
	@sale_price,
	@road_tax_amount,
	@road_tax_month,
	@loan,
	@loan_amount,
	@loan_month_term,
	@loan_interest_percentage,
	@loan_monthly_installment,
	@loan_ref_no,
	@loan_approval_date,
	@loan_ownership_claim_no,
	@guarantor_person,
	@insurance,
	@insurance_cover_note_no,
	@insurance_endorsement_no,
	@insurance_policy_no,
	@insurance_date,
	@insurance_category,
	@insurance_type,
	@insurance_sum_insured,
	@insurance_premium,
	@insurance_stamp_duty,
	@insurance_loading_percent,
	@insurance_ncb_percent,
	@insurance_windscreen,
	@insurance_windscreen_sum_insured,
	@salesperson,
	@remark,
	@modified_by
)

END