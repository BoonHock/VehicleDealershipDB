CREATE TABLE [misc].[color] (
    [color]       INT             IDENTITY (1, 1) NOT NULL,
    [color_desc]  NVARCHAR (50)   NOT NULL,
    [img_sample]  VARBINARY (MAX) CONSTRAINT [DF_color_img_sample] DEFAULT (NULL) NULL,
    [modified_by] INT             NOT NULL,
    [modified_on] DATETIME2 (0)   CONSTRAINT [DF_color_modified_on] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_color] PRIMARY KEY CLUSTERED ([color] ASC),
    CONSTRAINT [FK_color_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_color] UNIQUE NONCLUSTERED ([color_desc] ASC)
);


GO
-- =============================================
-- Author:		hock
-- Create date: 13.7.2019
-- Description:	
-- =============================================
CREATE TRIGGER misc.[trig_history_color] 
   ON  misc.color
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO dbhistory.color
(
	[color]
	,[color_desc]
	,[img_sample]
	,[modified_by]
	,[modified_on]
)

SELECT
	[color]
	,[color_desc]
	,[img_sample]
	,[modified_by]
	,[modified_on]

FROM inserted


    -- Insert statements for trigger here

END