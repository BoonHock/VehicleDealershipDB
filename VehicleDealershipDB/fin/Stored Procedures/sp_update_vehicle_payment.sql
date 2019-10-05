-- =============================================
-- Author:		hock
-- Create date: 5.10.2019
-- Description:	update vehicle payment
-- =============================================
CREATE PROCEDURE [fin].[sp_update_vehicle_payment] 
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@payment_combine nvarchar(max) = ''

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
)

-- no duplicate payment_id allowed
INSERT INTO [fin].[vehicle_payment]
SELECT 
	@vehicle,
	[payment]

FROM [fin].[payment]
WHERE [payment] IN (SELECT * FROM @payment_table)
	AND [payment] NOT IN (SELECT [payment] FROM [fin].[vehicle_payment])


END