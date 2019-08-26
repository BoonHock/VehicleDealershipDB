-- =============================================
-- Author:		hock
-- Create date: 27.8.2019
-- Description:	select organisation not salesperson
-- =============================================
create PROCEDURE [hr].[sp_select_organisation_not_salesperson] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	[organisation],
	[name],
	[registration_no]

FROM [VehicleDealership].[hr].[organisation]

WHERE [organisation] NOT IN 
(
	SELECT [salesperson].[person]
	FROM [hr].[salesperson]
)

ORDER BY [name]


END