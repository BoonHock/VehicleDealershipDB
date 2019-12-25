-- =============================================
-- Author:		hock
-- Create date: 19.12.2019
-- Description:	update insurance comprehensive
-- =============================================
CREATE PROCEDURE fin.[sp_update_insurance_comprehensive] 
	-- Add the parameters for the stored procedure here
	@ins_com int,
	@title nvarchar(20),
	@uid int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [fin].[insurance_comprehensive]
SET [title] = @title,
	[modified_by] = @uid

WHERE [insurance_comprehensive] = @ins_com

END