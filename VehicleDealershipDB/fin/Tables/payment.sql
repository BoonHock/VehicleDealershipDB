CREATE TABLE [fin].[payment] (
    [payment]             INT             IDENTITY (1, 1) NOT NULL,
    [payment_description] NVARCHAR (50)   NOT NULL,
    [payment_date]        DATE            NOT NULL,
    [amount]              DECIMAL (18, 4) NOT NULL,
    [cheque]              INT             NULL,
    [credit_card]         INT             NULL,
    [payment_method]      INT             CONSTRAINT [DF_payment_payment_method] DEFAULT (NULL) NULL,
    [payment_made]        BIT             CONSTRAINT [DF_payment_payment_made] DEFAULT ((1)) NOT NULL,
    [pay_to_person]       INT             NULL,
    [pay_to_organisation] INT             NULL,
    [remark]              NVARCHAR (255)  CONSTRAINT [DF_payment_remark] DEFAULT ('') NOT NULL,
    [modified_by]         INT             NOT NULL,
    CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED ([payment] ASC),
    CONSTRAINT [CK_payment] CHECK ([pay_to_person] IS NULL AND [pay_to_organisation] IS NOT NULL OR [pay_to_person] IS NOT NULL AND [pay_to_organisation] IS NULL),
    CONSTRAINT [CK_payment_1] CHECK ([cheque] IS NULL AND [credit_card] IS NULL AND [payment_method] IS NOT NULL OR [cheque] IS NULL AND [credit_card] IS NOT NULL AND [payment_method] IS NULL OR [cheque] IS NOT NULL AND [credit_card] IS NULL AND [payment_method] IS NULL),
    CONSTRAINT [FK_payment_cheque] FOREIGN KEY ([cheque]) REFERENCES [fin].[cheque] ([cheque]),
    CONSTRAINT [FK_payment_credit_card] FOREIGN KEY ([credit_card]) REFERENCES [fin].[credit_card] ([credit_card]),
    CONSTRAINT [FK_payment_organisation] FOREIGN KEY ([pay_to_organisation]) REFERENCES [hr].[organisation] ([organisation]),
    CONSTRAINT [FK_payment_payment_method] FOREIGN KEY ([payment_method]) REFERENCES [fin].[payment_method] ([payment_method]),
    CONSTRAINT [FK_payment_person] FOREIGN KEY ([pay_to_person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_payment_user1] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);





