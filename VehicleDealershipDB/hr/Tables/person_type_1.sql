CREATE TABLE [hr].[person_type] (
    [person_type]             INT           IDENTITY (1, 1) NOT NULL,
    [person_type_description] NVARCHAR (50) NOT NULL,
    [modified_by]             INT           NOT NULL,
    CONSTRAINT [PK_person_type] PRIMARY KEY CLUSTERED ([person_type] ASC)
);

