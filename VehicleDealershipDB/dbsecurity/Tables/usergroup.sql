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
-- =============================================
-- Author:		hock
-- Create date: 13.7.2019
-- Description:	
-- =============================================
CREATE TRIGGER [dbsecurity].[trig_history_usergroup] 
   ON  [dbsecurity].[usergroup] 
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
INSERT INTO dbhistory.usergroup
(
	[usergroup],
	[usergroup_desc],
	[modified_by],
	[modified_on]
)
SELECT 
	usergroup,
	usergroup_desc,
	modified_by,
	SYSDATETIME()
FROM inserted


END