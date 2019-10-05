-- =============================================
-- Author:		hock
-- Create date: 24.9.2019
-- Description:	select credit card
-- =============================================
CREATE PROCEDURE fin.sp_select_credit_card 
	-- Add the parameters for the stored procedure here
	@cc_no NVARCHAR(20)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT 
	CC.[credit_card],
	CC.[credit_card_no],
	CC.[credit_card_type],
	CCTYPE.[type_name],
	CC.[expiry_date],
	CC.[finance],
	HRORG.[name],
	ORGBRANCH.[branch_name],
	CC.[modified_by] AS [modified_by_id],
	SECURITYUSER.[name] AS [modified_by]

FROM [fin].[credit_card] CC

JOIN [fin].[credit_card_type] CCTYPE
	ON CCTYPE.[credit_card_type] = CC.credit_card_type

JOIN [hr].[finance] FINANCE
	ON FINANCE.[finance] = CC.[finance]

JOIN [hr].[organisation_branch] ORGBRANCH
	ON ORGBRANCH.[organisation_branch] = FINANCE.[finance]

JOIN [hr].[organisation] HRORG
	ON HRORG.[organisation] = ORGBRANCH.[organisation]

JOIN [dbsecurity].[user] SECURITYUSER
	ON SECURITYUSER.[user] = CC.[modified_by]

WHERE @cc_no = '' 
	OR CC.[credit_card_no] = @cc_no

END