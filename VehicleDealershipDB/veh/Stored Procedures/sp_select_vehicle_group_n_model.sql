-- =============================================
-- Author:		hock
-- Create date: 26.7.2019
-- Description:	select vehicle group and its models
-- =============================================
create PROCEDURE veh.[sp_select_vehicle_group_n_model] 
	-- Add the parameters for the stored procedure here
	@vgroup INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	VGROUP.[vehicle_group],
	VGROUP.[vehicle_group_name],
	VGROUP.[vehicle_brand],
	VMODEL.[vehicle_model],
	VMODEL.[vehicle_model_name]

FROM [veh].[vehicle_group] VGROUP

LEFT JOIN [veh].[vehicle_model] VMODEL
	ON VGROUP.[vehicle_group] = VMODEL.[vehicle_group]

WHERE VGROUP.[vehicle_group] = @vgroup



END