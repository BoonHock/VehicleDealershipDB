CREATE TABLE [fin].[vehicle_payment] (
    [payment]            INT NOT NULL,
    [vehicle]            INT NOT NULL,
    [payment_function]   INT NOT NULL,
    [charge_to_customer] BIT CONSTRAINT [DF_vehicle_payment_charge_to_customer] DEFAULT ((0)) NOT NULL,
    [modified_by]        INT NOT NULL,
    CONSTRAINT [PK_vehicle_payment_in] PRIMARY KEY CLUSTERED ([payment] ASC),
    CONSTRAINT [FK_vehicle_payment_in_payment] FOREIGN KEY ([payment]) REFERENCES [fin].[payment] ([payment]),
    CONSTRAINT [FK_vehicle_payment_in_payment_function] FOREIGN KEY ([payment_function]) REFERENCES [fin].[payment_function] ([payment_function]),
    CONSTRAINT [FK_vehicle_payment_in_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_payment_in_vehicle] FOREIGN KEY ([vehicle]) REFERENCES [veh].[vehicle] ([vehicle])
);







