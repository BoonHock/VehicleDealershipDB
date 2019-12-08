-- =============================================
-- Author:		HOCK
-- Create date: 3.12.2019
-- Description:	delete vehicle sale
-- =============================================
CREATE PROCEDURE [fin].[sp_delete_vehicle_sale] 
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@uid int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DELETE FROM [fin].[vehicle_sale]
WHERE [vehicle] = @vehicle

END