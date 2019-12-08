CREATE TABLE [fin].[vehicle_expenses] (
    [payment]            INT NOT NULL,
    [vehicle]            INT NOT NULL,
    [charge_to_customer] BIT CONSTRAINT [DF_vehicle_expenses_charge_to_customer] DEFAULT ((0)) NOT NULL,
    [modified_by]        INT NOT NULL,
    CONSTRAINT [PK_vehicle_expenses] PRIMARY KEY CLUSTERED ([payment] ASC),
    CONSTRAINT [FK_vehicle_expenses_payment] FOREIGN KEY ([payment]) REFERENCES [fin].[payment] ([payment]) ON DELETE CASCADE,
    CONSTRAINT [FK_vehicle_expenses_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_expenses_vehicle] FOREIGN KEY ([vehicle]) REFERENCES [veh].[vehicle] ([vehicle])
);

