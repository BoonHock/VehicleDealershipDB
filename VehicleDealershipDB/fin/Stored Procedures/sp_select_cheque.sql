-- =============================================
-- Author:		hock
-- Create date: 24.9.2019
-- Description:	select cheque
-- =============================================
CREATE PROCEDURE fin.sp_select_cheque 
	-- Add the parameters for the stored procedure here
	@cheque_no nvarchar(20)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT
	CHEQUE.[cheque],
	CHEQUE.[cheque_no],
	CHEQUE.[cheque_date],
	CHEQUE.[finance],
	HRORG.[name],
	ORGBRANCH.[branch_name],
	CHEQUE.[modified_by] AS [modified_by_id],
	SECURITYUSER.[name] AS [modified_by]

FROM [fin].[cheque] CHEQUE

JOIN [hr].[finance] FINANCE
	ON FINANCE.[finance] = CHEQUE.[finance]

JOIN [hr].[organisation_branch] ORGBRANCH
	ON ORGBRANCH.[organisation_branch] = FINANCE.[finance]

JOIN [hr].[organisation] HRORG
	ON HRORG.[organisation] = ORGBRANCH.[organisation]

JOIN [dbsecurity].[user] SECURITYUSER
	ON SECURITYUSER.[user] = CHEQUE.[modified_by]

WHERE @cheque_no = ''
	OR CHEQUE.[cheque_no] = @cheque_no

END