CREATE TABLE [veh].[fuel_type] (
    [fuel_type]      INT           IDENTITY (1, 1) NOT NULL,
    [fuel_type_name] NVARCHAR (20) NOT NULL,
    [modified_by]    INT           NOT NULL,
    CONSTRAINT [PK_fuel_type] PRIMARY KEY CLUSTERED ([fuel_type] ASC),
    CONSTRAINT [FK_fuel_type_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_fuel_type] UNIQUE NONCLUSTERED ([fuel_type_name] ASC)
);



