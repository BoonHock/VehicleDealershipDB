CREATE TABLE [fin].[payment_cheque] (
    [cheque]      NVARCHAR (20) NOT NULL,
    [payment]     INT           NOT NULL,
    [cheque_date] DATE          NOT NULL,
    [finance]     INT           NOT NULL,
    [modified_by] INT           NOT NULL,
    CONSTRAINT [PK_payment_cheque] PRIMARY KEY CLUSTERED ([cheque] ASC),
    CONSTRAINT [FK_payment_cheque_finance] FOREIGN KEY ([finance]) REFERENCES [hr].[finance] ([finance]),
    CONSTRAINT [FK_payment_cheque_payment] FOREIGN KEY ([payment]) REFERENCES [fin].[payment] ([payment]),
    CONSTRAINT [FK_payment_cheque_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);

