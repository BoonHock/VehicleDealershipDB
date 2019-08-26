CREATE TABLE [hr].[organisation] (
    [organisation]      INT            NOT NULL,
    [name]              NVARCHAR (150) NOT NULL,
    [registration_no]   NVARCHAR (30)  NOT NULL,
    [organisation_type] INT            NOT NULL,
    [branch]            NVARCHAR (20)  NOT NULL,
    [address]           NVARCHAR (255) NOT NULL,
    [city]              NVARCHAR (15)  NOT NULL,
    [state]             NVARCHAR (20)  NOT NULL,
    [postcode]          NVARCHAR (10)  NOT NULL,
    [country]           SMALLINT       NOT NULL,
    [modified_by]       INT            NOT NULL,
    CONSTRAINT [PK_business] PRIMARY KEY CLUSTERED ([organisation] ASC),
    CONSTRAINT [FK_business_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_organisation_country] FOREIGN KEY ([country]) REFERENCES [hr].[country] ([country]),
    CONSTRAINT [FK_organisation_organisation_type] FOREIGN KEY ([organisation_type]) REFERENCES [hr].[organisation_type] ([organisation_type]),
    CONSTRAINT [IX_business] UNIQUE NONCLUSTERED ([registration_no] ASC, [branch] ASC)
);






GO
-- =============================================
-- Author:		hock
-- Create date: 13.7.2019
-- Description:	
-- =============================================
CREATE TRIGGER [hr].[trig_history_organisation] 
   ON  [hr].[organisation] 
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
	,SYSDATETIME()

FROM inserted


    -- Insert statements for trigger here

END