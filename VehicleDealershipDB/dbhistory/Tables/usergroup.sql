CREATE TABLE [dbhistory].[usergroup] (
    [usergroup]      NVARCHAR (50)  NOT NULL,
    [usergroup_desc] NVARCHAR (150) NOT NULL,
    [modified_by]    INT            CONSTRAINT [DF_usergroup_modified_by] DEFAULT ((1)) NOT NULL,
    [modified_on]    DATETIME2 (0)  CONSTRAINT [DF_usergroup_modified_on] DEFAULT (sysdatetime()) NOT NULL
);

