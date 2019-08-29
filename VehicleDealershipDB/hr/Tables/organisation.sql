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
