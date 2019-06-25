CREATE TABLE [dbsecurity].[usergroup] (
    [usergroup]      VARCHAR (50)  NOT NULL,
    [usergroup_desc] VARCHAR (150) NOT NULL,
    CONSTRAINT [PK_usergroup] PRIMARY KEY CLUSTERED ([usergroup] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_usergroup]
    ON [dbsecurity].[usergroup]([usergroup] ASC);

