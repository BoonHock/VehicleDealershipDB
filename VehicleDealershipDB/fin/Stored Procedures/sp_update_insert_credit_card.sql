-- =============================================
-- Author:		hock
-- Create date: 24.9.2019
-- Description:	update insert credit card and select credit card id
-- =============================================
CREATE PROCEDURE [fin].[sp_update_insert_credit_card] 
	-- Add the parameters for the stored procedure here
	@cc_no nvarchar(20),
	@cc_type int,
	@finance int,
	@expiry_date date,
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DECLARE @cc INT = (
	SELECT [credit_card]
	FROM [fin].[credit_card]
	WHERE [credit_card_no] = @cc_no);

IF @cc IS NULL 
	BEGIN
		INSERT INTO [fin].[credit_card]
		(
			[credit_card_no],
			[credit_card_type],
			[finance],
			[expiry_date],
			[modified_by]
		)
		VALUES 
		(
			@cc_no,
			@cc_type,
			@finance,
			@expiry_date,
			@modified_by
		)

		SET @cc = SCOPE_IDENTITY();

	END
ELSE
	BEGIN
		UPDATE [fin].[credit_card]
		SET [credit_card_type] = @cc_type,
			[finance] = @finance,
			[expiry_date] = @expiry_date,
			[modified_by] = @modified_by
		WHERE [credit_card] = @cc
	END

SELECT @cc

END