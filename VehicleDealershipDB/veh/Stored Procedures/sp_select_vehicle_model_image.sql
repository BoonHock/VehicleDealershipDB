-- =============================================
-- Author:		hock
-- Create date: 31.7.2019
-- Description:	select vehicle model image
-- =============================================
CREATE PROCEDURE [veh].[sp_select_vehicle_model_image] 
	-- Add the parameters for the stored procedure here
	@vmodel INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	[vehicle_model_image],
	VMODELIMAGE.[image],
	[image_description],
	DBSECURITYUSER.[name] AS [created_by],
	[created_on]

FROM [veh].[vehicle_model_image] VMODELIMAGE

JOIN [dbsecurity].[user] DBSECURITYUSER
	ON VMODELIMAGE.[created_by] = DBSECURITYUSER.[user]

WHERE [vehicle_model] = @vmodel

END