CREATE TABLE [hr].[race] (
    [race]        INT           IDENTITY (1, 1) NOT NULL,
    [race_desc]   NVARCHAR (50) NOT NULL,
    [modified_by] INT           CONSTRAINT [DF_race_modified_by] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_race] PRIMARY KEY CLUSTERED ([race] ASC),
    CONSTRAINT [FK_race_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);




GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [hr].[trig_history_race] 
   ON  [hr].[race] 
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
INSERT INTO dbhistory.race
(
	[race]
	,[race_desc]
	,[modified_by]
	,[modified_on]
)
SELECT 
	[race]
	,[race_desc]
	,[modified_by]
	,SYSDATETIME()
FROM inserted

END