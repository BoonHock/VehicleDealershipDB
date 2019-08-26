-- =============================================
-- Author:		hock
-- Create date: 25.8.2019
-- Description:	select person contact info
-- =============================================
CREATE PROCEDURE [hr].[sp_select_person_contact_info] 
	-- Add the parameters for the stored procedure here
	@person INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	[person_contact_info],
	[contact],
	[remark]

FROM [hr].[person_contact_info]

WHERE [person] = @person

END