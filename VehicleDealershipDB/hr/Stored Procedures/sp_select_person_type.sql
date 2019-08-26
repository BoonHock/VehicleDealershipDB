-- =============================================
-- Author:		HOCK
-- Create date: 27.8.2019
-- Description:	select person type
-- =============================================
CREATE PROCEDURE hr.sp_select_person_type 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	[person_type],
	[person_type_description]

FROM [hr].[person_type]

ORDER BY [person_type_description]



END