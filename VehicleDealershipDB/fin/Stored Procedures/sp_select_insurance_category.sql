-- =============================================
-- Author:		hock
-- Create date: 1.12.2019
-- Description:	select insurance category
-- =============================================
CREATE PROCEDURE fin.sp_select_insurance_category 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	[insurance_category],
	[description]

FROM [fin].[insurance_category]

END