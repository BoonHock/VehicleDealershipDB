CREATE TABLE [veh].[vehicle_model_image] (
    [vehicle_model_image] INT             IDENTITY (1, 1) NOT NULL,
    [vehicle_model]       INT             NOT NULL,
    [image]               VARBINARY (MAX) NOT NULL,
    [image_description]   NVARCHAR (100)  CONSTRAINT [DF_vehicle_model_image_description] DEFAULT ('') NOT NULL,
    [created_by]          INT             NOT NULL,
    [created_on]          DATETIME2 (7)   CONSTRAINT [DF_vehicle_model_image_created_on] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_vehicle_model_image] PRIMARY KEY CLUSTERED ([vehicle_model_image] ASC),
    CONSTRAINT [FK_vehicle_model_image_user] FOREIGN KEY ([created_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_model_image_vehicle_model] FOREIGN KEY ([vehicle_model]) REFERENCES [veh].[vehicle_model] ([vehicle_model])
);

