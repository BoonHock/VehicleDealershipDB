-- =============================================
-- Author:		hock
-- Create date: 2.12.2019
-- Description:	update insert insurance category
-- =============================================
CREATE PROCEDURE fin.sp_update_insert_insurance_category 
	-- Add the parameters for the stored procedure here
	@uid int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [misc].[bulkcopy_table]
SET [nvarchar1] = ISNULL([nvarchar1],'')
WHERE [created_by] = @uid;

UPDATE INSCAT
SET INSCAT.[description] = BULKCOPY.[nvarchar1],
	INSCAT.[modified_by] = @uid

FROM [fin].[insurance_category] INSCAT

JOIN [misc].[bulkcopy_table] BULKCOPY
	ON BULKCOPY.[int1] = INSCAT.[insurance_category]

WHERE BULKCOPY.[created_by] = @uid
	AND BULKCOPY.[nvarchar1] <> INSCAT.[description]

COLLATE Latin1_General_CS_AI -- CS stands for case sensitive

INSERT INTO [fin].[insurance_category]
(
	[description],
	[modified_by]
)
SELECT
	BULKCOPY.[nvarchar1],
	@uid

FROM [misc].[bulkcopy_table] BULKCOPY

WHERE [int1] NOT IN (
	SELECT [insurance_category]
	FROM [fin].[insurance_category]
)
	AND [int1] IS NOT NULL
	AND [created_by] = @uid




END