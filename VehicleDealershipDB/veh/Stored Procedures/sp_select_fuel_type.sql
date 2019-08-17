-- =============================================
-- Author:		hock
-- Create date: 6.8.2019
-- Description:	select fuel type
-- =============================================
CREATE PROCEDURE [veh].[sp_select_fuel_type] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	[fuel_type],
	[fuel_type_name],
	DBUSER.[name] AS [modified_by]

FROM [VehicleDealership].[veh].[fuel_type] FUELTYPE

JOIN [dbsecurity].[user] DBUSER
	ON FUELTYPE.[modified_by] = DBUSER.[user]

ORDER BY [fuel_type_name]

END