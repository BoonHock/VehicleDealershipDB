CREATE TABLE [dbhistory].[usergroup_permission] (
    [usergroup]   NVARCHAR (50) NOT NULL,
    [permission]  NVARCHAR (50) NOT NULL,
    [modified_by] INT           NOT NULL,
    [modified_on] DATETIME2 (0) CONSTRAINT [DF_usergroup_permission_modified_on] DEFAULT (sysdatetime()) NOT NULL
);

