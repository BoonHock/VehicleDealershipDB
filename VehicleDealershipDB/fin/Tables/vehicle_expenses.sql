CREATE TABLE [fin].[vehicle_expenses] (
    [vehicle] INT NOT NULL,
    [payment] INT NOT NULL,
    CONSTRAINT [PK_vehicle_expenses_1] PRIMARY KEY CLUSTERED ([vehicle] ASC, [payment] ASC),
    CONSTRAINT [FK_vehicle_expenses_payment] FOREIGN KEY ([payment]) REFERENCES [fin].[payment] ([payment]) ON DELETE CASCADE,
    CONSTRAINT [FK_vehicle_expenses_vehicle] FOREIGN KEY ([vehicle]) REFERENCES [veh].[vehicle] ([vehicle]),
    CONSTRAINT [IX_vehicle_expenses] UNIQUE NONCLUSTERED ([payment] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'one payment is for one vehicle expenses only. mana boleh one payment multiple different vehicle right?', @level0type = N'SCHEMA', @level0name = N'fin', @level1type = N'TABLE', @level1name = N'vehicle_expenses', @level2type = N'CONSTRAINT', @level2name = N'IX_vehicle_expenses';

