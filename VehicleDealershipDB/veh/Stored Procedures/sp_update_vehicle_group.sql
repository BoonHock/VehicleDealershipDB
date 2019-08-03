-- =============================================
-- Author:		HOCK
-- Create date: 30.7.2019
-- Description:	
-- =============================================
create PROCEDURE [veh].[sp_update_vehicle_group] 
	-- Add the parameters for the stored procedure here
	@vgroup INT = 32,
	@vgroup_name nvarchar(20) = 'Vios',
	@vbrand INT = 13,
	@uid INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [veh].[vehicle_group]
SET [vehicle_group_name] = @vgroup_name,
	[vehicle_brand] = @vbrand,
	[modified_by] = @uid


WHERE vehicle_group = @vgroup
	AND ([vehicle_group_name] <> @vgroup_name COLLATE Latin1_General_CS_AI -- CS stands for case sensitive
		OR [vehicle_brand] <> @vbrand)


END