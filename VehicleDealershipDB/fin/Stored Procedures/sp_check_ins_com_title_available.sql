-- =============================================
-- Author:		hock
-- Create date: 19.12.2019
-- Description:	check insurance comprehensive title taken
-- =============================================
CREATE PROCEDURE fin.[sp_check_ins_com_title_available] 
	-- Add the parameters for the stored procedure here
	@title nvarchar(20),
	@ins_com int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT COUNT(*)
FROM [fin].[insurance_comprehensive]

WHERE [title] = @title
	AND [insurance_comprehensive] <> @ins_com

END