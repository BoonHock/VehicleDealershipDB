-- =============================================
-- Author:		hock
-- Create date: 9.8.2019
-- Description:	update and insert fuel type
-- =============================================
CREATE PROCEDURE [veh].[sp_update_insert_fuel_type] 
	-- Add the parameters for the stored procedure here
	@uid INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE FUELTYPE

SET fuel_type_name = UPPER(BULKCOPY.[nvarchar1]),
	modified_by = @uid

FROM [misc].[bulkcopy_table] BULKCOPY

JOIN [veh].[fuel_type] FUELTYPE
	ON FUELTYPE.[fuel_type] = BULKCOPY.[int1]

WHERE BULKCOPY.[created_by] = @uid
	AND BULKCOPY.[nvarchar1] <> FUELTYPE.[fuel_type_name]


INSERT INTO [veh].[fuel_type]
(
	[fuel_type_name],
	[modified_by]
)

SELECT DISTINCT
	UPPER([nvarchar1]),
	@uid

FROM [misc].[bulkcopy_table]

WHERE [int1] NOT IN (
	SELECT [fuel_type]
	FROM [veh].[fuel_type]
)
	AND [int1] IS NOT NULL
	AND [nvarchar1] IS NOT NULL
	AND [created_by] = @uid

END