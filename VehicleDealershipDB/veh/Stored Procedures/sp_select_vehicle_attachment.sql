-- =============================================
-- Author:		hock
-- Create date: 30.9.2019
-- Description:	select vehicle attachment
-- =============================================
CREATE PROCEDURE [veh].[sp_select_vehicle_attachment] 
	-- Add the parameters for the stored procedure here
	@vehicle int = -1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT
	[vehicle_attachment],
	-- get file name only. for example: "C:\Users\John\Downloads\AnyDesk.exe" will yield "AnyDesk.exe". for showing to user. no need show full path
	SUBSTRING( [filename] , LEN([filename]) -  CHARINDEX('\',REVERSE([filename])) + 2  , LEN([filename]) ) AS [filename],
	[filename] AS [full_pathfilename]

FROM [veh].[vehicle_attachment]

WHERE @vehicle = -1 
	OR [vehicle] = @vehicle

END