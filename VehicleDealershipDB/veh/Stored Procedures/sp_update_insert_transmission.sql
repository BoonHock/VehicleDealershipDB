-- =============================================
-- Author:		HOCK
-- Create date: 16.8.2019
-- Description:	update and insert transmission
-- =============================================
CREATE PROCEDURE [veh].[sp_update_insert_transmission] 
	-- Add the parameters for the stored procedure here
	@uid INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE TRANSMISSION

SET [transmission_name] = UPPER(BULKCOPY.[nvarchar1]),
	modified_by = @uid

FROM [misc].[bulkcopy_table] BULKCOPY

JOIN [veh].[transmission] TRANSMISSION
	ON TRANSMISSION.[transmission] = BULKCOPY.[int1]

WHERE BULKCOPY.[created_by] = @uid
	AND BULKCOPY.[nvarchar1] <> TRANSMISSION.[transmission_name]


INSERT INTO [veh].[transmission]
(
	[transmission_name],
	[modified_by]
)

SELECT DISTINCT
	UPPER([nvarchar1]),
	@uid

FROM [misc].[bulkcopy_table]

WHERE [int1] NOT IN (
	SELECT [transmission]
	FROM [veh].[transmission]
)
	AND [int1] IS NOT NULL
	AND [nvarchar1] IS NOT NULL
	AND [created_by] = @uid


END