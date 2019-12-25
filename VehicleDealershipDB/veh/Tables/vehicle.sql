CREATE TABLE [veh].[vehicle] (
    [vehicle]                       INT             IDENTITY (1, 1) NOT NULL,
    [reference_no_prefix]           NVARCHAR (5)    CONSTRAINT [DF_vehicle_order_no_prefix] DEFAULT ('') NOT NULL,
    [reference_no]                  AS              ([reference_no_prefix]+CONVERT([nvarchar],[vehicle])),
    [seller_person]                 INT             NULL,
    [seller_organisation_branch]    INT             NULL,
    [prev_registration_no]          NVARCHAR (10)   CONSTRAINT [DF_vehicle_prev_registration_no] DEFAULT ('') NOT NULL,
    [registration_no]               NVARCHAR (10)   NOT NULL,
    [chassis]                       INT             NOT NULL,
    [colour]                        INT             NOT NULL,
    [is_new]                        BIT             NOT NULL,
    [location]                      INT             CONSTRAINT [DF_vehicle_location] DEFAULT (NULL) NULL,
    [engine_no]                     NVARCHAR (20)   NOT NULL,
    [engine_cc]                     INT             NOT NULL,
    [mileage]                       INT             NOT NULL,
    [vehicle_sale]                  INT             CONSTRAINT [DF_vehicle_vehicle_sale] DEFAULT (NULL) NULL,
    [consignment_mortgage]          BIT             CONSTRAINT [DF_vehicle_consignment_mortgage] DEFAULT (NULL) NULL,
    [door_key]                      NVARCHAR (20)   NOT NULL,
    [ignition_key]                  NVARCHAR (20)   NOT NULL,
    [purchase_date]                 DATE            NOT NULL,
    [date_received]                 DATE            NOT NULL,
    [settlement_date]               DATE            CONSTRAINT [DF_vehicle_settlement_date] DEFAULT (getdate()) NOT NULL,
    [invoice_no]                    NVARCHAR (20)   NOT NULL,
    [jpj_serial_no]                 NVARCHAR (20)   CONSTRAINT [DF_vehicle_jpj_serial_no] DEFAULT ('') NOT NULL,
    [road_tax]                      DECIMAL (18, 4) CONSTRAINT [DF_vehicle_loan_balance1] DEFAULT ((0)) NOT NULL,
    [road_tax_expiry_date]          DATE            CONSTRAINT [DF_vehicle_road_tax_expiry_date] DEFAULT (NULL) NULL,
    [purchase_price]                DECIMAL (18, 4) CONSTRAINT [DF_vehicle_purchase_price] DEFAULT ((0)) NOT NULL,
    [overtrade]                     DECIMAL (18, 4) CONSTRAINT [DF_vehicle_purchase_price1] DEFAULT ((0)) NOT NULL,
    [list_price]                    DECIMAL (18, 4) CONSTRAINT [DF_vehicle_list_price] DEFAULT ((0)) NOT NULL,
    [max_can_loan]                  DECIMAL (18, 4) CONSTRAINT [DF_vehicle_list_price1] DEFAULT ((0)) NOT NULL,
    [loan_balance]                  DECIMAL (18, 4) CONSTRAINT [DF_Table_1_list_price1] DEFAULT ((0)) NOT NULL,
    [loan_installment_amount]       DECIMAL (18, 4) CONSTRAINT [DF_vehicle_installment_amount] DEFAULT ((0)) NOT NULL,
    [loan_finance]                  INT             NULL,
    [loan_installment_day_of_month] TINYINT         CONSTRAINT [DF_vehicle_installment_day_of_month] DEFAULT ((1)) NOT NULL,
    [loan_settlement_date]          DATE            NOT NULL,
    [loan_agreement_no]             NVARCHAR (30)   CONSTRAINT [DF_vehicle_loan_agreement_no] DEFAULT ('') NOT NULL,
    [remark]                        NVARCHAR (255)  NOT NULL,
    [checked_by]                    INT             NOT NULL,
    [modified_by]                   INT             NOT NULL,
    CONSTRAINT [PK_vehicle] PRIMARY KEY CLUSTERED ([vehicle] ASC),
    CONSTRAINT [CK_vehicle] CHECK ([seller_person] IS NULL AND [seller_organisation_branch] IS NOT NULL OR [seller_person] IS NOT NULL AND [seller_organisation_branch] IS NULL),
    CONSTRAINT [CK_vehicle_1] CHECK ([vehicle_sale] IS NULL OR [consignment_mortgage] IS NULL),
    CONSTRAINT [CK_vehicle_2] CHECK ([vehicle_sale]<>[vehicle]),
    CONSTRAINT [FK_vehicle_chassis] FOREIGN KEY ([chassis]) REFERENCES [veh].[chassis] ([chassis]),
    CONSTRAINT [FK_vehicle_color] FOREIGN KEY ([colour]) REFERENCES [misc].[colour] ([colour]),
    CONSTRAINT [FK_vehicle_finance] FOREIGN KEY ([loan_finance]) REFERENCES [hr].[finance] ([finance]),
    CONSTRAINT [FK_vehicle_location] FOREIGN KEY ([location]) REFERENCES [misc].[location] ([location]),
    CONSTRAINT [FK_vehicle_organisation] FOREIGN KEY ([seller_organisation_branch]) REFERENCES [hr].[organisation] ([organisation]),
    CONSTRAINT [FK_vehicle_person] FOREIGN KEY ([seller_person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_vehicle_user] FOREIGN KEY ([checked_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_user1] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_vehicle_sale] FOREIGN KEY ([vehicle_sale]) REFERENCES [fin].[vehicle_sale] ([vehicle])
);






















GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'vehicle is either obtained via trade in (vehicle_sale) or consignment/mortgage or purchase

trade in means will have vehicle_sale and consignment_mortgage will be NULL. purchase means both will be NULL. consignment/mortgage means vehicle_sale will be NULL and will have either 1 or 0 for consignment_mortgage', @level0type = N'SCHEMA', @level0name = N'veh', @level1type = N'TABLE', @level1name = N'vehicle', @level2type = N'CONSTRAINT', @level2name = N'CK_vehicle_1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'seller is only either a person or organisation', @level0type = N'SCHEMA', @level0name = N'veh', @level1type = N'TABLE', @level1name = N'vehicle', @level2type = N'CONSTRAINT', @level2name = N'CK_vehicle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'in kilometers', @level0type = N'SCHEMA', @level0name = N'veh', @level1type = N'TABLE', @level1name = N'vehicle', @level2type = N'COLUMN', @level2name = N'mileage';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'1 - consignment; 0 - mortgage', @level0type = N'SCHEMA', @level0name = N'veh', @level1type = N'TABLE', @level1name = N'vehicle', @level2type = N'COLUMN', @level2name = N'consignment_mortgage';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'cannot self trade-in right?', @level0type = N'SCHEMA', @level0name = N'veh', @level1type = N'TABLE', @level1name = N'vehicle', @level2type = N'CONSTRAINT', @level2name = N'CK_vehicle_2';

