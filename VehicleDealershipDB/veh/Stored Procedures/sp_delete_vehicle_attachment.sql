-- =============================================
-- Author:		hock
-- Create date: 13.10.2019
-- Description:	delete vehicle attachment 
-- =============================================
CREATE PROCEDURE [veh].[sp_delete_vehicle_attachment] 
	-- Add the parameters for the stored procedure here
	@vattach_id int,
	@vehicle int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DELETE
FROM [veh].[vehicle_attachment]
WHERE [vehicle] = @vehicle
	AND [vehicle_attachment] = @vattach_id


END