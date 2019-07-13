CREATE TABLE [hr].[person] (
    [person]          INT             IDENTITY (1, 1) NOT NULL,
    [name]            NVARCHAR (100)  NOT NULL,
    [ic_no]           NVARCHAR (50)   NOT NULL,
    [image]           VARBINARY (MAX) NULL,
    [person_org_type] INT             CONSTRAINT [DF_person_person_org_type] DEFAULT (NULL) NOT NULL,
    [driving_license] NVARCHAR (15)   NOT NULL,
    [gender]          BIT             NOT NULL,
    [race]            INT             NOT NULL,
    [address]         NVARCHAR (255)  NOT NULL,
    [city]            NVARCHAR (15)   NOT NULL,
    [state]           NVARCHAR (20)   NOT NULL,
    [postcode]        NVARCHAR (10)   NOT NULL,
    [country]         NVARCHAR (2)    NOT NULL,
    [phone1]          NVARCHAR (20)   NOT NULL,
    [phone2]          NVARCHAR (20)   NOT NULL,
    [email1]          NVARCHAR (100)  NOT NULL,
    [email2]          NVARCHAR (100)  NOT NULL,
    [occupation]      NVARCHAR (50)   NOT NULL,
    [company]         INT             NOT NULL,
    [remarks]         NVARCHAR (255)  NOT NULL,
    [modified_by]     INT             NOT NULL,
    [modified_on]     DATETIME2 (0)   CONSTRAINT [DF_person_modified_on] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_people] PRIMARY KEY CLUSTERED ([person] ASC),
    CONSTRAINT [FK_people_company] FOREIGN KEY ([company]) REFERENCES [hr].[organisation] ([organisation]),
    CONSTRAINT [FK_people_country] FOREIGN KEY ([country]) REFERENCES [hr].[country] ([country]),
    CONSTRAINT [FK_person_person_org_type] FOREIGN KEY ([person_org_type]) REFERENCES [hr].[person_org_type] ([person_org_type]),
    CONSTRAINT [FK_person_race] FOREIGN KEY ([race]) REFERENCES [hr].[race] ([race]),
    CONSTRAINT [FK_person_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_people] UNIQUE NONCLUSTERED ([ic_no] ASC)
);




GO
-- =============================================
-- Author:		hock
-- Create date: 13.7.2019
-- Description:	
-- =============================================
CREATE TRIGGER [hr].[trig_history_person] 
   ON  [hr].person 
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO dbhistory.person
(
	[person]
	,[name]
	,[ic_no]
	,[image]
	,[person_org_type]
	,[driving_license]
	,[gender]
	,[race]
	,[address]
	,[city]
	,[state]
	,[postcode]
	,[country]
	,[phone1]
	,[phone2]
	,[email1]
	,[email2]
	,[occupation]
	,[company]
	,[remarks]
	,[modified_by]
	,[modified_on]
)

SELECT
	[person]
	,[name]
	,[ic_no]
	,[image]
	,[person_org_type]
	,[driving_license]
	,[gender]
	,[race]
	,[address]
	,[city]
	,[state]
	,[postcode]
	,[country]
	,[phone1]
	,[phone2]
	,[email1]
	,[email2]
	,[occupation]
	,[company]
	,[remarks]
	,[modified_by]
	,[modified_on]

FROM inserted


    -- Insert statements for trigger here

END
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'1 for male, 0 for female', @level0type = N'SCHEMA', @level0name = N'hr', @level1type = N'TABLE', @level1name = N'person', @level2type = N'COLUMN', @level2name = N'gender';

