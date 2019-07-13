CREATE TABLE [dbhistory].[person] (
    [person]          INT             NOT NULL,
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
    [modified_on]     DATETIME2 (0)   CONSTRAINT [DF_person_modified_on] DEFAULT (sysdatetime()) NOT NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'1 for male, 0 for female', @level0type = N'SCHEMA', @level0name = N'dbhistory', @level1type = N'TABLE', @level1name = N'person', @level2type = N'COLUMN', @level2name = N'gender';

