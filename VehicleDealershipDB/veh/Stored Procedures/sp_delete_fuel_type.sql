-- =============================================
-- Author:		hock
-- Create date: 15.8.2019
-- Description:	DELETE fuel type
-- =============================================
CREATE PROCEDURE [veh].[sp_delete_fuel_type] 
	-- Add the parameters for the stored procedure here
	@uid INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DELETE
FROM [veh].[fuel_type]

WHERE [fuel_type] NOT IN (
	SELECT [int1]
	FROM [VehicleDealership].[misc].[bulkcopy_table]
	WHERE [bulkcopy_table].[created_by] = @uid

	UNION

	SELECT [fuel_type]
	FROM [veh].[vehicle_model]
)

-- check if there are fuel type that cannot be deleted because it is in foreign key constraint
SELECT COUNT(*)

FROM [veh].[vehicle_model]
WHERE [fuel_type] IN (

	SELECT [fuel_type]

	FROM [veh].[fuel_type]

	WHERE [fuel_type] NOT IN (
		SELECT [int1]
		FROM [VehicleDealership].[misc].[bulkcopy_table]
		WHERE [bulkcopy_table].[created_by] = @uid
	)
)


END