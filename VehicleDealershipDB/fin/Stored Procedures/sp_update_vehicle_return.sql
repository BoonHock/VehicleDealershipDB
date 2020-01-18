-- =============================================
-- Author:		hock
-- Create date: 22.10.2019
-- Description:	update vehicle return
-- =============================================
CREATE PROCEDURE [fin].[sp_update_vehicle_return] 
	-- Add the parameters for the stored procedure here
	@vid int,
	@return_date date,
	@return_by int,
	@compensation decimal(18,4),
	@remark nvarchar(100),
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [fin].[vehicle_return]
SET [return_date] = @return_date,
	[return_by] = @return_by,
	[compensation] = @compensation,
	[remark] = @remark,
	[modified_by] = @modified_by

WHERE [vehicle] = @vid

-- remove vehicle sale! return vehicle cannot be trade-in
UPDATE [veh].[vehicle]
SET [vehicle_sale] = NULL
WHERE [vehicle] = @vid

END