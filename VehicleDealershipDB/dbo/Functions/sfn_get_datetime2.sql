-- =============================================
-- Author:		HOCK
-- Create date: 05.04.2019
-- Description:	convert to datetime from shit ass integers
-- =============================================
CREATE FUNCTION [dbo].[sfn_get_datetime2] 
(
	-- Add the parameters for the function here
	@date_int int = 0,
	@time_int INT = 0
)
RETURNS datetime2(0)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result datetime2(0)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = CAST(CAST(CAST(DATEADD(DAY, @date_int, '1800/12/28') AS date) AS nvarchar)+ ' ' + 
		CAST(CAST(DATEADD(SECOND, @time_int/100, '00:00:00') AS time) AS nvarchar) AS DATETIME2(0))

	-- Return the result of the function
	RETURN @Result

END
