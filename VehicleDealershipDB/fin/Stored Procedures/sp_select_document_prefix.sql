-- =============================================
-- Author:		hock
-- Create date: 14.10.2019
-- Description:	select document prefix
-- =============================================
CREATE PROCEDURE fin.sp_select_document_prefix 
	-- Add the parameters for the stored procedure here
	@doc_prefix nvarchar(20)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT 
	[document_prefix], 
	[document_prefix_text], 
	[modified_by], 
	[modified_on]
FROM [VehicleDealership].[fin].[document_prefix]

WHERE [document_prefix] = 'VEHICLE_EXPENSES'

END