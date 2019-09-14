﻿CREATE TABLE [fin].[vehicle_expenses] (
    [vehicle] INT NOT NULL,
    [payment] INT NOT NULL,
    CONSTRAINT [PK_vehicle_expenses_1] PRIMARY KEY CLUSTERED ([vehicle] ASC, [payment] ASC),
    CONSTRAINT [FK_vehicle_expenses_payment] FOREIGN KEY ([payment]) REFERENCES [fin].[payment] ([payment]),
    CONSTRAINT [FK_vehicle_expenses_vehicle] FOREIGN KEY ([vehicle]) REFERENCES [veh].[vehicle] ([vehicle])
);
