-- =============================================
-- Author:		HOCK
-- Create date: 17.8.2019
-- Description:	update and insert color
-- =============================================
CREATE PROCEDURE misc.[sp_update_insert_color] 
	-- Add the parameters for the stored procedure here
	@uid INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE COLOR

SET [color_name] = BULKCOPY.[nvarchar1],
	[modified_by] = @uid

FROM [VehicleDealership].[misc].[bulkcopy_table] BULKCOPY

JOIN [VehicleDealership].[misc].[color] COLOR
	ON COLOR.[color] = BULKCOPY.[int1]

WHERE BULKCOPY.[created_by] = @uid
	AND BULKCOPY.[nvarchar1] <> COLOR.[color_name]

	COLLATE Latin1_General_CS_AI -- CS stands for case sensitive

INSERT INTO [misc].[color]
(
	[color_name],
	[modified_by]
)

SELECT DISTINCT
	[nvarchar1],
	@uid

FROM [misc].[bulkcopy_table]

WHERE [int1] NOT IN (
	SELECT [color]
	FROM [misc].[color]
)
	AND [int1] IS NOT NULL
	AND [nvarchar1] IS NOT NULL
	AND [created_by] = @uid


END