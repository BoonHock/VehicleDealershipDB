CREATE TABLE [fin].[credit_card_type] (
    [credit_card_type] INT           IDENTITY (1, 1) NOT NULL,
    [type_name]        NVARCHAR (20) NOT NULL,
    [modified_by]      INT           NOT NULL,
    CONSTRAINT [PK_credit_card_type] PRIMARY KEY CLUSTERED ([credit_card_type] ASC),
    CONSTRAINT [FK_card_issuer_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);

