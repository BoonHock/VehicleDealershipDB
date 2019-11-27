-- =============================================
-- Author:		hock
-- Create date: 11.11.2019
-- Description:	select vehicle trade in
-- =============================================
CREATE PROCEDURE [veh].[sp_select_vehicle_trade_in] 
	-- Add the parameters for the stored procedure here
	@vsale int = 1,
	-- vehicle that is added as trade in but not saved yet. need to select them to show in form
	@vid_combine nvarchar(max) = '1'

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT
	VEHICLE.[vehicle],
	VEHICLE.[registration_no],
	VEHICLE.[purchase_price],
	VMGB.[vehicle_brand_name] + ' ' + 
		VMGB.[vehicle_group_name] + ' '  + 
		VMGB.[vehicle_model_name] AS [vehicle_model]

FROM [veh].[vehicle] VEHICLE

JOIN [veh].[chassis] CHASSIS
	ON CHASSIS.[chassis] = VEHICLE.[chassis]

JOIN [veh].[Vw_veh_model_group_brand] VMGB
	ON VMGB.[vehicle_model] = CHASSIS.[vehicle_model]

WHERE VEHICLE.[vehicle_sale] = @vsale
	OR VEHICLE.[vehicle] IN (SELECT * FROM string_split(@vid_combine,','))

END