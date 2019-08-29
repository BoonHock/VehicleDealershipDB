CREATE TABLE [dbsecurity].[user_usergroup] (
    [user]        INT           NOT NULL,
    [usergroup]   NVARCHAR (50) NOT NULL,
    [modified_by] INT           NOT NULL,
    CONSTRAINT [PK_user_usergroup] PRIMARY KEY CLUSTERED ([user] ASC, [usergroup] ASC),
    CONSTRAINT [FK_user_usergroup_user] FOREIGN KEY ([user]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_user_usergroup_user1] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_user_usergroup_usergroup] FOREIGN KEY ([usergroup]) REFERENCES [dbsecurity].[usergroup] ([usergroup]) ON DELETE CASCADE ON UPDATE CASCADE
);








GO
