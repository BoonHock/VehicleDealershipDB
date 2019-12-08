-- =============================================
-- Author:		hock
-- Create date: 9.12.2019
-- Description:	update vehicle expenses
-- =============================================
CREATE PROCEDURE fin.sp_update_vehicle_expenses 
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@payment_combine nvarchar(max),
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
	FROM [fin].[vehicle_expenses]
	WHERE [vehicle] = @vehicle
		AND [payment] NOT IN (SELECT * FROM @payment_table)
)

UPDATE VEXP
SET VEXP.[charge_to_customer] = CASE WHEN CHARGETOCUSTOMER.[value] IS NULL THEN 0 ELSE 1 END,
	VEXP.[modified_by] = @uid

FROM [fin].[vehicle_expenses] VEXP

LEFT JOIN string_split(@charge_to_customer,',') CHARGETOCUSTOMER
	ON CHARGETOCUSTOMER.[value] = VEXP.[payment]

WHERE VEXP.[vehicle] = @vehicle
	AND [payment] IN (SELECT * FROM @payment_table)


-- no duplicate payment_id allowed
INSERT INTO [fin].[vehicle_expenses]
(
	[vehicle],
	[payment],
	[charge_to_customer],
	[modified_by]
)
SELECT 
	@vehicle,
	[payment],
	CASE WHEN CHARGETOCUSTOMER.[value] IS NULL THEN 0 ELSE 1 END,
	@uid

FROM [fin].[payment] PAYMENT

LEFT JOIN string_split(@charge_to_customer,',') CHARGETOCUSTOMER
	ON CHARGETOCUSTOMER.[value] = PAYMENT.[payment]

WHERE [payment] IN (SELECT * FROM @payment_table)
	AND [payment] NOT IN (SELECT [payment] FROM [fin].[vehicle_expenses])


END