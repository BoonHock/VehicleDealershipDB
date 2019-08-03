-- =============================================
-- Author:		HOCK
-- Create date: 1.8.2019
-- Description:	select veh brand by veh group
-- =============================================
CREATE PROCEDURE veh.sp_select_veh_brand_by_veh_group 
	-- Add the parameters for the stored procedure here
	@vgroup INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	VBRAND.[vehicle_brand],
	VBRAND.[vehicle_brand_name]

FROM [veh].[vehicle_brand] VBRAND

JOIN [veh].[vehicle_group] VGROUP
	ON VGROUP.[vehicle_brand] = VBRAND.[vehicle_brand]

WHERE VGROUP.[vehicle_group] = @vgroup

END