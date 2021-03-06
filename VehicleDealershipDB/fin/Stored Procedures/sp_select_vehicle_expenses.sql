﻿-- =============================================
-- Author:		hock
-- Create date: 9.12.2019
-- Description:	select vehicle expenses
-- =============================================
CREATE PROCEDURE [fin].[sp_select_vehicle_expenses] 
	-- Add the parameters for the stored procedure here
	@vehicle int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	PAYMENT.[payment_out],
	VEXP.[vehicle],
	PAYMENT.[payment_no],
	PAYMENT.[payment_description],
	ISNULL(PAYMENT.[pay_to_person],PAYMENT.[pay_to_organisation]) AS [pay_to_id],
	CASE WHEN PAYMENT.[pay_to_person] IS NOT NULL THEN PAYTOPERSON.[name] ELSE [PAYTOORG].[name] END as [pay_to],
	CASE WHEN PAYMENT.[pay_to_person] IS NOT NULL THEN 'PERSON' ELSE 'ORGANISATION' END as [pay_to_type],
	PAYMENT.[amount],
	PAYMENT.[payment_date],
	PAYMENT.[is_paid],

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

FROM [fin].[vehicle_expenses] VEXP

JOIN [fin].[payment_out] PAYMENT
	ON PAYMENT.[payment_out] = VEXP.[payment]

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

LEFT JOIN [hr].[person] PAYTOPERSON
	ON PAYTOPERSON.[person] = PAYMENT.[pay_to_person]

LEFT JOIN [hr].[organisation] PAYTOORG
	ON PAYTOORG.[organisation] = PAYMENT.[pay_to_organisation]

LEFT JOIN [hr].[organisation_branch] FINANCEORGBRANCH
	ON FINANCEORGBRANCH.[organisation_branch] = FINANCE.[finance]

LEFT JOIN [hr].[organisation] FINANCEORG
	ON FINANCEORG.[organisation] = FINANCEORGBRANCH.[organisation]

JOIN [dbsecurity].[user] SECURITYUSER
	ON SECURITYUSER.[user] = PAYMENT.[modified_by]

WHERE VEXP.[vehicle] = @vehicle



END