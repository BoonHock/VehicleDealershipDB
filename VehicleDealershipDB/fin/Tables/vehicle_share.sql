CREATE TABLE [fin].[vehicle_share] (
    [vehicle]            INT            NOT NULL,
    [share_person]       INT            NULL,
    [share_organisation] INT            NULL,
    [amount]             FLOAT (53)     CONSTRAINT [DF_vehicle_share_amount] DEFAULT ((0)) NOT NULL,
    [remark]             NVARCHAR (100) CONSTRAINT [DF_vehicle_share_remark] DEFAULT ('') NOT NULL,
    [modified_by]        INT            NOT NULL,
    CONSTRAINT [CK_vehicle_share] CHECK ([share_person] IS NULL AND [share_organisation] IS NOT NULL OR [share_person] IS NOT NULL AND [share_organisation] IS NULL),
    CONSTRAINT [FK_vehicle_share_organisation] FOREIGN KEY ([share_organisation]) REFERENCES [hr].[organisation] ([organisation]),
    CONSTRAINT [FK_vehicle_share_person] FOREIGN KEY ([share_person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_vehicle_share_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_share_vehicle] FOREIGN KEY ([vehicle]) REFERENCES [veh].[vehicle] ([vehicle]),
    CONSTRAINT [IX_vehicle_share] UNIQUE NONCLUSTERED ([vehicle] ASC, [share_person] ASC, [share_organisation] ASC)
);

