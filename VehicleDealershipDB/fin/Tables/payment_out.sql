CREATE TABLE [fin].[payment_out] (
    [payment_out]         INT             IDENTITY (1, 1) NOT NULL,
    [payment_no_prefix]   NVARCHAR (5)    NOT NULL,
    [payment_no]          AS              ([payment_no_prefix]+CONVERT([nvarchar],[payment_out])),
    [payment_description] NVARCHAR (50)   NOT NULL,
    [payment_date]        DATE            NOT NULL,
    [amount]              DECIMAL (18, 4) NOT NULL,
    [cheque]              INT             NULL,
    [credit_card]         INT             NULL,
    [payment_method]      INT             CONSTRAINT [DF_payment_payment_method] DEFAULT (NULL) NULL,
    [is_paid]             BIT             CONSTRAINT [DF_payment_payment_made] DEFAULT ((1)) NOT NULL,
    [pay_to_person]       INT             NULL,
    [pay_to_organisation] INT             NULL,
    [remark]              NVARCHAR (255)  CONSTRAINT [DF_payment_remark] DEFAULT ('') NOT NULL,
    [modified_by]         INT             NOT NULL,
    CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED ([payment_out] ASC),
    CONSTRAINT [CK_payment] CHECK ([pay_to_person] IS NULL OR [pay_to_organisation] IS NULL),
    CONSTRAINT [CK_payment_1] CHECK ([cheque] IS NULL AND [credit_card] IS NULL AND [payment_method] IS NOT NULL OR [cheque] IS NULL AND [credit_card] IS NOT NULL AND [payment_method] IS NULL OR [cheque] IS NOT NULL AND [credit_card] IS NULL AND [payment_method] IS NULL),
    CONSTRAINT [FK_payment_cheque] FOREIGN KEY ([cheque]) REFERENCES [fin].[cheque] ([cheque]),
    CONSTRAINT [FK_payment_credit_card] FOREIGN KEY ([credit_card]) REFERENCES [fin].[credit_card] ([credit_card]),
    CONSTRAINT [FK_payment_organisation] FOREIGN KEY ([pay_to_organisation]) REFERENCES [hr].[organisation] ([organisation]),
    CONSTRAINT [FK_payment_payment_method] FOREIGN KEY ([payment_method]) REFERENCES [fin].[payment_method] ([payment_method]),
    CONSTRAINT [FK_payment_person] FOREIGN KEY ([pay_to_person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_payment_user1] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_payment] UNIQUE NONCLUSTERED ([payment_no] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'scenario 1
pay to person is null and pay to org is not null - payment to org

scenario 2
pay to person is not null and pay to org is null - payment to person

scenario 3
pay to person and pay to org are null - payment received', @level0type = N'SCHEMA', @level0name = N'fin', @level1type = N'TABLE', @level1name = N'payment_out', @level2type = N'CONSTRAINT', @level2name = N'CK_payment';

