-- =============================================
-- Author:		hock
-- Create date: 3.9.2019
-- Description:	select finance
-- =============================================
CREATE PROCEDURE [hr].[sp_select_finance] 
	-- Add the parameters for the stored procedure here
	@finance int = -1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT
	HRFINANCE.[finance],
	HRORG.[name],
	HRORG.[registration_no],
	HRFINANCE.[remark]

FROM [hr].[finance] HRFINANCE

JOIN [hr].[organisation] HRORG
	ON HRORG.[organisation] = HRFINANCE.[finance]

WHERE @finance = -1
	OR HRFINANCE.[finance] = @finance

END