-- =============================================
-- Author:		HOCK
-- Create date: 19.9.2019
-- Description:	update and insert location
-- =============================================
CREATE PROCEDURE [misc].[sp_update_insert_location] 
	-- Add the parameters for the stored procedure here
	@uid INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE MISCLOCATION

SET [location_name] = BULKCOPY.[nvarchar1],
	[modified_by] = @uid

FROM [misc].[bulkcopy_table] BULKCOPY

JOIN [misc].[location] MISCLOCATION
	ON MISCLOCATION.[location] = BULKCOPY.[int1]

WHERE BULKCOPY.[created_by] = @uid
	AND BULKCOPY.[nvarchar1] <> MISCLOCATION.[location_name]

	COLLATE Latin1_General_CS_AI -- CS stands for case sensitive

INSERT INTO [misc].[location]
(
	[location_name],
	[modified_by]
)

SELECT DISTINCT
	[nvarchar1],
	@uid

FROM [misc].[bulkcopy_table]

WHERE [int1] NOT IN (
	SELECT [location]
	FROM [misc].[location]
)
	AND [int1] IS NOT NULL
	AND [nvarchar1] IS NOT NULL
	AND [created_by] = @uid


END