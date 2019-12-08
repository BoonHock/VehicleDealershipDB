-- =============================================
-- Author:		hock
-- Create date: 2.12.2019
-- Description:	update insert insurance type
-- =============================================
CREATE PROCEDURE fin.sp_update_insert_insurance_type 
	-- Add the parameters for the stored procedure here
	@uid INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


UPDATE [misc].[bulkcopy_table]
SET [nvarchar1] = ISNULL([nvarchar1],'')

WHERE [created_by] = @uid;

UPDATE INSTYPE
SET INSTYPE.[description] = BULKCOPY.[nvarchar1],
	INSTYPE.[modified_by] = @uid

FROM [fin].[insurance_type] INSTYPE

JOIN [misc].[bulkcopy_table] BULKCOPY
	ON BULKCOPY.[int1] = INSTYPE.[insurance_type]

WHERE BULKCOPY.[created_by] = @uid
	AND BULKCOPY.[nvarchar1] <> INSTYPE.[description]

COLLATE Latin1_General_CS_AI -- CS stands for case sensitive


INSERT INTO [fin].[insurance_type]
(
	[description],
	[modified_by]
)
SELECT
	BULKCOPY.[nvarchar1],
	@uid

FROM [misc].[bulkcopy_table] BULKCOPY

WHERE [int1] NOT IN (
	SELECT [insurance_type]
	FROM [fin].[insurance_type]
)
	AND [int1] IS NOT NULL
	AND [created_by] = @uid


END