CREATE TABLE [fin].[insurance_category] (
    [insurance_category] INT           IDENTITY (1, 1) NOT NULL,
    [description]        NVARCHAR (50) NOT NULL,
    [modified_by]        INT           NOT NULL,
    CONSTRAINT [PK_insurance_category] PRIMARY KEY CLUSTERED ([insurance_category] ASC),
    CONSTRAINT [FK_insurance_category_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);

