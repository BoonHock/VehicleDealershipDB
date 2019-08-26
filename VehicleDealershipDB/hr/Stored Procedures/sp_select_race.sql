-- =============================================
-- Author:		hock
-- Create date: 25.8.2019
-- Description:	select race
-- =============================================
CREATE PROCEDURE [hr].[sp_select_race] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	[race],
	[race_description]

FROM [hr].[race]


END