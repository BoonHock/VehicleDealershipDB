CREATE TABLE [misc].[bulkcopy_table] (
    [vehicle_group]      INT            NULL,
    [vehicle_group_name] NVARCHAR (50)  NULL,
    [col_nvarchar50_1]   NVARCHAR (100) NULL,
    [col_int_1]          INT            NULL,
    [created_by]         INT            NOT NULL,
    CONSTRAINT [FK_temporary_table_user] FOREIGN KEY ([created_by]) REFERENCES [dbsecurity].[user] ([user])
);



