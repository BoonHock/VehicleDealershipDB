CREATE TABLE [hr].[person] (
    [person]          INT             IDENTITY (1, 1) NOT NULL,
    [name]            NVARCHAR (100)  NOT NULL,
    [ic_no]           NVARCHAR (20)   NOT NULL,
    [image]           VARBINARY (MAX) CONSTRAINT [DF_person_image] DEFAULT (NULL) NULL,
    [person_type]     INT             NOT NULL,
    [driving_license] NVARCHAR (15)   NOT NULL,
    [gender]          BIT             NOT NULL,
    [race]            INT             NOT NULL,
    [address]         NVARCHAR (200)  NOT NULL,
    [city]            NVARCHAR (15)   NOT NULL,
    [state]           NVARCHAR (15)   NOT NULL,
    [postcode]        NVARCHAR (10)   NOT NULL,
    [country]         SMALLINT        NOT NULL,
    [occupation]      NVARCHAR (50)   NOT NULL,
    [company]         NVARCHAR (100)  NOT NULL,
    [url]             NVARCHAR (2083) CONSTRAINT [DF_person_url] DEFAULT ('') NOT NULL,
    [modified_by]     INT             NOT NULL,
    CONSTRAINT [PK_people] PRIMARY KEY CLUSTERED ([person] ASC),
    CONSTRAINT [FK_person_country] FOREIGN KEY ([country]) REFERENCES [hr].[country] ([country]),
    CONSTRAINT [FK_person_person_type] FOREIGN KEY ([person_type]) REFERENCES [hr].[person_type] ([person_type]),
    CONSTRAINT [FK_person_race] FOREIGN KEY ([race]) REFERENCES [hr].[race] ([race]),
    CONSTRAINT [FK_person_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_people] UNIQUE NONCLUSTERED ([ic_no] ASC)
);












GO

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'1 for male, 0 for female', @level0type = N'SCHEMA', @level0name = N'hr', @level1type = N'TABLE', @level1name = N'person', @level2type = N'COLUMN', @level2name = N'gender';

