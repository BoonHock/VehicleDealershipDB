CREATE TABLE [hr].[country] (
    [country]      SMALLINT       IDENTITY (1, 1) NOT NULL,
    [cc_iso]       NVARCHAR (2)   NOT NULL,
    [country_name] NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED ([country] ASC),
    CONSTRAINT [IX_country] UNIQUE NONCLUSTERED ([cc_iso] ASC),
    CONSTRAINT [IX_country_1] UNIQUE NONCLUSTERED ([country_name] ASC)
);



