-- =============================================
-- Author:		hock
-- Create date: 18.12.2019
-- Description:	select insurance comprehensive
-- =============================================
CREATE PROCEDURE [fin].[sp_select_insurance_comprehensive] 
	-- Add the parameters for the stored procedure here
	@ins_comprehensive int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	[insurance_comprehensive], 
	[title], 
	[modified_by]
FROM [fin].[insurance_comprehensive]

WHERE @ins_comprehensive = -1 
	OR [insurance_comprehensive] = @ins_comprehensive;


END