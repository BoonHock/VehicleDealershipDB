-- =============================================
-- Author:		hock
-- Create date: 25.8.2019
-- Description:	select person
-- =============================================
CREATE PROCEDURE [hr].[sp_select_person] 
	-- Add the parameters for the stored procedure here
	@person int = 0

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	HRPERSON.[person],
	HRPERSON.[name],
	HRPERSON.[ic_no],
	HRPERSON.[image],
	HRPERSON.[person_type],
	PERSONTYPE.[person_type_description],
	HRPERSON.[driving_license],
	HRPERSON.[gender],
	HRPERSON.[race],
	HRRACE.[race_description],
	HRPERSON.[address],
	HRPERSON.[city],
	HRPERSON.[state],
	HRPERSON.[postcode],
	HRPERSON.[country],
	HRCOUNTRY.[country_name],
	HRPERSON.[occupation],
	HRPERSON.[company]

FROM [hr].[person] HRPERSON

JOIN [hr].[person_type] PERSONTYPE
	ON PERSONTYPE.[person_type] = HRPERSON.[person_type]

JOIN [hr].[race] HRRACE
	ON HRRACE.[race] = HRPERSON.[race]

JOIN [hr].[country] HRCOUNTRY
	ON HRCOUNTRY.[country] = HRPERSON.[country]

WHERE HRPERSON.[person] = @person


END