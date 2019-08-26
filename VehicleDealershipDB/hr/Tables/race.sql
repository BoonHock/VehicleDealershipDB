CREATE TABLE [hr].[race] (
    [race]             INT           IDENTITY (1, 1) NOT NULL,
    [race_description] NVARCHAR (50) NOT NULL,
    [modified_by]      INT           CONSTRAINT [DF_race_modified_by] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_race] PRIMARY KEY CLUSTERED ([race] ASC),
    CONSTRAINT [FK_race_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);






GO
