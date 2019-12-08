CREATE TABLE [fin].[document_prefix] (
    [document_prefix]      NVARCHAR (100) NOT NULL,
    [document_prefix_text] NVARCHAR (5)   NOT NULL,
    [modified_by]          INT            NOT NULL,
    [modified_on]          DATETIME2 (0)  CONSTRAINT [DF_document_prefix_modified_on] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_document_prefix] PRIMARY KEY CLUSTERED ([document_prefix] ASC),
    CONSTRAINT [FK_document_prefix_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);



