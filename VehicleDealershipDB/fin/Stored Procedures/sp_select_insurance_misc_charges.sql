-- =============================================
-- Author:		hock
-- Create date: 10.11.2019
-- Description:	select insurance misc charges
-- =============================================
CREATE PROCEDURE fin.sp_select_insurance_misc_charges 
	-- Add the parameters for the stored procedure here
	@vehicle int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	CHARGES.[insurance_misc_charges],
	CHARGES.[description],
	CHARGES.[amount],
	DBUSER.[name] AS [modified_by]

FROM [fin].[insurance_misc_charges] CHARGES

JOIN [dbsecurity].[user] DBUSER
	ON DBUSER.[user] = CHARGES.[modified_by]

WHERE CHARGES.[vehicle] = @vehicle

END