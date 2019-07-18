-- =============================================
-- Author:		hock
-- Create date: 16.7.2019
-- Description:	update and insert vehicle group
-- =============================================
CREATE PROCEDURE veh.sp_update_insert_vehicle_group 
	-- Add the parameters for the stored procedure here
	@vbrand INT = 1,
	@uid INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE VGROUP
SET [vehicle_group_name] = TMPTABLE.[vehicle_group_name]

FROM [veh].[vehicle_group] VGROUP

JOIN [misc].[bulkcopy_table] TMPTABLE
	ON TMPTABLE.[vehicle_group] = VGROUP.[vehicle_group]

WHERE VGROUP.[vehicle_brand] = @vbrand
	AND TMPTABLE.[created_by] = @uid
	AND VGROUP.[vehicle_group_name] <> TMPTABLE.[vehicle_group_name]

COLLATE Latin1_General_CS_AI -- CS stands for case sensitive

INSERT INTO [veh].[vehicle_group]
(
	[vehicle_group_name],
	[vehicle_brand],
	[modified_by]
)

SELECT 
	[vehicle_group_name],
	@vbrand,
	@uid

FROM [misc].[bulkcopy_table] TMPTABLE

WHERE NOT EXISTS 
(
	SELECT 1
	FROM [veh].[vehicle_group] VGROUP
	WHERE VGROUP.[vehicle_brand] = @vbrand
		AND (VGROUP.[vehicle_group] = TMPTABLE.[vehicle_group]
			OR VGROUP.[vehicle_group_name] = TMPTABLE.[vehicle_group_name] )
)
	AND [created_by] = @uid

END