-- =============================================
-- Author:		hock
-- Create date: 12.10.2019
-- Description:	insert vehicle attachment
-- =============================================
CREATE PROCEDURE veh.sp_insert_vehicle_attachment 
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@filename nvarchar(max),
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [veh].[vehicle_attachment]
(
	[vehicle],
	[filename],
	[modified_by]
)
VALUES 
(
	@vehicle,
	@filename,
	@modified_by
)

SELECT SCOPE_IDENTITY();

END