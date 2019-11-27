-- =============================================
-- Author:		hock
-- Create date: 19.11.2019
-- Description:	insert/update loan
-- =============================================
CREATE PROCEDURE [hr].[sp_update_insert_loan] 
	-- Add the parameters for the stored procedure here
	@orgbranch_id int,
	@remark nvarchar(255),
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DECLARE @has_record int = (SELECT COUNT(*) FROM [hr].[loan] WHERE [loan] = @orgbranch_id  )

IF @has_record = 0
	-- INSERT
	INSERT INTO [hr].[loan]
	(
		[loan],
		[remark],
		[modified_by]
	)
	VALUES 
	(
		@orgbranch_id ,
		@remark,
		@modified_by
	)
ELSE
	UPDATE [hr].[loan]
	SET [remark] = @remark,
		[modified_by] = @modified_by

	WHERE [loan] = @orgbranch_id 

END