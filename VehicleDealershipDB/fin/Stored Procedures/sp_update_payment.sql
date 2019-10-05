-- =============================================
-- Author:		hock
-- Create date: 25.9.2019
-- Description:	update payment
-- =============================================
CREATE PROCEDURE [fin].[sp_update_payment] 
	-- Add the parameters for the stored procedure here
	@payment int,
	@payment_desc nvarchar(50),
	@payment_date date,
	@amount decimal(18, 4),
	@cheque int, -- 0 to insert null
	@credit_card int, -- 0 to insert null
	@payment_method int, -- 0 to insert null
	@is_paid bit,
	@pay_to_person_org int,
	@is_pay_to_person bit,
	@remark nvarchar(255),
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [fin].[payment]
SET [payment_description] = @payment_desc,
	[payment_date] = @payment_date,
	[amount] = @amount,
	[cheque] = CASE WHEN @cheque = 0 THEN NULL ELSE @cheque END,
	[credit_card] = CASE WHEN @credit_card = 0 THEN NULL ELSE @credit_card END,
	[payment_method] = CASE WHEN @payment_method = 0 THEN NULL ELSE @payment_method END,
	[is_paid] = @is_paid,
	[pay_to_person] = CASE WHEN @is_pay_to_person = 1 THEN @pay_to_person_org ELSE NULL END,
	[pay_to_organisation] = CASE WHEN @is_pay_to_person = 0 THEN @pay_to_person_org ELSE NULL END,
	[remark] = @remark,
	[modified_by] = @modified_by

WHERE [payment] = @payment

END