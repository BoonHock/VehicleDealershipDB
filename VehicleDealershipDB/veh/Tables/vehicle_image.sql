CREATE TABLE [veh].[vehicle_image] (
    [vehicle_image] INT            IDENTITY (1, 1) NOT NULL,
    [vehicle]       INT            NOT NULL,
    [filename]      NVARCHAR (MAX) NOT NULL,
    [description]   NVARCHAR (100) CONSTRAINT [DF_vehicle_image_image_description] DEFAULT ('') NOT NULL,
    [modified_by]   INT            NOT NULL,
    CONSTRAINT [PK_vehicle_image] PRIMARY KEY CLUSTERED ([vehicle_image] ASC),
    CONSTRAINT [FK_vehicle_image_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_image_vehicle] FOREIGN KEY ([vehicle]) REFERENCES [veh].[vehicle] ([vehicle])
);





