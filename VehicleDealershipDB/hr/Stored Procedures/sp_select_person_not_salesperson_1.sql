-- =============================================
-- Author:		hock
-- Create date: 27.8.2019
-- Description:	select person not salesperson
-- =============================================
CREATE PROCEDURE [hr].[sp_select_person_not_salesperson] 
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

FROM [VehicleDealership].[hr].[person]

WHERE [person] NOT IN 
(
	SELECT [salesperson].[person]
	FROM [hr].[salesperson]
	WHERE [salesperson].[person] IS NOT NULL
)

ORDER BY [name]


END