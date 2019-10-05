CREATE TABLE [fin].[credit_card] (
    [credit_card]      INT           IDENTITY (1, 1) NOT NULL,
    [credit_card_no]   NVARCHAR (20) NOT NULL,
    [credit_card_type] INT           NOT NULL,
    [finance]          INT           NOT NULL,
    [expiry_date]      DATE          NOT NULL,
    [modified_by]      INT           NOT NULL,
    CONSTRAINT [PK_credit_card] PRIMARY KEY CLUSTERED ([credit_card] ASC),
    CONSTRAINT [FK_credit_card_credit_card_type] FOREIGN KEY ([credit_card_type]) REFERENCES [fin].[credit_card_type] ([credit_card_type]),
    CONSTRAINT [FK_credit_card_finance] FOREIGN KEY ([finance]) REFERENCES [hr].[finance] ([finance]),
    CONSTRAINT [FK_credit_card_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_credit_card] UNIQUE NONCLUSTERED ([credit_card_no] ASC)
);







