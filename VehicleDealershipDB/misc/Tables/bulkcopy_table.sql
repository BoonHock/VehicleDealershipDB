CREATE TABLE [misc].[bulkcopy_table] (
    [vehicle_group]      INT             NULL,
    [vehicle_group_name] NVARCHAR (50)   NULL,
    [nvarchar1]          NVARCHAR (MAX)  NULL,
    [nvarchar2]          NVARCHAR (MAX)  NULL,
    [nvarchar3]          NVARCHAR (MAX)  NULL,
    [nvarchar4]          NVARCHAR (MAX)  NULL,
    [nvarchar5]          NVARCHAR (MAX)  NULL,
    [int1]               INT             NULL,
    [int2]               INT             NULL,
    [int3]               INT             NULL,
    [decimal18_4]        DECIMAL (18, 4) NULL,
    [created_by]         INT             NOT NULL,
    CONSTRAINT [FK_temporary_table_user] FOREIGN KEY ([created_by]) REFERENCES [dbsecurity].[user] ([user])
);













