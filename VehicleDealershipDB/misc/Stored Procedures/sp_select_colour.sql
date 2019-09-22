-- =============================================
-- Author:		HOCK
-- Create date: 16.8.2019
-- Description:	select colour
-- =============================================
CREATE PROCEDURE [misc].[sp_select_colour] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	COLOUR.[colour],
	COLOUR.[colour_name],
	DBUSER.[name] AS [modified_by]

FROM [misc].[colour] COLOUR

JOIN [dbsecurity].[user] DBUSER
	ON COLOUR.[modified_by] = DBUSER.[user]

ORDER BY COLOUR.[colour_name]


END