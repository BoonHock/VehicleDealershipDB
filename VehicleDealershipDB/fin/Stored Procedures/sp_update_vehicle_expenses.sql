﻿-- =============================================
-- Author:		hock
-- Create date: 9.12.2019
-- Description:	update vehicle expenses
-- =============================================
CREATE PROCEDURE [fin].[sp_update_vehicle_expenses] 
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@payment_combine nvarchar(max),
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
DELETE FROM [fin].[payment_out]
WHERE [payment_out] IN
(
	SELECT [payment]
	FROM [fin].[vehicle_expenses]
	WHERE [vehicle] = @vehicle
		AND [payment] NOT IN (SELECT * FROM @payment_table)
)

-- no duplicate payment_id allowed
INSERT INTO [fin].[vehicle_expenses]
(
	[vehicle],
	[payment],
	[modified_by]
)
SELECT 
	@vehicle,
	[payment_out],
	@uid

FROM [fin].[payment_out] PAYMENT

WHERE [payment_out] IN (SELECT * FROM @payment_table)
	AND [payment_out] NOT IN (SELECT [payment] FROM [fin].[vehicle_expenses])


END