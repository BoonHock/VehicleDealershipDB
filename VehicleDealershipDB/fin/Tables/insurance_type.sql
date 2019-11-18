CREATE TABLE [fin].[insurance_type] (
    [insurance_type] INT           IDENTITY (1, 1) NOT NULL,
    [description]    NVARCHAR (50) NOT NULL,
    [modified_by]    INT           NOT NULL,
    CONSTRAINT [PK_insurance_type] PRIMARY KEY CLUSTERED ([insurance_type] ASC),
    CONSTRAINT [FK_insurance_type_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);

