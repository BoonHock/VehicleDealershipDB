-- =============================================
-- Author:		hock
-- Create date: 30.11.2019
-- Description:	update insert insurance driver
-- =============================================
CREATE PROCEDURE [fin].[sp_update_insert_insurance_driver] 
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@uid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [misc].[bulkcopy_table]
SET [nvarchar1] = ISNULL([nvarchar1],''),
	[nvarchar2] = ISNULL([nvarchar2],'')

WHERE [created_by] = @uid

-- ic no. cannot be empty
DELETE FROM [misc].[bulkcopy_table]
WHERE [created_by] = @uid
	AND [nvarchar2] = ''

-- update existing data
UPDATE INSDRIVER
SET INSDRIVER.[driver] = BULKCOPY.[nvarchar1],
	INSDRIVER.[modified_by] = @uid

FROM [fin].[insurance_driver] INSDRIVER

JOIN [misc].[bulkcopy_table] BULKCOPY
	ON BULKCOPY.[nvarchar2] = INSDRIVER.[ic_no]

WHERE [BULKCOPY].[created_by] = @uid
	AND INSDRIVER.[vehicle] = @vehicle

-- insert new data
INSERT INTO [fin].[insurance_driver]
(
	[vehicle],
	[ic_no],
	[driver],
	[modified_by]
)
SELECT 
	@vehicle,
	[nvarchar2],
	[nvarchar1],
	@uid

FROM [misc].[bulkcopy_table]

WHERE [created_by] = @uid
	AND [nvarchar2] NOT IN 
(
	SELECT [ic_no]
	FROM [fin].[insurance_driver]
	WHERE [vehicle] = @vehicle
)

-- delete unused data
DELETE FROM [fin].[insurance_driver]

WHERE [vehicle] = @vehicle
	AND [ic_no] NOT IN (
		SELECT [nvarchar2]
		FROM [misc].[bulkcopy_table]
		WHERE [created_by] = @uid
	)




END