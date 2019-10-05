-- =============================================
-- Author:		hock
-- Create date: 24.9.2019
-- Description:	select credit card type
-- =============================================
CREATE PROCEDURE fin.sp_select_credit_card_type 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	[credit_card_type],
	[type_name],
	[modified_by]

FROM [fin].[credit_card_type]

END