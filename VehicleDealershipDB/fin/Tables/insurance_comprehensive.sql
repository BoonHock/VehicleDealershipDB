CREATE TABLE [fin].[insurance_comprehensive] (
    [insurance_comprehensive] INT           IDENTITY (1, 1) NOT NULL,
    [title]                   NVARCHAR (20) NOT NULL,
    [modified_by]             INT           NOT NULL,
    CONSTRAINT [PK_cc_comprehensive] PRIMARY KEY CLUSTERED ([insurance_comprehensive] ASC),
    CONSTRAINT [FK_insurance_comprehensive_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_insurance_comprehensive] UNIQUE NONCLUSTERED ([title] ASC)
);

