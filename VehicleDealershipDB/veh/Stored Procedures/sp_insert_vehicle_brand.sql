-- =============================================
-- Author:		HOCK
-- Create date: 15.7.2019
-- Description:	insert vehicle brand
-- =============================================
CREATE PROCEDURE [veh].[sp_insert_vehicle_brand] 
	-- Add the parameters for the stored procedure here
	@vbrand_name nvarchar(20),
	@country INT,
	@modified_by INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO veh.vehicle_brand
(
	[vehicle_brand_name],
	[country],
	[modified_by]
)
VALUES
(
	@vbrand_name,
	@country,
	@modified_by
)

SELECT SCOPE_IDENTITY();

END