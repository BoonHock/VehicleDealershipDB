CREATE TABLE [fin].[cheque] (
    [cheque]      INT           IDENTITY (1, 1) NOT NULL,
    [cheque_no]   NVARCHAR (20) NOT NULL,
    [cheque_date] DATE          NOT NULL,
    [finance]     INT           NOT NULL,
    [modified_by] INT           NOT NULL,
    CONSTRAINT [PK_payment_cheque_1] PRIMARY KEY CLUSTERED ([cheque] ASC),
    CONSTRAINT [IX_cheque] UNIQUE NONCLUSTERED ([cheque_no] ASC)
);



