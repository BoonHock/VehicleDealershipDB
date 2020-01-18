-- =============================================
-- Author:		HOCK
-- Create date: 15.7.2019
-- Description:	select vehicle group
-- =============================================
CREATE PROCEDURE [veh].[sp_select_vehicle_group_for_edit] 
	-- Add the parameters for the stored procedure here
	@vbrand INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT 
	[vehicle_group],
	[vehicle_group_name]

FROM [veh].[vehicle_group]

WHERE vehicle_brand = @vbrand

ORDER BY [vehicle_group_name]

END