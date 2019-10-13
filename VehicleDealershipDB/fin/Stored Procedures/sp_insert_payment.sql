-- =============================================
-- Author:		hock
-- Create date: 23.9.2019
-- Description:	insert payment
-- =============================================
CREATE PROCEDURE [fin].[sp_insert_payment] 
	-- Add the parameters for the stored procedure here
	@payment_prefix nvarchar(20),
	@payment_desc nvarchar(50),
	@payment_date date,
	@amount decimal(18, 4),
	@cheque int, -- 0 to insert null
	@credit_card int, -- 0 to insert null
	@payment_method int, -- 0 to insert null
	@payment_made bit,
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

INSERT INTO [fin].[payment]
(
	[payment_no_prefix],
	[payment_description],
	[payment_date],
	[amount],
	[cheque],
	[credit_card],
	[payment_method],
	[is_paid],
	[pay_to_person],
	[pay_to_organisation],
	[remark],
	[modified_by]
)
VALUES 
(
	@payment_prefix,
	@payment_desc,
	@payment_date,
	@amount,
	CASE WHEN @cheque = 0 THEN NULL ELSE @cheque END,
	CASE WHEN @credit_card = 0 THEN NULL ELSE @credit_card END,
	CASE WHEN @payment_method = 0 THEN NULL ELSE @payment_method END,
	@payment_made,
	CASE WHEN @is_pay_to_person = 1 THEN @pay_to_person_org ELSE NULL END,
	CASE WHEN @is_pay_to_person = 0 THEN @pay_to_person_org ELSE NULL END,
	@remark,
	@modified_by
)

SELECT SCOPE_IDENTITY();

END