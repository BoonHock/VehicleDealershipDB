-- =============================================
-- Author:		HOCK
-- Create date: 3.10.2019
-- Description:	update chassis
-- =============================================
CREATE PROCEDURE veh.sp_update_chassis 
	-- Add the parameters for the stored procedure here
	@chassis int,
	@chassis_no nvarchar(20),
	@vehicle_model int,
	@registration_date date,
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [veh].[chassis]
SET [chassis_no] = @chassis_no,
	[vehicle_model] = @vehicle_model,
	[registration_date] = @registration_date,
	[modified_by] = @modified_by

WHERE [chassis] = @chassis


END