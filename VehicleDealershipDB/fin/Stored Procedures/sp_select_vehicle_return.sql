-- =============================================
-- Author:		hock
-- Create date: 22.10.2019
-- Description:	select vehicle return
-- =============================================
CREATE PROCEDURE [fin].[sp_select_vehicle_return] 
	-- Add the parameters for the stored procedure here
	@vehicle int = -1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT

	VEH.[vehicle],
	VEH.[registration_no],
	ISNULL(HRPERSON.[name], HRORG.[name]) AS [seller_name],
	ISNULL(ORGBRANCH.[branch_name],'') AS [seller_branch],
	VBRAND.[vehicle_brand_name] AS [vehicle_brand],
	VGROUP.[vehicle_group_name] AS [vehicle_group],
	VMODEL.[vehicle_model_name] AS [vehicle_model],
	VEH.[purchase_date],
	VRETURN.[return_date],
	VRETURN.[return_by] AS [return_by_id],
	RETURNBY.[name] AS [return_by],
	VRETURN.[compensation],
	VRETURN.[remark]

FROM [fin].[vehicle_return] VRETURN

JOIN [veh].[vehicle] VEH
	ON VEH.[vehicle] = VRETURN.[vehicle]

LEFT JOIN [hr].[person] HRPERSON
	ON HRPERSON.[person] = VEH.[seller_person]

LEFT JOIN [hr].[organisation_branch] ORGBRANCH
	ON ORGBRANCH.[organisation_branch] = VEH.[seller_organisation_branch]

LEFT JOIN [hr].[organisation] HRORG
	ON HRORG.[organisation] = ORGBRANCH.[organisation]

JOIN [veh].[chassis] VEHCHASSIS
	ON VEHCHASSIS.[chassis] = VEH.[chassis]

JOIN [veh].[vehicle_model] VMODEL
	ON VMODEL.[vehicle_model] = VEHCHASSIS.[vehicle_model]

JOIN [veh].[vehicle_group] VGROUP
	ON VGROUP.[vehicle_group] = VMODEL.[vehicle_group]

JOIN [veh].[vehicle_brand] VBRAND
	ON VBRAND.[vehicle_brand] = VGROUP.[vehicle_brand]

JOIN [dbsecurity].[user] RETURNBY
	ON RETURNBY.[user] = VRETURN.[return_by]

WHERE @vehicle = -1 OR VRETURN.[vehicle] = @vehicle

END