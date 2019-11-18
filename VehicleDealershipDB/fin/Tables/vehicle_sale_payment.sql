CREATE TABLE [fin].[vehicle_sale_payment] (
    [payment]          INT NOT NULL,
    [vehicle]          INT NOT NULL,
    [payment_function] INT NOT NULL,
    [modified_by]      INT NOT NULL,
    CONSTRAINT [PK_vehicle_sale_payment] PRIMARY KEY CLUSTERED ([payment] ASC),
    CONSTRAINT [FK_vehicle_sale_payment_payment] FOREIGN KEY ([payment]) REFERENCES [fin].[payment] ([payment]),
    CONSTRAINT [FK_vehicle_sale_payment_payment_function] FOREIGN KEY ([payment_function]) REFERENCES [fin].[payment_function] ([payment_function]),
    CONSTRAINT [FK_vehicle_sale_payment_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_sale_payment_vehicle_sale] FOREIGN KEY ([vehicle]) REFERENCES [fin].[vehicle_sale] ([vehicle])
);

