CREATE TABLE [hr].[organisation_type] (
    [organisation_type]             INT           IDENTITY (1, 1) NOT NULL,
    [organisation_type_description] NVARCHAR (50) NOT NULL,
    [modified_by]                   INT           NOT NULL,
    CONSTRAINT [PK_organisation_type] PRIMARY KEY CLUSTERED ([organisation_type] ASC)
);

