-- =============================================
-- Author:		hock
-- Create date: 19.9.2019
-- Description:	DELETE location
-- =============================================
CREATE PROCEDURE [misc].[sp_delete_location] 
	-- Add the parameters for the stored procedure here
	@uid INT = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DELETE

FROM [misc].[location]

WHERE [location] NOT IN (
	SELECT [int1]
	FROM [VehicleDealership].[misc].[bulkcopy_table]
	WHERE [bulkcopy_table].[created_by] = @uid
)

END