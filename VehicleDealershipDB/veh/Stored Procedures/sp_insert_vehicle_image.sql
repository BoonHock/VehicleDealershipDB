-- =============================================
-- Author:		hock
-- Create date: 13.10.2019
-- Description:	insert vehicle image
-- =============================================
CREATE PROCEDURE veh.sp_insert_vehicle_image 
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@filename nvarchar(max),
	@description nvarchar(100),
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [veh].[vehicle_image]
(
	[vehicle],
	[filename],
	[description],
	[modified_by]
)
VALUES 
(
	@vehicle,
	@filename,
	@description,
	@modified_by
)

SELECT SCOPE_IDENTITY();

END