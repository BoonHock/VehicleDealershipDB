CREATE TABLE [fin].[vehicle_return] (
    [vehicle]     INT            NOT NULL,
    [return_date] DATE           NOT NULL,
    [return_by]   INT            NOT NULL,
    [remark]      NVARCHAR (100) NOT NULL,
    [modified_by] INT            NOT NULL,
    CONSTRAINT [PK_vehicle_return] PRIMARY KEY CLUSTERED ([vehicle] ASC),
    CONSTRAINT [FK_vehicle_return_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_return_user1] FOREIGN KEY ([return_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_return_vehicle] FOREIGN KEY ([vehicle]) REFERENCES [veh].[vehicle] ([vehicle])
);

