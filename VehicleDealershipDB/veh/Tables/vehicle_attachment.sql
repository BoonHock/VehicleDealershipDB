CREATE TABLE [veh].[vehicle_attachment] (
    [vehicle_attachment] INT            IDENTITY (1, 1) NOT NULL,
    [vehicle]            INT            NOT NULL,
    [filename]           NVARCHAR (MAX) NOT NULL,
    [modified_by]        INT            NOT NULL,
    CONSTRAINT [PK_vehicle_attachment] PRIMARY KEY CLUSTERED ([vehicle_attachment] ASC),
    CONSTRAINT [FK_vehicle_attachment_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_attachment_vehicle] FOREIGN KEY ([vehicle]) REFERENCES [veh].[vehicle] ([vehicle])
);



