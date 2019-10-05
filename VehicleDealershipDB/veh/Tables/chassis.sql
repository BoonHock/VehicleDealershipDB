CREATE TABLE [veh].[chassis] (
    [chassis]           INT           IDENTITY (1, 1) NOT NULL,
    [chassis_no]        NVARCHAR (20) NOT NULL,
    [vehicle_model]     INT           NOT NULL,
    [registration_date] DATE          NOT NULL,
    [modified_by]       INT           NOT NULL,
    CONSTRAINT [PK_chassis] PRIMARY KEY CLUSTERED ([chassis] ASC),
    CONSTRAINT [FK_chassis_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_chassis_vehicle_model] FOREIGN KEY ([vehicle_model]) REFERENCES [veh].[vehicle_model] ([vehicle_model]),
    CONSTRAINT [IX_chassis] UNIQUE NONCLUSTERED ([chassis_no] ASC)
);



