-- =============================================
-- Author:		hock
-- Create date: 28.9.2019
-- Description:	select vehicle image
-- =============================================
CREATE PROCEDURE [veh].[sp_select_vehicle_image] 
	-- Add the parameters for the stored procedure here
	@vehicle int = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT
	[vehicle_image],
	CAST(NULL AS varbinary(MAX)) AS [image], -- for front end side to use
	[image_filename],
	[image_description]

FROM [veh].[vehicle_image] VIMAGE

JOIN [dbsecurity].[filepath] DBFILEPATH
	ON DBFILEPATH.[filepath] = 'VEHICLE_IMAGE'

WHERE @vehicle = -1 
	OR [vehicle] = @vehicle



END