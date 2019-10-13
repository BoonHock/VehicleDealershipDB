-- =============================================
-- Author:		hock
-- Create date: 13.10.2019
-- Description:	delete vehicle image
-- =============================================
CREATE PROCEDURE [veh].[sp_delete_vehicle_image] 
	-- Add the parameters for the stored procedure here
	@vimage_id int,
	@vehicle int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DELETE FROM [veh].[vehicle_image]
WHERE [vehicle] = @vehicle
	AND [vehicle_image] = @vimage_id 

END