﻿-- =============================================
-- Author:		hock
-- Create date: 27.8.2019
-- Description:	select organisation not salesperson
-- =============================================
CREATE PROCEDURE [hr].[sp_select_organisation_not_salesperson] 
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
	SELECT [salesperson].[organisation]
	FROM [hr].[salesperson]
	WHERE [salesperson].[organisation] IS NOT NULL
)

ORDER BY [name]


END