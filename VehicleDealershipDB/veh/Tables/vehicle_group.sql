CREATE TABLE [veh].[vehicle_group] (
    [vehicle_group]      INT           IDENTITY (1, 1) NOT NULL,
    [vehicle_group_name] NVARCHAR (50) NOT NULL,
    [vehicle_brand]      INT           NOT NULL,
    [modified_by]        INT           NOT NULL,
    CONSTRAINT [PK_vehicle_group] PRIMARY KEY CLUSTERED ([vehicle_group] ASC),
    CONSTRAINT [FK_vehicle_group_vehicle_brand] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_group_vehicle_brand1] FOREIGN KEY ([vehicle_brand]) REFERENCES [veh].[vehicle_brand] ([vehicle_brand]),
    CONSTRAINT [IX_vehicle_group] UNIQUE NONCLUSTERED ([vehicle_group_name] ASC, [vehicle_brand] ASC)
);






GO
