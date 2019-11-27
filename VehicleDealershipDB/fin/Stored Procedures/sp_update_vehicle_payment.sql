-- =============================================
-- Author:		hock
-- Create date: 5.10.2019
-- Description:	update vehicle payment
-- =============================================
CREATE PROCEDURE [fin].[sp_update_vehicle_payment] 
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@payment_combine nvarchar(max),
	@payment_function int,
	-- contains payment id to charge to customer. if not here, then not charging to customer
	@charge_to_customer nvarchar(max),
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
	FROM [fin].[vehicle_payment]
	WHERE [payment] NOT IN (SELECT * FROM @payment_table)
		AND [vehicle] = @vehicle
		AND [payment_function] = @payment_function
)


UPDATE VPAYMENT
SET VPAYMENT.[charge_to_customer] = CASE WHEN CHARGETOCUSTOMER.[value] IS NULL THEN 0 ELSE 1 END,
	VPAYMENT.[modified_by] = @uid

FROM [fin].[vehicle_payment] VPAYMENT

LEFT JOIN string_split(@charge_to_customer,',') CHARGETOCUSTOMER
	ON CHARGETOCUSTOMER.[value] = VPAYMENT.[payment]

WHERE VPAYMENT.[vehicle] = @vehicle
	AND VPAYMENT.[payment_function] = @payment_function
	AND [payment] IN (SELECT * FROM @payment_table)

-- no duplicate payment_id allowed
INSERT INTO [fin].[vehicle_payment]
(
	[vehicle],
	[payment],
	[payment_function],
	[charge_to_customer],
	[modified_by]
)
SELECT 
	@vehicle,
	[payment],
	@payment_function,
	CASE WHEN CHARGETOCUSTOMER.[value] IS NULL THEN 0 ELSE 1 END,
	@uid

FROM [fin].[payment] PAYMENT

LEFT JOIN string_split(@charge_to_customer,',') CHARGETOCUSTOMER
	ON CHARGETOCUSTOMER.[value] = PAYMENT.[payment]

WHERE [payment] IN (SELECT * FROM @payment_table)
	AND [payment] NOT IN (SELECT [payment] FROM [fin].[vehicle_payment])


END