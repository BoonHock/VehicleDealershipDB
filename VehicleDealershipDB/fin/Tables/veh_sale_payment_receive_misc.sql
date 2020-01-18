CREATE TABLE [fin].[veh_sale_payment_receive_misc] (
    [payment_in]  INT NOT NULL,
    [vehicle]     INT NOT NULL,
    [modified_by] INT NOT NULL,
    CONSTRAINT [PK_veh_sale_payment_received_misc] PRIMARY KEY CLUSTERED ([payment_in] ASC),
    CONSTRAINT [FK_veh_sale_payment_receive_misc_payment_in] FOREIGN KEY ([payment_in]) REFERENCES [fin].[payment_in] ([payment_in]) ON DELETE CASCADE,
    CONSTRAINT [FK_veh_sale_payment_received_misc_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_veh_sale_payment_received_misc_vehicle_sale] FOREIGN KEY ([vehicle]) REFERENCES [fin].[vehicle_sale] ([vehicle])
);



