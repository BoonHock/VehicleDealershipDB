-- =============================================
-- Author:		HOCK
-- Create date: 17.8.2019
-- Description:	search all stored procedures with given string
-- =============================================
CREATE PROCEDURE sp_search_stored_proc_contain_string 
	-- Add the parameters for the stored procedure here
	@search NVARCHAR(MAX)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	OBJECT_NAME(object_id),
	OBJECT_DEFINITION(object_id)

FROM sys.procedures

WHERE OBJECT_DEFINITION(object_id) LIKE '%' + @search +  '%'

END