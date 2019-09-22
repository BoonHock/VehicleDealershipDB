-- =============================================
-- Author:		hock
-- Create date: 23.9.2019
-- Description:	select payment method
-- =============================================
CREATE PROCEDURE fin.sp_select_payment_method 
	-- Add the parameters for the stored procedure here
	@payment_method int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	PAYMENTMETHOD.[payment_method],
	PAYMENTMETHOD.[payment_method_description],
	PAYMENTMETHOD.[modified_by],
	SECURITYUSER.[name]

FROM [fin].[payment_method] PAYMENTMETHOD

JOIN [dbsecurity].[user] SECURITYUSER
	ON SECURITYUSER.[user] = PAYMENTMETHOD.[modified_by]

WHERE @payment_method = -1 
	OR PAYMENTMETHOD.[payment_method] = @payment_method

END