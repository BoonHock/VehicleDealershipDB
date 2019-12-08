-- =============================================
-- Author:		hock
-- Create date: 9.12.2019
-- Description:	update vehicle expenses
-- =============================================
CREATE PROCEDURE fin.sp_update_veh_sale_payment_receive_misc
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@payment_combine nvarchar(max),
	-- contains payment id to charge to customer. if not here, then not charging to customer
	@uid int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


declare @payment_table table (
	[payment_id] int not null
)
INSERT INTO @payment_table
SELECT CAST([value] AS int)
FROM string_split(@payment_combine,',')
WHERE ISNUMERIC([value]) = 1

-- if incoming data does not provide a payment id associated with this vehicle, user deleted it already
DELETE FROM [fin].[payment]
WHERE [payment] IN
(
	SELECT [payment]
	FROM [fin].[veh_sale_payment_receive_misc]
	WHERE [vehicle] = @vehicle
		AND [payment] NOT IN (SELECT * FROM @payment_table)
)

-- no duplicate payment_id allowed
INSERT INTO [fin].[veh_sale_payment_receive_misc]
(
	[vehicle],
	[payment],
	[modified_by]
)
SELECT 
	@vehicle,
	[payment],
	@uid

FROM [fin].[payment] PAYMENT

WHERE [payment] IN (SELECT * FROM @payment_table)
	AND [payment] NOT IN (SELECT [payment] FROM [fin].[veh_sale_payment_receive_misc])


END