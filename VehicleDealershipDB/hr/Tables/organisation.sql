CREATE TABLE [hr].[organisation] (
    [organisation]      INT             IDENTITY (1, 1) NOT NULL,
    [name]              NVARCHAR (100)  NOT NULL,
    [registration_no]   NVARCHAR (20)   NOT NULL,
    [organisation_type] INT             NOT NULL,
    [country]           SMALLINT        NOT NULL,
    [url]               NVARCHAR (2083) CONSTRAINT [DF_organisation_url] DEFAULT ('') NOT NULL,
    [modified_by]       INT             NOT NULL,
    CONSTRAINT [PK_business] PRIMARY KEY CLUSTERED ([organisation] ASC),
    CONSTRAINT [FK_business_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_organisation_country] FOREIGN KEY ([country]) REFERENCES [hr].[country] ([country]),
    CONSTRAINT [FK_organisation_organisation_type] FOREIGN KEY ([organisation_type]) REFERENCES [hr].[organisation_type] ([organisation_type])
);












GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'https://stackoverflow.com/questions/1159928/what-is-the-best-column-type-for-url', @level0type = N'SCHEMA', @level0name = N'hr', @level1type = N'TABLE', @level1name = N'organisation', @level2type = N'COLUMN', @level2name = N'url';

