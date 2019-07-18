CREATE TABLE [dbhistory].[race] (
    [race]        INT           NOT NULL,
    [race_desc]   NVARCHAR (50) NOT NULL,
    [modified_by] INT           CONSTRAINT [DF_race_modified_by] DEFAULT ((1)) NOT NULL,
    [modified_on] DATETIME2 (0) CONSTRAINT [DF_race_modified_on] DEFAULT (sysdatetime()) NOT NULL
);

