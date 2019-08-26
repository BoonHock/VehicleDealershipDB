CREATE TABLE [hr].[finance] (
    [finance]      INT NOT NULL,
    [organisation] INT NOT NULL,
    CONSTRAINT [PK_finance] PRIMARY KEY CLUSTERED ([finance] ASC),
    CONSTRAINT [FK_finance_organisation] FOREIGN KEY ([finance]) REFERENCES [hr].[organisation] ([organisation])
);

