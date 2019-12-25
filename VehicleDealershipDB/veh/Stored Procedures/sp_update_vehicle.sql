-- =============================================
-- Author:		hock
-- Create date: 9.10.2019
-- Description:	update vehicle
-- =============================================
CREATE PROCEDURE [veh].[sp_update_vehicle] 
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@seller_person_org int,
	@seller_is_person bit,
	@registration_no nvarchar(10),
	@prev_registration_no nvarchar(10),
	@chassis int,
	@colour int,
	@is_new bit,
	@location int,
	@engine_no nvarchar(20),
	@engine_cc int,
	@mileage int,
	@vehicle_sale int,
	@consignment_mortgate bit,
	@door_key nvarchar(20),
	@ignition_key nvarchar(20),
	@purchase_date date,
	@date_received date,
	@settlement_date date,
	@invoice_no nvarchar(20),
	@road_tax decimal(18,4),
	@road_tax_expiry_date date,
	@purchase_price decimal(18,4),
	@overtrade decimal(18,4),
	@list_price decimal(18,4),
	@max_can_loan decimal(18,4),
	@loan_balance decimal(18,4),
	@loan_installment_amount decimal(18,4),
	@loan_finance int,
	@loan_installment_day_of_month tinyint,
	@loan_settlement_date date,
	@loan_agreement_no nvarchar(30),
	@remark nvarchar(255),
	@checked_by int,
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [veh].[vehicle]
SET [seller_person] = CASE WHEN @seller_is_person = 1 THEN @seller_person_org ELSE NULL END,
	[seller_organisation_branch] = CASE WHEN @seller_is_person = 0 THEN @seller_person_org ELSE NULL END,
	[registration_no] = @registration_no,
	[prev_registration_no] = @prev_registration_no,
	[chassis] = @chassis,
	[colour] = @colour,
	[is_new] = @is_new,
	[location] = @location,
	[engine_no] = @engine_no,
	[engine_cc] = @engine_cc,
	[mileage] = @mileage,
	[vehicle_sale] = @vehicle_sale,
	[consignment_mortgage] = @consignment_mortgate,
	[door_key] = @door_key,
	[ignition_key] = @ignition_key,
	[purchase_date] = @purchase_date,
	[date_received] = @date_received,
	[settlement_date] = @settlement_date,
	[invoice_no] = @invoice_no,
	[road_tax] = @road_tax,
	[road_tax_expiry_date] = @road_tax_expiry_date,
	[purchase_price] = @purchase_price,
	[overtrade] = @overtrade,
	[list_price] = @list_price,
	[max_can_loan] = @max_can_loan,
	[loan_balance] = @loan_balance,
	[loan_installment_amount] = @loan_installment_amount,

	[loan_finance] = @loan_finance,
	[loan_installment_day_of_month] = @loan_installment_day_of_month,
	[loan_settlement_date] = @loan_settlement_date,
	[loan_agreement_no] = @loan_agreement_no,

	[remark] = @remark,
	[checked_by] = @checked_by,
	[modified_by] = @modified_by

WHERE [vehicle] = @vehicle


END