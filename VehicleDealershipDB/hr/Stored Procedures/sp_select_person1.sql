-- =============================================
-- Author:		HOCK
-- Create date: 26.8.2019
-- Description:	select person simplified
-- =============================================
CREATE PROCEDURE hr.sp_select_person1 
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
	[ic_no]

FROM [VehicleDealership].[hr].[person] PERSON

ORDER BY [name]

END