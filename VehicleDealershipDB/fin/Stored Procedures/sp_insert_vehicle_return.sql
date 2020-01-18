-- =============================================
-- Author:		hock
-- Create date: 22.10.2019
-- Description:	insert vehicle return
-- =============================================
CREATE PROCEDURE [fin].[sp_insert_vehicle_return] 
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

INSERT INTO [fin].[vehicle_return]
(
	[vehicle],
	[return_date],
	[return_by],
	[compensation],
	[remark],
	[modified_by]
)
VALUES
(
	@vid,
	@return_date,
	@return_by,
	@compensation,
	@remark,
	@modified_by
)

-- returned vehicle cannot be trade-in
UPDATE [veh].[vehicle]
SET [vehicle_sale] = NULL
WHERE [vehicle] = @vid

END