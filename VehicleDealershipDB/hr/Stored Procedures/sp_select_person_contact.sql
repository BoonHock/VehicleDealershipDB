-- =============================================
-- Author:		hock
-- Create date: 30.8.2019
-- Description:	select person contact
-- =============================================
CREATE PROCEDURE [hr].[sp_select_person_contact] 
	-- Add the parameters for the stored procedure here
	@person INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	[contact],
	[remark]

FROM [hr].[person_contact]

WHERE [person] = @person

END