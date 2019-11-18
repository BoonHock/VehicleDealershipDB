﻿CREATE TABLE [fin].[vehicle_payment_DELETE] (
    [vehicle] INT NOT NULL,
    [payment] INT NOT NULL,
    CONSTRAINT [PK_vehicle_payment_1] PRIMARY KEY CLUSTERED ([vehicle] ASC, [payment] ASC),
    CONSTRAINT [FK_vehicle_payment_payment] FOREIGN KEY ([payment]) REFERENCES [fin].[payment] ([payment]) ON DELETE CASCADE,
    CONSTRAINT [FK_vehicle_payment_vehicle] FOREIGN KEY ([vehicle]) REFERENCES [veh].[vehicle] ([vehicle]) ON DELETE CASCADE
);

