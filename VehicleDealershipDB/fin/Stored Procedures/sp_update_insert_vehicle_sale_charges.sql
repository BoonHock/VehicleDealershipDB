-- =============================================
-- Author:		hock
-- Create date: 26.11.2019
-- Description:	update insert vehicle sale charges
-- =============================================
CREATE PROCEDURE [fin].[sp_update_insert_vehicle_sale_charges] 
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@created_by int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE CHARGES
SET CHARGES.[description] = BULKCOPY.[nvarchar1],
	CHARGES.[amount] = BULKCOPY.[decimal18_4],
	CHARGES.[modified_by] = @created_by

FROM [fin].[vehicle_sale_charges] CHARGES

JOIN [misc].[bulkcopy_table] BULKCOPY
	ON BULKCOPY.[int1] = CHARGES.[vehicle_sale_charges]

WHERE BULKCOPY.[created_by] = @created_by
	AND CHARGES.[vehicle] = @vehicle
	AND (CHARGES.[amount] <> BULKCOPY.[decimal18_4] 
		OR CHARGES.[description] <> BULKCOPY.[nvarchar1] )

DELETE FROM [fin].[vehicle_sale_charges]
WHERE [vehicle] = vehicle
	AND [vehicle_sale_charges] NOT IN 
	(
		SELECT [int1]
		FROM [misc].[bulkcopy_table]
		WHERE [created_by] = @created_by
	)

INSERT INTO [fin].[vehicle_sale_charges]
(
	[vehicle],
	[description],
	[amount],
	[modified_by]
)
SELECT
	@vehicle,
	[nvarchar1],
	[decimal18_4],
	@created_by

FROM [misc].[bulkcopy_table] BULKCOPY

WHERE BULKCOPY.[created_by] = @created_by
	AND NOT EXISTS (
		SELECT 1
		FROM [fin].[vehicle_sale_charges] CHARGES
		WHERE CHARGES.[vehicle_sale_charges] = BULKCOPY.[int1]
	)


END