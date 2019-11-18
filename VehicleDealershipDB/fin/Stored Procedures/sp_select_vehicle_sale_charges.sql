-- =============================================
-- Author:		hock
-- Create date: 8.11.2019
-- Description:	select vehicle sale charges
-- =============================================
CREATE PROCEDURE [fin].[sp_select_vehicle_sale_charges] 
	-- Add the parameters for the stored procedure here
	@vehicle int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT
	VSALECHARGES.[vehicle_sale_charges],
	VSALECHARGES.[description],
	VSALECHARGES.[amount],
	VSALECHARGES.[is_add],
	DBUSER.[name] AS [modified_by]

FROM [fin].[vehicle_sale_charges] VSALECHARGES

JOIN [dbsecurity].[user] DBUSER
	ON DBUSER.[user] = VSALECHARGES.[modified_by]

WHERE VSALECHARGES.[vehicle] = @vehicle

END