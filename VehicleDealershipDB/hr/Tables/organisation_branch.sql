CREATE TABLE [hr].[organisation_branch] (
    [organisation_branch] INT            IDENTITY (1, 1) NOT NULL,
    [organisation]        INT            NOT NULL,
    [branch_name]         NVARCHAR (20)  NOT NULL,
    [address]             NVARCHAR (200) NOT NULL,
    [city]                NVARCHAR (15)  NOT NULL,
    [state]               NVARCHAR (15)  NOT NULL,
    [postcode]            NVARCHAR (10)  NOT NULL,
    [country]             SMALLINT       NOT NULL,
    [modified_by]         INT            NOT NULL,
    CONSTRAINT [PK_organisation_branch] PRIMARY KEY CLUSTERED ([organisation_branch] ASC),
    CONSTRAINT [FK_organisation_branch_country] FOREIGN KEY ([country]) REFERENCES [hr].[country] ([country]),
    CONSTRAINT [FK_organisation_branch_organisation] FOREIGN KEY ([organisation]) REFERENCES [hr].[organisation] ([organisation]),
    CONSTRAINT [FK_organisation_branch_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_organisation_branch] UNIQUE NONCLUSTERED ([organisation] ASC, [branch_name] ASC)
);

