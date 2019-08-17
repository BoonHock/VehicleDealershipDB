-- =============================================
-- Author:		hock
-- Create date: 4.8.2019
-- Description:	insert new vehicle model image
-- =============================================
CREATE PROCEDURE veh.sp_insert_vehicle_model_image 
	-- Add the parameters for the stored procedure here
	@vehicle_model int,
	@image varbinary(max),
	@image_description nvarchar(100),
	@uid int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [veh].[vehicle_model_image]
(
	[vehicle_model],
	[image],
	[image_description],
	[created_by]
)
VALUES (
	@vehicle_model,
	@image,
	@image_description,
	@uid
)


END