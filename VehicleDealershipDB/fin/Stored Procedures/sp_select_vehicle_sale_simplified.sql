-- =============================================
-- Author:		HOCK
-- Create date: 8.11.2019
-- Description:	select vehicle sale simplified
-- =============================================
CREATE PROCEDURE [fin].[sp_select_vehicle_sale_simplified] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	VSALE.[vehicle],
	VSALE.[reference_no],
	VEHICLE.[registration_no],

	CASE WHEN VSALE.[customer_person] IS NULL THEN 
		CUSTOMERORG.[name] + ' ' + CUSTOMERORGBRANCH.[branch_name] ELSE
		CUSTOMERPERSON.[name] END AS [customer],

	CASE WHEN VSALE.[customer_person] IS NULL THEN 'ORGANISATION' ELSE 'PERSON' END AS [customer_type],

	VSALE.[sale_date],
	VSALE.[sale_price],

	GUARANTOR.[name] AS [guarantor_name],

	ISNULL(SALESPERSONPERSON.[name], SALESPERSONORG.[name]) AS [salesperson]

FROM [fin].[vehicle_sale] VSALE

JOIN [veh].[vehicle] VEHICLE
	ON VEHICLE.[vehicle] = VSALE.[vehicle]

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

LEFT JOIN [fin].[insurance_category] INSURANCECAT
	ON INSURANCECAT.[insurance_category] = VSALE.[insurance_category]

LEFT JOIN [fin].[insurance_type] INSURANCETYPE
	ON INSURANCETYPE.[insurance_type] = VSALE.[insurance_type]

LEFT JOIN [hr].[salesperson] SALESPERSON
	ON SALESPERSON.[salesperson] = VSALE.[salesperson]

LEFT JOIN [hr].[person] SALESPERSONPERSON
	ON SALESPERSONPERSON.[person] = SALESPERSON.[person]

LEFT JOIN [hr].[organisation_branch] SALESPERSONORGBRANCH
	ON SALESPERSONORGBRANCH.[organisation_branch] = SALESPERSON.[organisation_branch]

LEFT JOIN [hr].[organisation] SALESPERSONORG
	ON SALESPERSONORG.[organisation] = SALESPERSONORGBRANCH.[organisation]


END