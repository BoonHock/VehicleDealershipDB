CREATE TABLE [fin].[credit_card] (
    [credit_card]    INT           IDENTITY (1, 1) NOT NULL,
    [credit_card_no] NVARCHAR (20) NOT NULL,
    [finance]        INT           NOT NULL,
    [expiry_date]    DATE          NOT NULL,
    [person]         INT           NULL,
    [organisation]   INT           NULL,
    [modified_by]    INT           NOT NULL,
    CONSTRAINT [PK_credit_card] PRIMARY KEY CLUSTERED ([credit_card] ASC),
    CONSTRAINT [CK_credit_card] CHECK ([person] IS NULL AND [organisation] IS NOT NULL OR [person] IS NOT NULL AND [organisation] IS NULL),
    CONSTRAINT [FK_credit_card_finance] FOREIGN KEY ([finance]) REFERENCES [hr].[finance] ([finance]),
    CONSTRAINT [FK_credit_card_organisation] FOREIGN KEY ([organisation]) REFERENCES [hr].[organisation] ([organisation]),
    CONSTRAINT [FK_credit_card_person] FOREIGN KEY ([person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_credit_card_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);





