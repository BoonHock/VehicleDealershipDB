CREATE TABLE [dbsecurity].[filepath] (
    [filepath]     NVARCHAR (20)  NOT NULL,
    [filepath_dir] NVARCHAR (200) NOT NULL,
    [modified_by]  INT            NOT NULL,
    CONSTRAINT [PK_filepath] PRIMARY KEY CLUSTERED ([filepath] ASC),
    CONSTRAINT [FK_filepath_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);

