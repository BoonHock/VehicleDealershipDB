CREATE TABLE [dbhistory].[organisation_contact_person] (
    [organisation_contact_person] INT            NOT NULL,
    [organisation]                INT            NOT NULL,
    [name]                        NVARCHAR (150) NOT NULL,
    [email1]                      NVARCHAR (100) NOT NULL,
    [email2]                      NVARCHAR (100) NOT NULL,
    [phone1]                      NVARCHAR (20)  NOT NULL,
    [phone2]                      NVARCHAR (20)  NOT NULL,
    [modified_by]                 INT            NOT NULL,
    [modified_on]                 DATETIME2 (0)  CONSTRAINT [DF_organisation_contact_person_modified_on] DEFAULT (sysdatetime()) NOT NULL
);

