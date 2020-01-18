-- =============================================
-- Author:		hock
-- Create date: 9.12.2019
-- Description:	select misc vehicle payment received for vehicle sale
-- =============================================
CREATE PROCEDURE [fin].[sp_select_veh_sale_payment_receive_misc]
	-- Add the parameters for the stored procedure here
	@vehicle int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	PAYMENT.[payment_in],
	PAYMENT.[payment_no],
	PAYMENT.[payment_description],
	PAYMENT.[amount],
	PAYMENT.[payment_date],

	CASE WHEN PAYMENT.[cheque] IS NOT NULL THEN
		'CHEQUE'
	ELSE
		CASE WHEN PAYMENT.[credit_card] IS NOT NULL THEN
			'CREDIT_CARD'
		ELSE
			'OTHER'
		END
	END AS [payment_method_type],
	ISNULL(PAYMENTMETHOD.[payment_method_description], '') AS [payment_method],
	PAYMENT.[payment_method] AS [payment_method_id],
	CHEQUE.[cheque_no],
	CREDITCARD.[credit_card_no],
	CREDITCARD.[credit_card_type] AS [credit_card_type_id],
	CREDITCARDTYPE.[type_name] AS [credit_card_type],
	ISNULL(CHEQUE.[finance],CREDITCARD.[finance]) AS [finance_id],
	FINANCEORG.[name] AS [finance],
	ISNULL(CHEQUE.[cheque_date], CREDITCARD.[expiry_date]) AS [payment_method_date],
	PAYMENT.[remark],
	SECURITYUSER.[name] AS [modified_by]

FROM [fin].[veh_sale_payment_receive_misc] VPAY

JOIN [fin].[payment_in] PAYMENT
	ON PAYMENT.[payment_in] = VPAY.[payment_in]

LEFT JOIN [fin].[payment_method] PAYMENTMETHOD
	ON PAYMENTMETHOD.[payment_method] = PAYMENT.[payment_method]

LEFT JOIN [fin].[credit_card] CREDITCARD
	ON CREDITCARD.[credit_card] = PAYMENT.[credit_card]

LEFT JOIN [fin].[credit_card_type] CREDITCARDTYPE
	ON CREDITCARDTYPE.[credit_card_type] = CREDITCARD.[credit_card_type]

LEFT JOIN [fin].[cheque] CHEQUE
	ON CHEQUE.[cheque] = PAYMENT.[cheque]

LEFT JOIN [hr].[finance] FINANCE
	ON FINANCE.[finance] = ISNULL(CHEQUE.[finance],CREDITCARD.[finance])

LEFT JOIN [hr].[organisation_branch] FINANCEORGBRANCH
	ON FINANCEORGBRANCH.[organisation_branch] = FINANCE.[finance]

LEFT JOIN [hr].[organisation] FINANCEORG
	ON FINANCEORG.[organisation] = FINANCEORGBRANCH.[organisation]

JOIN [dbsecurity].[user] SECURITYUSER
	ON SECURITYUSER.[user] = PAYMENT.[modified_by]

WHERE VPAY.[vehicle] = @vehicle


END