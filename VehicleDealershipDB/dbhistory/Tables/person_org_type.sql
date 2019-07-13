CREATE TABLE [dbhistory].[person_org_type] (
    [person_org_type] INT           NOT NULL,
    [person_org_desc] NVARCHAR (50) NOT NULL,
    [modified_by]     INT           NOT NULL,
    [modified_on]     DATETIME2 (0) CONSTRAINT [DF_person_org_type_modified_on] DEFAULT (sysdatetime()) NOT NULL
);

