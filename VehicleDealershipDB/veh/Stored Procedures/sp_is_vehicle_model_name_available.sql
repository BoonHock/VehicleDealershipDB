-- =============================================
-- Author:		hock
-- Create date: 2.8.2019
-- Description:	check veh group has veh model name
-- =============================================
CREATE PROCEDURE [veh].[sp_is_vehicle_model_name_available] 
	-- Add the parameters for the stored procedure here
	@vmodel_name nvarchar(50) = '',
	@vgroup INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT COUNT(*)
FROM [veh].[vehicle_model]
WHERE [vehicle_model_name] = @vmodel_name
	AND [vehicle_group] = @vgroup

END