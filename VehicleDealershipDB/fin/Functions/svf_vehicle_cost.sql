-- =============================================
-- Author:		hock
-- Create date: 6.11.2019
-- Description:	vehicle's total cost
-- =============================================
CREATE FUNCTION [fin].[svf_vehicle_cost] 
(
	-- Add the parameters for the function here
	@vehicle int
)
RETURNS decimal(18,4)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result decimal(18,4)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = VEHICLE.[purchase_price] 
		- VEHICLE.[overtrade] 
		+ ISNULL(VEXP.[amount],0)
		
FROM [veh].[vehicle] VEHICLE


LEFT JOIN (
	SELECT 
		VEXP.[vehicle],
		SUM(PAYMENT.[amount]) AS [amount]
	FROM [fin].[vehicle_expenses] VEXP

	JOIN [fin].[payment] PAYMENT
		ON VEXP.[payment] = PAYMENT.[payment]

	GROUP BY VEXP.[vehicle]
) VEXP
	ON VEHICLE.[vehicle] = VEXP.[vehicle]


WHERE VEHICLE.[vehicle] = @vehicle


	-- Return the result of the function
	RETURN @Result

END