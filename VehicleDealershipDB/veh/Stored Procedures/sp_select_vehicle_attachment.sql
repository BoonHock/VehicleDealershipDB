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
	[filename],
	CAST('' AS nvarchar(max)) AS [full_pathfilename] -- for front end

FROM [veh].[vehicle_attachment]

WHERE @vehicle = -1 
	OR [vehicle] = @vehicle

END