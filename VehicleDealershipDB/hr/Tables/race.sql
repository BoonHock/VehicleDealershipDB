CREATE TABLE [hr].[race] (
    [race]      INT           IDENTITY (1, 1) NOT NULL,
    [race_desc] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_race] PRIMARY KEY CLUSTERED ([race] ASC)
);

