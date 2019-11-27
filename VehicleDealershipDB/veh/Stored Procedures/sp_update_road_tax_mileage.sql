-- =============================================
-- Author:		hock
-- Create date: 26.11.2019
-- Description:	renew road tax and mileage (vehicle sale)
-- =============================================
CREATE PROCEDURE [veh].[sp_update_road_tax_mileage] 
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@road_tax_expiry_date date, -- NULL to skip update 
	@road_tax_amount decimal(18,4), -- NULL to skip update
	@mileage int,
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [veh].[vehicle]
SET [road_tax_expiry_date] = ISNULL(@road_tax_expiry_date, [road_tax_expiry_date]),
	[road_tax] = ISNULL(@road_tax_amount, [road_tax]),
	[mileage] = @mileage,
	[modified_by] = @modified_by

WHERE [vehicle] = @vehicle

END