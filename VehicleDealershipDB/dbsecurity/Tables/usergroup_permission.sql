CREATE TABLE [dbsecurity].[usergroup_permission] (
    [usergroup]   NVARCHAR (50) NOT NULL,
    [permission]  NVARCHAR (50) NOT NULL,
    [modified_by] INT           NOT NULL,
    [modified_on] DATETIME2 (0) CONSTRAINT [DF_usergroup_permission_modified_on] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_usergroup_permission] PRIMARY KEY CLUSTERED ([usergroup] ASC, [permission] ASC),
    CONSTRAINT [FK_usergroup_permission_permission] FOREIGN KEY ([permission]) REFERENCES [dbsecurity].[permission] ([permission]),
    CONSTRAINT [FK_usergroup_permission_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_usergroup_permission_usergroup] FOREIGN KEY ([usergroup]) REFERENCES [dbsecurity].[usergroup] ([usergroup]) ON DELETE CASCADE ON UPDATE CASCADE
);




GO
-- =============================================
-- Author:		hock
-- Create date: 13.7.2019
-- Description:	
-- =============================================
CREATE TRIGGER [dbsecurity].[trig_history_usergroup_permission] 
   ON  [dbsecurity].usergroup_permission 
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO dbhistory.usergroup_permission
(
	[usergroup],
	[permission],
	[modified_by],
	[modified_on]
)

SELECT
	[usergroup],
	[permission],
	[modified_by],
	[modified_on]

FROM inserted


    -- Insert statements for trigger here

END