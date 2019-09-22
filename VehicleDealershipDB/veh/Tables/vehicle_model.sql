CREATE TABLE [veh].[vehicle_model] (
    [vehicle_model]      INT           IDENTITY (1, 1) NOT NULL,
    [vehicle_model_name] NVARCHAR (50) NOT NULL,
    [vehicle_group]      INT           NOT NULL,
    [year_make]          SMALLINT      NOT NULL,
    [engine_capacity]    SMALLINT      NOT NULL,
    [no_of_door]         TINYINT       NOT NULL,
    [seat_capacity]      TINYINT       NOT NULL,
    [fuel_type]          INT           NOT NULL,
    [transmission]       INT           NOT NULL,
    [remarks]            TEXT          CONSTRAINT [DF_vehicle_model_remarks] DEFAULT ('') NOT NULL,
    [modified_by]        INT           NOT NULL,
    CONSTRAINT [PK_vehicle_model] PRIMARY KEY CLUSTERED ([vehicle_model] ASC),
    CONSTRAINT [FK_vehicle_model_fuel_type] FOREIGN KEY ([fuel_type]) REFERENCES [veh].[fuel_type] ([fuel_type]),
    CONSTRAINT [FK_vehicle_model_transmission] FOREIGN KEY ([transmission]) REFERENCES [veh].[transmission] ([transmission]),
    CONSTRAINT [FK_vehicle_model_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_model_vehicle_group] FOREIGN KEY ([vehicle_group]) REFERENCES [veh].[vehicle_group] ([vehicle_group]),
    CONSTRAINT [IX_vehicle_model] UNIQUE NONCLUSTERED ([vehicle_group] ASC, [vehicle_model_name] ASC)
);








GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'in cubic centimeters (cc)', @level0type = N'SCHEMA', @level0name = N'veh', @level1type = N'TABLE', @level1name = N'vehicle_model', @level2type = N'COLUMN', @level2name = N'engine_capacity';

