-- =============================================
-- Author:		hock
-- Create date: 2.9.2019
-- Description:	update salesperson
-- =============================================
CREATE PROCEDURE [hr].[sp_update_salesperson] 
	-- Add the parameters for the stored procedure here
	@salesperson int,
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

UPDATE [hr].[salesperson]
SET [location] = @location,
	[date_join] = @date_join,
	[date_leave] = @date_leave,
	[remark] = @remark,
	[modified_by] = @modified_by

WHERE [salesperson] = @salesperson

END