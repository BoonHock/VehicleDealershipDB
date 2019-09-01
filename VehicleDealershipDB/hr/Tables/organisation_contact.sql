CREATE TABLE [hr].[organisation_contact] (
    [organisation] INT            NOT NULL,
    [contact]      NVARCHAR (100) NOT NULL,
    [remark]       NVARCHAR (100) CONSTRAINT [DF_organisation_contact_info_remark] DEFAULT ('') NOT NULL,
    [modified_by]  INT            NOT NULL,
    CONSTRAINT [PK_organisation_contact] PRIMARY KEY CLUSTERED ([organisation] ASC, [contact] ASC),
    CONSTRAINT [FK_organisation_contact_info_organisation] FOREIGN KEY ([organisation]) REFERENCES [hr].[organisation] ([organisation]),
    CONSTRAINT [FK_organisation_contact_info_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);

