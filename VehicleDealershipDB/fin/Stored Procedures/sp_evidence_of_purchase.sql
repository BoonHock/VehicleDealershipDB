-- =============================================
-- Author:		hock
-- Create date: 17.10.2019
-- Description:	evidence of purchase
-- =============================================
CREATE PROCEDURE [fin].[sp_evidence_of_purchase] 
	-- Add the parameters for the stored procedure here
	@vehicle INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT
	SECURITYCOMPANY.[company_name],
	SECURITYCOMPANY.[registration_no] AS [company_registration_no],
	SECURITYCOMPANY.[address],
	SECURITYCOMPANY.[tel_no],
	SECURITYCOMPANY.[fax_no],
	SECURITYCOMPANY.[email],
	VEHICLE.[reference_no],
	CASE WHEN VEHICLE.[seller_person] IS NULL THEN SELLERORG.[name] + CHAR(13)+CHAR(10) + 
		SELLERORGBRANCH.[branch_name] ELSE SELLERPERSON.[name] END AS [customer_name],
	CASE WHEN VEHICLE.[seller_person] IS NULL THEN SELLERORG.[registration_no] ELSE SELLERPERSON.[ic_no] END AS [customer_registration_no],
	CASE WHEN VEHICLE.[seller_person] IS NULL THEN SELLERORGBRANCH.[address] ELSE SELLERPERSON.[address] END AS [customer_address],
	CHASSIS.[chassis_no],
	VEHICLE.[registration_no],

	VEHBRAND.[vehicle_brand_name],
	VEHGROUP.[vehicle_group_name],
	VEHMODEL.[vehicle_model_name],

	COLOUR.[colour_name],

	VEHMODEL.[year_make],
	CHASSIS.[registration_date],

	VEHICLE.[purchase_date],
	VEHICLE.[date_received],

	VEHICLE.[engine_no],
	VEHICLE.[purchase_price]


FROM [veh].[vehicle] VEHICLE

LEFT JOIN [hr].[person] SELLERPERSON
	ON SELLERPERSON.[person] = VEHICLE.[seller_person]

LEFT JOIN [hr].[organisation_branch] SELLERORGBRANCH
	ON SELLERORGBRANCH.[organisation_branch] = VEHICLE.[seller_organisation_branch]

LEFT JOIN [hr].[organisation] SELLERORG
	ON SELLERORG.[organisation] = SELLERORGBRANCH.[organisation]

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

JOIN [dbsecurity].[company] SECURITYCOMPANY
	ON 1 = 1

WHERE VEHICLE.[vehicle] = @vehicle

END