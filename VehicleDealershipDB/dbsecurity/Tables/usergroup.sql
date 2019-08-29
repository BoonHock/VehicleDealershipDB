CREATE TABLE [dbsecurity].[usergroup] (
    [usergroup]      NVARCHAR (50)  NOT NULL,
    [usergroup_desc] NVARCHAR (150) NOT NULL,
    [modified_by]    INT            CONSTRAINT [DF_usergroup_modified_by] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_usergroup] PRIMARY KEY CLUSTERED ([usergroup] ASC),
    CONSTRAINT [FK_usergroup_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);










GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_usergroup]
    ON [dbsecurity].[usergroup]([usergroup] ASC);


GO
