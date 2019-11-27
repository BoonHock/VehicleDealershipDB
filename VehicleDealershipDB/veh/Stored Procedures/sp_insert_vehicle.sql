-- =============================================
-- Author:		hock
-- Create date: 2.10.2019
-- Description:	insert vehicle
-- =============================================
CREATE PROCEDURE [veh].[sp_insert_vehicle] 
	-- Add the parameters for the stored procedure here
	@seller_person_org int,
	@seller_is_person bit,
	@registration_no nvarchar(10),
	@prev_registration_no nvarchar(10),
	@chassis int,
	@colour int,
	@is_new bit,
	@location int,
	@engine_no nvarchar(20),
	@engine_cc float,
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
DECLARE @ref_no_prefix nvarchar(15)= ISNULL((
	SELECT [document_prefix_text]
	FROM [fin].[document_prefix]

	WHERE [document_prefix] = 'VEHICLE_PURCHASE'),'');

INSERT INTO [veh].[vehicle]
(
	[reference_no_prefix], 
	[seller_person], 
	[seller_organisation_branch], 
	[registration_no], 
	[prev_registration_no],
	[chassis], 
	[colour], 
	[is_new], 
	[location], 
	[engine_no], 
	[engine_cc], 
	[mileage], 
	[vehicle_sale], 
	[consignment_mortgage], 
	[door_key], 
	[ignition_key], 
	[purchase_date], 
	[date_received], 
	[settlement_date],
	[invoice_no], 
	[road_tax], 
	[road_tax_expiry_date], 
	[purchase_price], 
	[overtrade], 
	[list_price],
	[max_can_loan],
	[loan_balance], 
	[loan_installment_amount], 

	[loan_finance], 
	[loan_installment_day_of_month], 
	[loan_settlement_date], 
	[loan_agreement_no], 

	[remark], 
	[checked_by], 
	[modified_by]
)
VALUES
(
	@ref_no_prefix, 
	CASE WHEN @seller_is_person = 1 THEN @seller_person_org ELSE NULL END,
	CASE WHEN @seller_is_person = 0 THEN @seller_person_org ELSE NULL END,
	@registration_no,
	@prev_registration_no,
	@chassis,
	@colour,
	@is_new,
	@location,
	@engine_no,
	@engine_cc,
	@mileage,
	@vehicle_sale,
	@consignment_mortgate,
	@door_key,
	@ignition_key,
	@purchase_date,
	@date_received,
	@settlement_date,
	@invoice_no,
	@road_tax,
	@road_tax_expiry_date,
	@purchase_price,
	@overtrade,
	@list_price,
	@max_can_loan,
	@loan_balance,
	@loan_installment_amount,
	@loan_finance,
	@loan_installment_day_of_month,
	@loan_settlement_date,
	@loan_agreement_no,
	@remark,
	@checked_by,
	@modified_by
)

SELECT SCOPE_IDENTITY();

END