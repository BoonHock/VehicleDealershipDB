-- =============================================
-- Author:		hock
-- Create date: 6.11.2019
-- Description:	select vehicle sale
-- =============================================
CREATE PROCEDURE [fin].[sp_select_vehicle_sale] 
	-- Add the parameters for the stored procedure here
	@vehicle int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT
	VSALE.[reference_no],
	VSALE.[customer_person],
	VSALE.[customer_organisation_branch],

	CUSTOMERPERSON.[name] AS [customer_person_name],
	CUSTOMERORG.[name] AS [customer_org_name],
	CUSTOMERORGBRANCH.[branch_name] AS [customer_branch_name],

	CUSTOMERPERSON.[ic_no] AS [customer_person_ic],
	CUSTOMERORG.[registration_no] AS [customer_org_reg_no],

	CASE WHEN VSALE.[customer_person] IS NULL THEN 'ORGANISATION' ELSE 'PERSON' END AS [customer_type],

	VSALE.[sale_date],
	VSALE.[sale_price],
	VSALE.[road_tax_amount],
	VSALE.[road_tax_month],

	-- LOAN
	VSALE.[loan],
	LOANORG.[name] AS [loan_org_name],
	LOANORG.[registration_no] AS [loan_org_reg_no],
	VSALE.[loan_amount],
	VSALE.[loan_month],
	VSALE.[loan_interest_percentage],
	VSALE.[loan_monthly_installment],
	VSALE.[loan_ref_no],
	VSALE.[loan_approval_date],
	VSALE.[loan_ownership_claim_no],

	-- INSURANCE
	VSALE.[insurance],
	INSURANCEORGBRANCH.[branch_name] AS [insurance_org_branch_name],
	INSURANCEORG.[name] AS [insurance_org_name],
	INSURANCEORG.[registration_no] AS [insurance_org_reg_no],
	VSALE.[insurance_cover_note_no],
	VSALE.[insurance_endorsement_no],
	VSALE.[insurance_policy_no],
	VSALE.[insurance_date],
	VSALE.[insurance_category],
	VSALE.[insurance_type],
	VSALE.[insurance_sum_insured],
	VSALE.[insurance_premium],
	VSALE.[insurance_stamp_duty],
	VSALE.[insurance_loading_percent],
	VSALE.[insurance_ncb_percent],
	VSALE.[insurance_windscreen],
	VSALE.[insurance_windscreen_sum_insured],

	VSALE.[guarantor_person],
	GUARANTOR.[name] AS [guarantor_name],

	VSALE.[salesperson] AS [salesperson_id],
	ISNULL(SALESPERSONPERSON.[name], SALESPERSONORG.[name]) AS [salesperson],

	VSALE.[remark]


FROM [fin].[vehicle_sale] VSALE

LEFT JOIN [hr].[person] CUSTOMERPERSON
	ON CUSTOMERPERSON.[person] = VSALE.[customer_person]

LEFT JOIN [hr].[organisation_branch] CUSTOMERORGBRANCH
	ON CUSTOMERORGBRANCH.[organisation_branch] = VSALE.[customer_organisation_branch]

LEFT JOIN [hr].[organisation] CUSTOMERORG
	ON CUSTOMERORG.[organisation] = CUSTOMERORGBRANCH.[organisation]

LEFT JOIN [hr].[organisation] LOANORG
	ON LOANORG.[organisation] = VSALE.[loan]

LEFT JOIN [hr].[person] GUARANTOR
	ON GUARANTOR.[person] = VSALE.[guarantor_person]

LEFT JOIN [hr].[organisation_branch] INSURANCEORGBRANCH
	ON INSURANCEORGBRANCH.[organisation_branch] = VSALE.[insurance]

LEFT JOIN [hr].[organisation] INSURANCEORG
	ON INSURANCEORG.[organisation] = INSURANCEORGBRANCH.[organisation]

LEFT JOIN [hr].[salesperson] SALESPERSON
	ON SALESPERSON.[salesperson] = VSALE.[salesperson]

LEFT JOIN [hr].[person] SALESPERSONPERSON
	ON SALESPERSONPERSON.[person] = SALESPERSON.[person]

LEFT JOIN [hr].[organisation_branch] SALESPERSONORGBRANCH
	ON SALESPERSONORGBRANCH.[organisation] = SALESPERSON.[organisation_branch]

LEFT JOIN [hr].[organisation] SALESPERSONORG
	ON SALESPERSONORG.[organisation] = SALESPERSONORGBRANCH.[organisation]

WHERE VSALE.[vehicle] = @vehicle


END