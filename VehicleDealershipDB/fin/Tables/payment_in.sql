CREATE TABLE [fin].[payment_in] (
    [payment_in]          INT             IDENTITY (1, 1) NOT NULL,
    [prefix]              NVARCHAR (5)    NOT NULL,
    [payment_no]          AS              ([prefix]+CONVERT([nvarchar],[payment_in])),
    [payment_description] NVARCHAR (50)   NOT NULL,
    [payment_date]        DATE            NOT NULL,
    [amount]              DECIMAL (18, 4) NOT NULL,
    [cheque]              INT             NULL,
    [credit_card]         INT             NULL,
    [payment_method]      INT             CONSTRAINT [DF_payment_in_payment_method] DEFAULT (NULL) NULL,
    [is_paid]             BIT             CONSTRAINT [DF_payment_in_is_paid] DEFAULT ((1)) NOT NULL,
    [remark]              NVARCHAR (255)  CONSTRAINT [DF_payment_in_remark] DEFAULT ('') NOT NULL,
    [modified_by]         INT             NOT NULL,
    CONSTRAINT [PK_payment_in] PRIMARY KEY CLUSTERED ([payment_in] ASC),
    CONSTRAINT [CK_payment_in] CHECK ([cheque] IS NULL AND [credit_card] IS NULL AND [payment_method] IS NOT NULL OR [cheque] IS NULL AND [credit_card] IS NOT NULL AND [payment_method] IS NULL OR [cheque] IS NOT NULL AND [credit_card] IS NULL AND [payment_method] IS NULL),
    CONSTRAINT [FK_payment_in_cheque] FOREIGN KEY ([cheque]) REFERENCES [fin].[cheque] ([cheque]),
    CONSTRAINT [FK_payment_in_credit_card] FOREIGN KEY ([credit_card]) REFERENCES [fin].[credit_card] ([credit_card]),
    CONSTRAINT [FK_payment_in_payment_method] FOREIGN KEY ([payment_method]) REFERENCES [fin].[payment_method] ([payment_method]),
    CONSTRAINT [FK_payment_in_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);

