-- =============================================
-- Author:		hock
-- Create date: 24.10.2019
-- Description:	delete vehicle return
-- =============================================
CREATE PROCEDURE fin.sp_delete_vehicle_return 
	-- Add the parameters for the stored procedure here
	@vehicle_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
DELETE FROM [fin].[vehicle_return]
WHERE [vehicle] = @vehicle_id

END