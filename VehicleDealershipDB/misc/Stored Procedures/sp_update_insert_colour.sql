-- =============================================
-- Author:		HOCK
-- Create date: 17.8.2019
-- Description:	update and insert colour
-- =============================================
CREATE PROCEDURE [misc].[sp_update_insert_colour] 
	-- Add the parameters for the stored procedure here
	@uid INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE COLOUR

SET [colour_name] = BULKCOPY.[nvarchar1],
	[modified_by] = @uid

FROM [VehicleDealership].[misc].[bulkcopy_table] BULKCOPY

JOIN [misc].[colour] COLOUR
	ON COLOUR.[colour] = BULKCOPY.[int1]

WHERE BULKCOPY.[created_by] = @uid
	AND BULKCOPY.[nvarchar1] <> COLOUR.[colour_name]

	COLLATE Latin1_General_CS_AI -- CS stands for case sensitive

INSERT INTO [misc].[colour]
(
	[colour_name],
	[modified_by]
)

SELECT DISTINCT
	[nvarchar1],
	@uid

FROM [misc].[bulkcopy_table]

WHERE [int1] NOT IN (
	SELECT [colour]
	FROM [misc].[colour]
)
	AND [int1] IS NOT NULL
	AND [nvarchar1] IS NOT NULL
	AND [created_by] = @uid


END