-- =============================================
-- Author:		hock
-- Create date: 20.9.2019
-- Description:	select person 
-- =============================================
CREATE PROCEDURE [hr].[sp_select_person_simplified] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	[person],
	[name],
	[ic_no],
	[url]

FROM [hr].[person]

ORDER BY [name]


END