-- =============================================
-- Author:		hock
-- Create date: 19.12.2019
-- Description:	insert insurance comprehensive
-- =============================================
CREATE PROCEDURE fin.sp_insert_insurance_comprehensive 
	-- Add the parameters for the stored procedure here
	@title nvarchar(20),
	@uid int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [fin].[insurance_comprehensive]
(
	[title],
	[modified_by]
)
VALUES 
(
	@title,
	@uid
)

SELECT SCOPE_IDENTITY();

END