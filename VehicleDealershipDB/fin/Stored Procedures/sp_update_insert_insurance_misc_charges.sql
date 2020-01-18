-- =============================================
-- Author:		hock
-- Create date: 30.11.2019
-- Description:	update insert misc insurance charges
-- =============================================
CREATE PROCEDURE [fin].[sp_update_insert_insurance_misc_charges]
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@uid int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

-- make sure description and amount has value
UPDATE [misc].[bulkcopy_table] 
SET [nvarchar1] = LTRIM(RTRIM(ISNULL([nvarchar1],''))),
	[decimal18_4] = ISNULL([decimal18_4],0)

WHERE [created_by] = @uid


-- update existing data
UPDATE INSMISC
SET INSMISC.[description] = BULKCOPY.[nvarchar1],
	INSMISC.[amount] = BULKCOPY.[decimal18_4],
	INSMISC.[modified_by] = @uid

FROM [fin].[insurance_misc_charges] INSMISC

JOIN [misc].[bulkcopy_table] BULKCOPY
	ON BULKCOPY.[int1] = INSMISC.[insurance_misc_charges]

WHERE BULKCOPY.[created_by] = @uid
	AND INSMISC.[vehicle] = @vehicle

-- delete old data that is not used anymore
DELETE FROM [fin].[insurance_misc_charges]
WHERE [vehicle] = @vehicle
	AND [insurance_misc_charges] NOT IN 
	(
		SELECT [int1]
		FROM [misc].[bulkcopy_table]
		WHERE [created_by] = @uid
	)

-- insert new data
INSERT INTO [fin].[insurance_misc_charges]
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
	@uid

FROM [misc].[bulkcopy_table]
WHERE [int1] < 0
	AND [created_by] = @uid

END