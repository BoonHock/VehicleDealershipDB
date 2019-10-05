CREATE TABLE [veh].[vehicle] (
    [vehicle]                    INT             IDENTITY (1, 1) NOT NULL,
    [order_no_prefix]            NVARCHAR (5)    CONSTRAINT [DF_vehicle_order_no_prefix] DEFAULT ('') NOT NULL,
    [order_no]                   AS              ([order_no_prefix]+CONVERT([nvarchar],[vehicle])),
    [seller_person]              INT             NULL,
    [seller_organisation_branch] INT             NULL,
    [registration_no]            NVARCHAR (10)   NOT NULL,
    [chassis]                    INT             NOT NULL,
    [colour]                     INT             NOT NULL,
    [is_new]                     BIT             NOT NULL,
    [location]                   INT             CONSTRAINT [DF_vehicle_location] DEFAULT (NULL) NULL,
    [engine_no]                  NVARCHAR (20)   NOT NULL,
    [engine_cc]                  FLOAT (53)      NOT NULL,
    [mileage]                    INT             NOT NULL,
    [vehicle_sale]               INT             NULL,
    [consignment_mortgage]       BIT             CONSTRAINT [DF_vehicle_consignment_mortgage] DEFAULT (NULL) NULL,
    [door_key]                   NVARCHAR (20)   NOT NULL,
    [ignition_key]               NVARCHAR (20)   NOT NULL,
    [purchase_date]              DATE            NOT NULL,
    [date_received]              DATE            NOT NULL,
    [invoice_no]                 NVARCHAR (20)   NOT NULL,
    [road_tax]                   DECIMAL (18, 4) CONSTRAINT [DF_vehicle_loan_balance1] DEFAULT ((0)) NOT NULL,
    [road_tax_expiry_date]       DATE            CONSTRAINT [DF_vehicle_road_tax_expiry_date] DEFAULT (NULL) NULL,
    [purchase_price]             DECIMAL (18, 4) CONSTRAINT [DF_vehicle_purchase_price] DEFAULT ((0)) NOT NULL,
    [overtrade]                  DECIMAL (18, 4) CONSTRAINT [DF_vehicle_purchase_price1] DEFAULT ((0)) NOT NULL,
    [list_price]                 DECIMAL (18, 4) CONSTRAINT [DF_vehicle_list_price] DEFAULT ((0)) NOT NULL,
    [loan_balance]               DECIMAL (18, 4) CONSTRAINT [DF_Table_1_list_price1] DEFAULT ((0)) NOT NULL,
    [remark]                     NVARCHAR (255)  NOT NULL,
    [checked_by]                 INT             NOT NULL,
    [modified_by]                INT             NOT NULL,
    CONSTRAINT [PK_vehicle] PRIMARY KEY CLUSTERED ([vehicle] ASC),
    CONSTRAINT [CK_vehicle] CHECK ([seller_person] IS NULL AND [seller_organisation_branch] IS NOT NULL OR [seller_person] IS NOT NULL AND [seller_organisation_branch] IS NULL),
    CONSTRAINT [CK_vehicle_1] CHECK ([vehicle_sale] IS NULL OR [consignment_mortgage] IS NULL),
    CONSTRAINT [FK_vehicle_chassis] FOREIGN KEY ([chassis]) REFERENCES [veh].[chassis] ([chassis]),
    CONSTRAINT [FK_vehicle_color] FOREIGN KEY ([colour]) REFERENCES [misc].[colour] ([colour]),
    CONSTRAINT [FK_vehicle_location] FOREIGN KEY ([location]) REFERENCES [misc].[location] ([location]),
    CONSTRAINT [FK_vehicle_organisation] FOREIGN KEY ([seller_organisation_branch]) REFERENCES [hr].[organisation] ([organisation]),
    CONSTRAINT [FK_vehicle_person] FOREIGN KEY ([seller_person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_vehicle_user] FOREIGN KEY ([checked_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_user1] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
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

