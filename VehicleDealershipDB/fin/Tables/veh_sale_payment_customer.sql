CREATE TABLE [fin].[veh_sale_payment_customer] (
    [payment_in]  INT NOT NULL,
    [vehicle]     INT NOT NULL,
    [modified_by] INT NOT NULL,
    CONSTRAINT [PK_veh_sale_payment_received] PRIMARY KEY CLUSTERED ([payment_in] ASC),
    CONSTRAINT [FK_veh_sale_payment_received_payment] FOREIGN KEY ([payment_in]) REFERENCES [fin].[payment_in] ([payment_in]) ON DELETE CASCADE,
    CONSTRAINT [FK_veh_sale_payment_received_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_veh_sale_payment_received_vehicle_sale] FOREIGN KEY ([vehicle]) REFERENCES [fin].[vehicle_sale] ([vehicle])
);



