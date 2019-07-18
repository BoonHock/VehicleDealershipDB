-- =============================================
-- Author:		hock
-- Create date: 16.7.2019
-- Description:	update vehicle brand
-- =============================================
CREATE PROCEDURE veh.sp_update_vehicle_brand 
	-- Add the parameters for the stored procedure here
	@vbrand INT = 1,
	@vbrand_name nvarchar(20) = 'PERODUa',
	@country INT = 144,
	@uid INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [veh].[vehicle_brand]
SET [vehicle_brand_name] = @vbrand_name,
	[country] = @country,
	[modified_by] = @uid

WHERE [vehicle_brand] = @vbrand
	AND ([vehicle_brand_name] <> @vbrand_name COLLATE Latin1_General_CS_AI -- CS stands for case sensitive
		OR [country] <> @country)




END