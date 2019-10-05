-- =============================================
-- Author:		hock
-- Create date: 25.9.2019
-- Description:	update insert cheque
-- =============================================
CREATE PROCEDURE fin.sp_update_insert_cheque 
	-- Add the parameters for the stored procedure here
	@cheque_no nvarchar(20),
	@cheque_date date,
	@finance int,
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DECLARE @cheque int = (
	SELECT [cheque]
	FROM [fin].[cheque]
	WHERE [cheque_no] = @cheque_no
);

IF @cheque IS NULL
	BEGIN
		INSERT INTO [fin].[cheque]
		(
			[cheque_no],
			[cheque_date],
			[finance],
			[modified_by]
		)
		VALUES 
		(
			@cheque_no,
			@cheque_date,
			@finance,
			@modified_by
		);
		SET @cheque = SCOPE_IDENTITY();
	END
ELSE
	BEGIN
		UPDATE [fin].[cheque]
		SET [cheque_date] = @cheque_date,
			[finance] = @finance,
			[modified_by] = @modified_by

		WHERE [cheque] = @cheque
	END

SELECT @cheque;

END