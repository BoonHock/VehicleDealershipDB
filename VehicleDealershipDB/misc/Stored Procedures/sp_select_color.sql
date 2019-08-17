-- =============================================
-- Author:		HOCK
-- Create date: 16.8.2019
-- Description:	select color
-- =============================================
CREATE PROCEDURE [misc].[sp_select_color] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	COLOR.[color],
	COLOR.[color_name],
	DBUSER.[name] AS [modified_by]

FROM [misc].[color] COLOR

JOIN [dbsecurity].[user] DBUSER
	ON COLOR.[modified_by] = DBUSER.[user]

ORDER BY [COLOR].[color_name]


END