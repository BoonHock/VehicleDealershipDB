-- =============================================
-- Author:		hock
-- Create date: 22.9.2019
-- Description:	select chassis
-- =============================================
CREATE PROCEDURE [veh].[sp_select_chassis] 
	-- Add the parameters for the stored procedure here
	@chassis_no nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	CHASSIS.[chassis],
	CHASSIS.[chassis_no],
	CHASSIS.[vehicle_model],
	VMODEL.[vehicle_model_name],
	VMODEL.[vehicle_group],
	VGROUP.[vehicle_group_name],
	VGROUP.[vehicle_brand],
	VBRAND.[vehicle_brand_name],
	CHASSIS.[registration_date],
	CHASSIS.[modified_by] AS [modified_by_id],
	SECURITYUSER.[name] AS [modified_by]

FROM [veh].[chassis] CHASSIS

JOIN [veh].[vehicle_model] VMODEL
	ON VMODEL.[vehicle_model] = CHASSIS.[vehicle_model]

JOIN [veh].[vehicle_group] VGROUP
	ON VGROUP.[vehicle_group] = VMODEL.[vehicle_group]

JOIN [veh].[vehicle_brand] VBRAND
	ON VBRAND.[vehicle_brand] = VGROUP.[vehicle_brand]

JOIN [dbsecurity].[user] SECURITYUSER
	ON SECURITYUSER.[user] = CHASSIS.[modified_by]

WHERE @chassis_no = '' 
	OR CHASSIS.[chassis_no] = @chassis_no

END