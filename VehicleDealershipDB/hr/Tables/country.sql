CREATE TABLE [hr].[country] (
    [country]      NVARCHAR (2)   NOT NULL,
    [country_name] NVARCHAR (100) NOT NULL,
    [cc_iso]       NVARCHAR (2)   NOT NULL,
    [tld]          NVARCHAR (3)   NOT NULL,
    CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED ([country] ASC)
);

