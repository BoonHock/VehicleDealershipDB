CREATE TABLE [hr].[loan] (
    [loan]        INT            NOT NULL,
    [remark]      NVARCHAR (255) CONSTRAINT [DF_loan_remark] DEFAULT ('') NOT NULL,
    [modified_by] INT            NOT NULL,
    CONSTRAINT [PK_loan] PRIMARY KEY CLUSTERED ([loan] ASC),
    CONSTRAINT [FK_loan_organisation_branch] FOREIGN KEY ([loan]) REFERENCES [hr].[organisation_branch] ([organisation_branch]),
    CONSTRAINT [FK_loan_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);



