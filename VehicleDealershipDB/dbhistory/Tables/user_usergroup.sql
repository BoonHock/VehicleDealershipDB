CREATE TABLE [dbhistory].[user_usergroup] (
    [user]        INT           NOT NULL,
    [usergroup]   NVARCHAR (50) NOT NULL,
    [modified_by] INT           NOT NULL,
    [modified_on] DATETIME2 (0) CONSTRAINT [DF_user_usergroup_modified_on] DEFAULT (sysdatetime()) NOT NULL
);

