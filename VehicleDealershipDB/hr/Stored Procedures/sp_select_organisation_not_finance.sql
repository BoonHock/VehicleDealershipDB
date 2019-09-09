-- =============================================
-- Author:		hock
-- Create date: 7.9.2019
-- Description:	select organisation not finance
-- =============================================
CREATE PROCEDURE hr.sp_select_organisation_not_finance 
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
	[registration_no],
	[url]

FROM [VehicleDealership].[hr].[organisation]

WHERE [organisation] NOT IN 
(
	SELECT [finance]
	FROM [hr].[finance]
)

ORDER BY [name]


END