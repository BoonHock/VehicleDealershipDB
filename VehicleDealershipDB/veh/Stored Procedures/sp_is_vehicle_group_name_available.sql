-- =============================================
-- Author:		HOCK
-- Create date: 29.7.2019
-- Description:	check vehicle brand name available. 1 - available. 0 - not available
-- =============================================
CREATE PROCEDURE [veh].[sp_is_vehicle_group_name_available] 
	-- Add the parameters for the stored procedure here
	@vgroup_to_exclude INT = 32,
	@vgroup_name NVARCHAR(50) = 'VIOS'

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT COUNT(*)
FROM [veh].[vehicle_group]

WHERE [vehicle_group] <> @vgroup_to_exclude
	AND [vehicle_group_name] = @vgroup_name


END