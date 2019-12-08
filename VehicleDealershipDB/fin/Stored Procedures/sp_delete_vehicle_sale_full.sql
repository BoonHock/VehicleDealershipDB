-- =============================================
-- Author:		hock
-- Create date: 5.12.2019
-- Description:	delete all vehicle sale stuffs
-- =============================================
CREATE PROCEDURE [fin].[sp_delete_vehicle_sale_full] 
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@uid int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

BEGIN TRY
    BEGIN TRANSACTION 
		-- delete sale charges
		DELETE FROM [fin].[vehicle_sale_charges]
		WHERE [vehicle] = @vehicle

		-- delete payment received from buyer and also misc payment received
		DELETE FROM [fin].[payment]
		WHERE [payment] IN (
			SELECT [payment]
			FROM [fin].[veh_sale_payment_customer]
			WHERE [vehicle] = @vehicle

			UNION ALL

			SELECT [payment]
			FROM [fin].[veh_sale_payment_receive_misc]
			WHERE [vehicle] = @vehicle
		)

		-- remove any trade-in dependency
		UPDATE [veh].[vehicle]
		SET [vehicle_sale] = NULL
		WHERE [vehicle_sale] = @vehicle

		-- delete all insurance drivers
		DELETE FROM [fin].[insurance_driver]
		WHERE [vehicle] = @vehicle

		-- delete insurance misc charges
		DELETE FROM [fin].[insurance_misc_charges]
		WHERE [vehicle] = @vehicle

		-- delete vehicle sale completely
		EXEC [fin].[sp_delete_vehicle_sale]
			@vehicle = @vehicle,
			@uid = @uid

    COMMIT
END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK
END CATCH




END