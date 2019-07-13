CREATE TABLE [veh].[vehicle_model] (
    [vehicle_model]      INT            IDENTITY (1, 1) NOT NULL,
    [vehicle_model_name] NVARCHAR (100) NOT NULL,
    [vehicle_group]      INT            NOT NULL,
    [modified_by]        INT            NOT NULL,
    [modified_on]        DATETIME2 (0)  CONSTRAINT [DF_vehicle_model_modified_on] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_vehicle_model] PRIMARY KEY CLUSTERED ([vehicle_model] ASC),
    CONSTRAINT [FK_vehicle_model_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_model_vehicle_group1] FOREIGN KEY ([vehicle_group]) REFERENCES [veh].[vehicle_group] ([vehicle_group])
);

