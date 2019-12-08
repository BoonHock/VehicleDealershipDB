-- =============================================
-- Author:		hock
-- Create date: 1.12.2019
-- Description:	update trade in
-- =============================================
CREATE PROCEDURE [veh].[sp_update_trade_in] 
	-- Add the parameters for the stored procedure here
	@arr_trade_in nvarchar(max),
	@vehicle_sale int,
	@uid int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

-- remove trade in
UPDATE [veh].[vehicle]
SET [vehicle_sale] = NULL,
	[modified_by] = @uid

WHERE [vehicle] NOT IN (SELECT * FROM string_split(@arr_trade_in,','))

-- set trade in
UPDATE [veh].[vehicle]
SET [vehicle_sale] = @vehicle_sale,
	[modified_by] = @uid

WHERE [vehicle] IN (SELECT * FROM string_split(@arr_trade_in,','))
	AND [vehicle] <> @vehicle_sale -- cannot trade in self to buy self right?


END