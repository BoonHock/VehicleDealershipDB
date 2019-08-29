CREATE TABLE [dbsecurity].[user] (
    [user]       INT             IDENTITY (1, 1) NOT NULL,
    [username]   VARCHAR (50)    NOT NULL,
    [name]       NVARCHAR (200)  NOT NULL,
    [password]   NVARCHAR (MAX)  NOT NULL,
    [ic_no]      VARCHAR (50)    NOT NULL,
    [is_active]  BIT             CONSTRAINT [DF_user_Is_activated] DEFAULT ((1)) NOT NULL,
    [join_date]  DATE            CONSTRAINT [DF_user_Join_date] DEFAULT (sysdatetime()) NOT NULL,
    [leave_date] DATE            CONSTRAINT [DF_user_Leave_date] DEFAULT (NULL) NULL,
    [image]      VARBINARY (MAX) CONSTRAINT [DF_user_Photo] DEFAULT (NULL) NULL,
    [modifed_by] INT             NULL,
    CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED ([user] ASC),
    CONSTRAINT [FK_user_user] FOREIGN KEY ([modifed_by]) REFERENCES [dbsecurity].[user] ([user])
);








GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_user]
    ON [dbsecurity].[user]([username] ASC);


GO

