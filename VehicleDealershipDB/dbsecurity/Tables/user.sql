CREATE TABLE [dbsecurity].[user] (
    [user]        INT             IDENTITY (1, 1) NOT NULL,
    [username]    VARCHAR (50)    NOT NULL,
    [name]        NVARCHAR (200)  NOT NULL,
    [password]    NVARCHAR (MAX)  NOT NULL,
    [ic_no]       VARCHAR (50)    NOT NULL,
    [is_active]   BIT             CONSTRAINT [DF_user_Is_activated] DEFAULT ((1)) NOT NULL,
    [join_date]   DATE            CONSTRAINT [DF_user_Join_date] DEFAULT (sysdatetime()) NOT NULL,
    [leave_date]  DATE            CONSTRAINT [DF_user_Leave_date] DEFAULT (NULL) NULL,
    [photo]       VARBINARY (MAX) CONSTRAINT [DF_user_Photo] DEFAULT (NULL) NULL,
    [modifed_by]  INT             NULL,
    [modified_on] DATETIME2 (0)   CONSTRAINT [DF_user_modified_on] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED ([user] ASC),
    CONSTRAINT [FK_user_user] FOREIGN KEY ([modifed_by]) REFERENCES [dbsecurity].[user] ([user])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_user]
    ON [dbsecurity].[user]([username] ASC);


GO
-- =============================================
-- Author:		hock
-- Create date: 12.6.2019
-- Description:	history
-- =============================================
CREATE TRIGGER [dbsecurity].[trig_history_user] 
   ON  dbsecurity.[user] 
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
INSERT INTO [dbhistory].[user]
(
	[user]
	,[username]
	,[name]
	,[password]
	,[ic_no]
	,[is_active]
	,[join_date]
	,[leave_date]
	,[photo]
	,[performed_by]
	,[performed_on]
)
SELECT 
	[user]
	,[username]
	,[name]
	,[password]
	,[ic_no]
	,[is_active]
	,[join_date]
	,[leave_date]
	,[photo]
	,[modifed_by]
	,SYSDATETIME()
FROM inserted


END
