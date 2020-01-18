-- =============================================
-- Author:		hock
-- Create date: 16.8.2019
-- Description:	DELETE transmission
-- =============================================
CREATE PROCEDURE [veh].[sp_delete_transmission] 
	-- Add the parameters for the stored procedure here
	@uid INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

-- delete transmission that is not in bulkcopy table and not under any foreign key constraint
DELETE

FROM [veh].[transmission]

WHERE [transmission] NOT IN (
	SELECT [int1]
	FROM [misc].[bulkcopy_table]
	WHERE [bulkcopy_table].[created_by] = @uid

	UNION

	SELECT [transmission]

	FROM [veh].[vehicle_model]

)

-- check if there are transmission that cannot be deleted because it is in foreign key constraint
SELECT COUNT(*)

FROM [veh].[vehicle_model]
WHERE [transmission] IN (

	SELECT [transmission]

	FROM [veh].[transmission]

	WHERE [transmission] NOT IN (
		SELECT [int1]
		FROM [misc].[bulkcopy_table]
		WHERE [bulkcopy_table].[created_by] = @uid
	)
)

END