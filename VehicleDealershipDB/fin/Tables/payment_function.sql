CREATE TABLE [fin].[payment_function] (
    [payment_function] INT           IDENTITY (1, 1) NOT NULL,
    [description]      NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_payment_function] PRIMARY KEY CLUSTERED ([payment_function] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'to describe what a payment is for. this table is designed for back end use only. not going to let users add/edit record', @level0type = N'SCHEMA', @level0name = N'fin', @level1type = N'TABLE', @level1name = N'payment_function';

