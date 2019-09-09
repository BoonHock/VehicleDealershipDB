CREATE TABLE [fin].[payment] (
    [payment]        INT             IDENTITY (1, 1) NOT NULL,
    [payment_date]   DATE            NOT NULL,
    [amount]         DECIMAL (18, 4) NOT NULL,
    [payment_method] INT             CONSTRAINT [DF_payment_payment_method] DEFAULT (NULL) NULL,
    [payment_made]   BIT             CONSTRAINT [DF_payment_payment_made] DEFAULT ((1)) NOT NULL,
    [remark]         NVARCHAR (100)  CONSTRAINT [DF_payment_remark] DEFAULT ('') NOT NULL,
    [modified_by]    INT             NOT NULL,
    CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED ([payment] ASC),
    CONSTRAINT [FK_payment_payment_method] FOREIGN KEY ([payment_method]) REFERENCES [fin].[payment_method] ([payment_method]),
    CONSTRAINT [FK_payment_user1] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);

