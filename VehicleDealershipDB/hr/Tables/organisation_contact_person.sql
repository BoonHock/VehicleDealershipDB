CREATE TABLE [hr].[organisation_contact_person] (
    [organisation_contact_person] INT            IDENTITY (1, 1) NOT NULL,
    [organisation]                INT            NOT NULL,
    [name]                        NVARCHAR (150) NOT NULL,
    [email1]                      NVARCHAR (100) NOT NULL,
    [email2]                      NVARCHAR (100) NOT NULL,
    [phone1]                      NVARCHAR (20)  NOT NULL,
    [phone2]                      NVARCHAR (20)  NOT NULL,
    [modified_by]                 INT            NOT NULL,
    CONSTRAINT [PK_organisation_contact_person] PRIMARY KEY CLUSTERED ([organisation_contact_person] ASC),
    CONSTRAINT [FK_organisation_contact_person_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);




GO
-- =============================================
-- Author:		hock
-- Create date: 13.7.2019
-- Description:	
-- =============================================
CREATE TRIGGER [hr].[trig_history_organisation_contact_person] 
   ON  [hr].[organisation_contact_person] 
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO dbhistory.organisation_contact_person
(
	[organisation_contact_person]
	,[organisation]
	,[name]
	,[email1]
	,[email2]
	,[phone1]
	,[phone2]
	,[modified_by]
	,[modified_on]
)

SELECT
	[organisation_contact_person]
	,[organisation]
	,[name]
	,[email1]
	,[email2]
	,[phone1]
	,[phone2]
	,[modified_by]
	,SYSDATETIME()

FROM inserted


    -- Insert statements for trigger here

END