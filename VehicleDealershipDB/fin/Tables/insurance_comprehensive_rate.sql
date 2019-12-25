CREATE TABLE [fin].[insurance_comprehensive_rate] (
    [insurance_comprehensive] INT             NOT NULL,
    [cc_min]                  INT             NOT NULL,
    [cc_max]                  INT             NOT NULL,
    [value]                   DECIMAL (18, 4) NOT NULL,
    [modified_by]             INT             NOT NULL,
    CONSTRAINT [PK_insurance_comprehensive_rate] PRIMARY KEY CLUSTERED ([insurance_comprehensive] ASC, [cc_min] ASC, [cc_max] ASC),
    CONSTRAINT [FK_insurance_comprehensive_rate_insurance_comprehensive] FOREIGN KEY ([insurance_comprehensive]) REFERENCES [fin].[insurance_comprehensive] ([insurance_comprehensive]),
    CONSTRAINT [FK_insurance_comprehensive_rate_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);

