CREATE TABLE [dbhistory].[user] (
    [user]         INT             NOT NULL,
    [username]     VARCHAR (50)    NOT NULL,
    [name]         NVARCHAR (200)  NOT NULL,
    [password]     NVARCHAR (MAX)  NOT NULL,
    [ic_no]        VARCHAR (50)    NOT NULL,
    [is_active]    BIT             CONSTRAINT [DF_user_is_activated] DEFAULT ((1)) NOT NULL,
    [join_date]    DATE            CONSTRAINT [DF_user_join_date] DEFAULT (sysdatetime()) NOT NULL,
    [leave_date]   DATE            CONSTRAINT [DF_user_leave_date] DEFAULT (NULL) NULL,
    [photo]        VARBINARY (MAX) CONSTRAINT [DF_user_photo] DEFAULT (NULL) NULL,
    [performed_by] INT             NULL,
    [performed_on] DATETIME2 (0)   CONSTRAINT [DF_user_modified_on] DEFAULT (sysdatetime()) NOT NULL
);

