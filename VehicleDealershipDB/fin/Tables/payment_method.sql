CREATE TABLE [fin].[payment_method] (
    [payment_method]             INT           IDENTITY (1, 1) NOT NULL,
    [payment_method_description] NVARCHAR (20) NOT NULL,
    [modified_by]                INT           NOT NULL,
    CONSTRAINT [PK_payment_method] PRIMARY KEY CLUSTERED ([payment_method] ASC),
    CONSTRAINT [FK_payment_method_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_payment_method] UNIQUE NONCLUSTERED ([payment_method_description] ASC)
);

