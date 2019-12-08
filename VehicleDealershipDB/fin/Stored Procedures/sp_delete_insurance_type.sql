-- =============================================
-- Author:		hock
-- Create date: 2.12.2019
-- Description:	delete insurance type
-- =============================================
CREATE PROCEDURE fin.sp_delete_insurance_type 
	-- Add the parameters for the stored procedure here
	@uid int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DELETE FROM [fin].[insurance_type]
WHERE [insurance_type] NOT IN 
(
	SELECT [int1]
	FROM [misc].[bulkcopy_table]
	WHERE [created_by] = @uid
)

END