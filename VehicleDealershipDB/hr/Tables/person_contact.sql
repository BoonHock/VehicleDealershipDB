CREATE TABLE [hr].[person_contact] (
    [person]      INT            NOT NULL,
    [contact]     NVARCHAR (100) NOT NULL,
    [remark]      NVARCHAR (100) CONSTRAINT [DF_person_contact_remark] DEFAULT ('') NOT NULL,
    [modified_by] INT            NOT NULL,
    CONSTRAINT [PK_person_contact] PRIMARY KEY CLUSTERED ([person] ASC, [contact] ASC),
    CONSTRAINT [FK_person_contact_person] FOREIGN KEY ([person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_person_contact_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);

