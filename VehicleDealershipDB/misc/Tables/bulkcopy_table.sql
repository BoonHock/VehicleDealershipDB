﻿CREATE TABLE [misc].[bulkcopy_table] (
    [vehicle_group]      INT           NULL,
    [vehicle_group_name] NVARCHAR (50) NULL,
    [created_by]         INT           NOT NULL,
    CONSTRAINT [FK_temporary_table_user] FOREIGN KEY ([created_by]) REFERENCES [dbsecurity].[user] ([user])
);
