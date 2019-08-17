-- =============================================
-- Author:		hock
-- Create date: 5.8.2019
-- Description:	update vehicle model image description
-- =============================================
CREATE PROCEDURE [veh].[sp_update_vehicle_model_image]
	-- Add the parameters for the stored procedure here
	@description NVARCHAR(100),
	@vmodel_img INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [veh].[vehicle_model_image]
SET [image_description] = @description

WHERE [vehicle_model_image] = @vmodel_img


END