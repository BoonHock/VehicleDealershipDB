CREATE TABLE [dbsecurity].[user_usergroup] (
    [user]      INT          NOT NULL,
    [usergroup] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_user_usergroup_1] PRIMARY KEY CLUSTERED ([user] ASC),
    CONSTRAINT [FK_user_usergroup_user] FOREIGN KEY ([user]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_user_usergroup_usergroup] FOREIGN KEY ([usergroup]) REFERENCES [dbsecurity].[usergroup] ([usergroup]) ON DELETE CASCADE ON UPDATE CASCADE
);

