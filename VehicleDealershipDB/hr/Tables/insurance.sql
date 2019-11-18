CREATE TABLE [hr].[insurance] (
    [insurance]   INT            NOT NULL,
    [remark]      NVARCHAR (255) CONSTRAINT [DF_insurance_remark] DEFAULT ('') NOT NULL,
    [modified_by] INT            NOT NULL,
    CONSTRAINT [PK_insurance] PRIMARY KEY CLUSTERED ([insurance] ASC),
    CONSTRAINT [FK_insurance_organisation_branch] FOREIGN KEY ([insurance]) REFERENCES [hr].[organisation_branch] ([organisation_branch]),
    CONSTRAINT [FK_insurance_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);

