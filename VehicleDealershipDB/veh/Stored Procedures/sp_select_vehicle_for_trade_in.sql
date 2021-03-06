﻿-- =============================================
-- Author:		hock
-- Create date: 26.12.2019
-- Description:	select vehicle for trade in
-- =============================================
CREATE PROCEDURE [veh].[sp_select_vehicle_for_trade_in] 
	-- Add the parameters for the stored procedure here
	@vid_exclude_combine nvarchar(max) = '1'
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

WHERE VEHICLE.[vehicle_sale] IS NULL
	AND VEHICLE.[vehicle] NOT IN (SELECT * FROM string_split(@vid_exclude_combine,','))
	-- vehicle must not be returned or sold already
	AND VEHICLE.[vehicle] NOT IN (SELECT [vehicle_return].[vehicle] FROM [fin].[vehicle_return])
	AND VEHICLE.[vehicle] NOT IN (SELECT [vehicle_sale].[vehicle] FROM [fin].[vehicle_sale])


ORDER BY VEHICLE.[registration_no]


END