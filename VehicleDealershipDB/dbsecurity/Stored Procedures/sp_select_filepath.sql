-- =============================================
-- Author:		hock
-- Create date: 11.10.2019
-- Description:	select filepath
-- =============================================
CREATE PROCEDURE dbsecurity.sp_select_filepath 
	-- Add the parameters for the stored procedure here
	@filepath nvarchar(20) = 'VEHICLE_ATTACHMENT'

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT 
	DBFILEPATH.[filepath], 
	DBFILEPATH.[filepath_dir], 
	SECURITYUSER.[name] AS [modified_by]

FROM [VehicleDealership].[dbsecurity].[filepath] DBFILEPATH

JOIN [dbsecurity].[user] SECURITYUSER
	ON SECURITYUSER.[user] = DBFILEPATH.[modified_by]

WHERE @filepath = '' 
	OR DBFILEPATH.[filepath] = @filepath

END