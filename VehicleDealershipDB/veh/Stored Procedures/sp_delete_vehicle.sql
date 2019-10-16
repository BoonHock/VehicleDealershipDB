-- =============================================
-- Author:		hock
-- Create date: 14.10.2019
-- Description:	delete vehicle
-- =============================================
CREATE PROCEDURE veh.sp_delete_vehicle 
	-- Add the parameters for the stored procedure here
	@vid int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DELETE FROM [veh].[vehicle]
WHERE [vehicle] = @vid

END