-- =============================================
-- Author:		hock
-- Create date: 9.11.2019
-- Description:	select insurance driver
-- =============================================
CREATE PROCEDURE [fin].[sp_select_insurance_driver] 
	-- Add the parameters for the stored procedure here
	@vehicle int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	DRIVER.[driver],
	DRIVER.[ic_no],
	DBUSER.[name] AS [modified_by]

FROM [fin].[insurance_driver] DRIVER

JOIN [dbsecurity].[user] DBUSER
	ON DBUSER.[user] = DRIVER.[modified_by]

WHERE DRIVER.[vehicle] = @vehicle

END