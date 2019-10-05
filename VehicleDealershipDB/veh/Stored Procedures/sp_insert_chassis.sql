-- =============================================
-- Author:		hock
-- Create date: 2.10.2019
-- Description:	insert chassis
-- =============================================
CREATE PROCEDURE [veh].[sp_insert_chassis] 
	-- Add the parameters for the stored procedure here
	@chassis_no nvarchar(20),
	@vehicle_model int,
	@registration_date date,
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [veh].[chassis]
(
	[chassis_no]
	,[vehicle_model]
	,[registration_date]
	,[modified_by]
)
VALUES
(
	@chassis_no,
	@vehicle_model,
	@registration_date,
	@modified_by
)

SELECT SCOPE_IDENTITY();

END