CREATE TABLE [hr].[organisation] (
    [organisation]    INT            IDENTITY (1, 1) NOT NULL,
    [name]            NVARCHAR (150) NOT NULL,
    [registration_no] NVARCHAR (30)  NOT NULL,
    [person_org_type] INT            NOT NULL,
    [branch]          NVARCHAR (20)  NOT NULL,
    [address]         NVARCHAR (255) NOT NULL,
    [city]            NVARCHAR (15)  NOT NULL,
    [state]           NVARCHAR (20)  NOT NULL,
    [postcode]        NVARCHAR (10)  NOT NULL,
    [country]         NVARCHAR (2)   NOT NULL,
    [phone1]          NVARCHAR (20)  NOT NULL,
    [phone2]          NVARCHAR (20)  NOT NULL,
    [phone3]          NVARCHAR (20)  NOT NULL,
    [email1]          NVARCHAR (100) NOT NULL,
    [email2]          NVARCHAR (100) NOT NULL,
    [email3]          NVARCHAR (100) NOT NULL,
    [url]             NVARCHAR (255) NOT NULL,
    [fax1]            NVARCHAR (50)  NOT NULL,
    [fax2]            NVARCHAR (50)  NOT NULL,
    [remarks]         NVARCHAR (255) NOT NULL,
    [modified_by]     INT            NOT NULL,
    [modified_on]     DATETIME2 (0)  CONSTRAINT [DF_business_created_datetime] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_business] PRIMARY KEY CLUSTERED ([organisation] ASC),
    CONSTRAINT [FK_business_country] FOREIGN KEY ([country]) REFERENCES [hr].[country] ([country]),
    CONSTRAINT [FK_business_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_organisation_person_org_type] FOREIGN KEY ([person_org_type]) REFERENCES [hr].[person_org_type] ([person_org_type]),
    CONSTRAINT [IX_business] UNIQUE NONCLUSTERED ([registration_no] ASC)
);


GO
-- =============================================
-- Author:		hock
-- Create date: 13.7.2019
-- Description:	
-- =============================================
CREATE TRIGGER [hr].[trig_history_organisation] 
   ON  [hr].organisation 
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO dbhistory.organisation
(
	[organisation]
	,[name]
	,[registration_no]
	,[person_org_type]
	,[branch]
	,[address]
	,[city]
	,[state]
	,[postcode]
	,[country]
	,[phone1]
	,[phone2]
	,[phone3]
	,[email1]
	,[email2]
	,[email3]
	,[url]
	,[fax1]
	,[fax2]
	,[remarks]
	,[modified_by]
	,[modified_on]
)

SELECT
	[organisation]
	,[name]
	,[registration_no]
	,[person_org_type]
	,[branch]
	,[address]
	,[city]
	,[state]
	,[postcode]
	,[country]
	,[phone1]
	,[phone2]
	,[phone3]
	,[email1]
	,[email2]
	,[email3]
	,[url]
	,[fax1]
	,[fax2]
	,[remarks]
	,[modified_by]
	,[modified_on]

FROM inserted


    -- Insert statements for trigger here

END