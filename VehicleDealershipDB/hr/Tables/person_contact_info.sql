CREATE TABLE [hr].[person_contact_info] (
    [person_contact_info] INT            IDENTITY (1, 1) NOT NULL,
    [person]              INT            NOT NULL,
    [contact]             NVARCHAR (100) NOT NULL,
    [remark]              NVARCHAR (100) CONSTRAINT [DF_person_contact_info_remark] DEFAULT ('') NOT NULL,
    [modified_by]         INT            NOT NULL,
    CONSTRAINT [PK_person_contact_info_1] PRIMARY KEY CLUSTERED ([person_contact_info] ASC),
    CONSTRAINT [FK_person_contact_info_person] FOREIGN KEY ([person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_person_contact_info_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_person_contact_info] UNIQUE NONCLUSTERED ([person] ASC, [contact] ASC)
);

