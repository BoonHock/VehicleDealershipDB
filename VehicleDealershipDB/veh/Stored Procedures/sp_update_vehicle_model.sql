-- =============================================
-- Author:		HOCK
-- Create date: 3.8.2019
-- Description:	update vehicle model
-- =============================================
CREATE PROCEDURE [veh].[sp_update_vehicle_model] 
	-- Add the parameters for the stored procedure here
	@vmodel_name nvarchar(50),
	@vgroup int,
	@year_make smallint,
	@engine_capacity smallint,
	@no_of_door tinyint,
	@seat_capacity tinyint = 1,
	@fuel_type int,
	@transmission int,
	@remarks text,
	@vmodel INT,
	@uid INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [veh].[vehicle_model]
SET [vehicle_model_name] = @vmodel_name,
	[vehicle_group] = @vgroup,
	[year_make] = @year_make,
	[engine_capacity] = @engine_capacity,
	[no_of_door] = @no_of_door,
	[seat_capacity] = @seat_capacity,
	[fuel_type] = @fuel_type,
	[transmission] = @transmission,
	[remarks] = @remarks,
	[modified_by] = @uid

WHERE [vehicle_model] = @vmodel	

END