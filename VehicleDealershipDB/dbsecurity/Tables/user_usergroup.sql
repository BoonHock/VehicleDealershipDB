CREATE TABLE [dbsecurity].[user_usergroup] (
    [user]        INT           NOT NULL,
    [usergroup]   NVARCHAR (50) NOT NULL,
    [modified_by] INT           NOT NULL,
    [modified_on] DATETIME2 (0) CONSTRAINT [DF_user_usergroup_modified_on] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_user_usergroup] PRIMARY KEY CLUSTERED ([user] ASC, [usergroup] ASC),
    CONSTRAINT [FK_user_usergroup_user] FOREIGN KEY ([user]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_user_usergroup_user1] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_user_usergroup_usergroup] FOREIGN KEY ([usergroup]) REFERENCES [dbsecurity].[usergroup] ([usergroup]) ON DELETE CASCADE ON UPDATE CASCADE
);




GO
-- =============================================
-- Author:		hock
-- Create date: 13.7.2019
-- Description:	
-- =============================================
CREATE TRIGGER [dbsecurity].[trig_history_user_usergroup] 
   ON  [dbsecurity].user_usergroup 
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO dbhistory.user_usergroup
(
	[user],
	[usergroup],
	[modified_by],
	[modified_on]
)

SELECT
	[user],
	[usergroup],
	[modified_by],
	[modified_on]

FROM inserted


    -- Insert statements for trigger here

END