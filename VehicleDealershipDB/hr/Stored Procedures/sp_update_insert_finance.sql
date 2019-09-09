-- =============================================
-- Author:		hock
-- Create date: 7.9.2019
-- Description:	insert/update finance
-- =============================================
CREATE PROCEDURE hr.sp_update_insert_finance 
	-- Add the parameters for the stored procedure here
	@org_id int,
	@remark nvarchar(255),
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DECLARE @has_record int = (SELECT COUNT(*) FROM [hr].[finance] WHERE [finance] = @org_id )

IF @has_record = 0
	-- INSERT
	INSERT INTO [hr].[finance]
	(
		[finance],
		[remark],
		[modified_by]
	)
	VALUES 
	(
		@org_id,
		@remark,
		@modified_by
	)
ELSE
	UPDATE [hr].[finance]
	SET [remark] = @remark,
		[modified_by] = @modified_by

	WHERE [finance] = @org_id


END