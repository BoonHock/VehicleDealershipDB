﻿CREATE TABLE [hr].[finance] (
    [finance]     INT            NOT NULL,
    [remark]      NVARCHAR (255) CONSTRAINT [DF_finance_remark] DEFAULT ('') NOT NULL,
    [modified_by] INT            NOT NULL,
    CONSTRAINT [PK_finance] PRIMARY KEY CLUSTERED ([finance] ASC),
    CONSTRAINT [FK_finance_organisation1] FOREIGN KEY ([finance]) REFERENCES [hr].[organisation] ([organisation]),
    CONSTRAINT [FK_finance_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);



