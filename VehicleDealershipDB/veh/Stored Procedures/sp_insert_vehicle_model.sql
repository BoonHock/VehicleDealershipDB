-- =============================================
-- Author:		hock
-- Create date: 3.8.2019
-- Description:	insert new vehicle model
-- =============================================
CREATE PROCEDURE [veh].[sp_insert_vehicle_model] 
	-- Add the parameters for the stored procedure here
	@vmodel_name nvarchar(50),
	@vgroup int,
	@year_make smallint,
	@engine_capacity smallint,
	@no_of_door tinyint,
	@seat_capacity tinyint,
	@fuel_type int,
	@transmission int,
	@remarks text,
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [veh].[vehicle_model]
(
	[vehicle_model_name],
	[vehicle_group],
	[year_make],
	[engine_capacity],
	[no_of_door],
	[seat_capacity],
	[fuel_type],
	[transmission],
	[remarks],
	[modified_by]
)
VALUES
(
	@vmodel_name,
	@vgroup,
	@year_make,
	@engine_capacity,
	@no_of_door,
	@seat_capacity,
	@fuel_type,
	@transmission,
	@remarks,
	@modified_by
)

SELECT SCOPE_IDENTITY();

END