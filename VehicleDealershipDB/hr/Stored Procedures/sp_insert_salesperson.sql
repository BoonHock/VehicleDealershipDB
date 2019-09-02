-- =============================================
-- Author:		hock
-- Create date: 2.9.2019
-- Description:	insert new salesperson
-- =============================================
CREATE PROCEDURE hr.sp_insert_salesperson 
	-- Add the parameters for the stored procedure here
	@person_org int,
	@is_person bit,
	@location nvarchar(50),
	@date_join date,
	@date_leave date,
	@remark nvarchar(255),
	@modified_by int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [hr].[salesperson]
(
	[person],
	[organisation],
	[location],
	[date_join],
	[date_leave],
	[remark],
	[modified_by]
)
VALUES 
(
	CASE WHEN @is_person = 1 THEN @person_org ELSE NULL END,
	CASE WHEN @is_person = 0 THEN @person_org ELSE NULL END,
	@location,
	@date_join,
	@date_leave,
	@remark,
	@modified_by
)

SELECT SCOPE_IDENTITY();

END