-- =============================================
-- Author:		hock
-- Create date: 9.12.2019
-- Description:	update vehicle expenses
-- =============================================
CREATE PROCEDURE [fin].[sp_update_veh_sale_payment_customer]
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
DELETE FROM [fin].[payment_in]
WHERE [payment_in] IN
(
	SELECT [payment_in]
	FROM [fin].[veh_sale_payment_customer]
	WHERE [vehicle] = @vehicle
		AND [payment_in] NOT IN (SELECT * FROM @payment_table)
)

-- no duplicate payment_id allowed
INSERT INTO [fin].[veh_sale_payment_customer]
(
	[vehicle],
	[payment_in],
	[modified_by]
)
SELECT 
	@vehicle,
	[payment_in],
	@uid

FROM [fin].[payment_in] PAYMENT

WHERE [payment_in] IN (SELECT * FROM @payment_table)
	AND [payment_in] NOT IN (SELECT [payment_in] FROM [fin].[veh_sale_payment_customer])


END