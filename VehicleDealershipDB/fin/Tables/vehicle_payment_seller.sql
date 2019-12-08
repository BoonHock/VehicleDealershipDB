CREATE TABLE [fin].[vehicle_payment_seller] (
    [payment]     INT NOT NULL,
    [vehicle]     INT NOT NULL,
    [modified_by] INT NOT NULL,
    CONSTRAINT [PK_vehicle_payment_seller] PRIMARY KEY CLUSTERED ([payment] ASC),
    CONSTRAINT [FK_vehicle_payment_seller_payment] FOREIGN KEY ([payment]) REFERENCES [fin].[payment] ([payment]) ON DELETE CASCADE,
    CONSTRAINT [FK_vehicle_payment_seller_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_payment_seller_vehicle] FOREIGN KEY ([vehicle]) REFERENCES [veh].[vehicle] ([vehicle])
);

