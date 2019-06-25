CREATE TABLE [dbsecurity].[usergroup_permission] (
    [usergroup]  VARCHAR (50) NOT NULL,
    [permission] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_usergroup_permission] PRIMARY KEY CLUSTERED ([usergroup] ASC, [permission] ASC),
    CONSTRAINT [FK_usergroup_permission_permission] FOREIGN KEY ([permission]) REFERENCES [dbsecurity].[permission] ([permission]),
    CONSTRAINT [FK_usergroup_permission_usergroup] FOREIGN KEY ([usergroup]) REFERENCES [dbsecurity].[usergroup] ([usergroup]) ON DELETE CASCADE ON UPDATE CASCADE
);

