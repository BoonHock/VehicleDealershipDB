-- =============================================
-- Author:		hock
-- Create date: 17.8.2019
-- Description:	DELETE color
-- =============================================
CREATE PROCEDURE [misc].[sp_delete_color] 
	-- Add the parameters for the stored procedure here
	@uid INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DELETE

FROM [misc].[color]

WHERE [color] NOT IN (
	SELECT [int1]
	FROM [VehicleDealership].[misc].[bulkcopy_table]
	WHERE [bulkcopy_table].[created_by] = @uid
)

END