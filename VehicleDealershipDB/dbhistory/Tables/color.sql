CREATE TABLE [dbhistory].[color] (
    [color]       INT             NOT NULL,
    [color_desc]  NVARCHAR (50)   NOT NULL,
    [img_sample]  VARBINARY (MAX) CONSTRAINT [DF_color_img_sample] DEFAULT (NULL) NULL,
    [modified_by] INT             NOT NULL,
    [modified_on] DATETIME2 (0)   CONSTRAINT [DF_color_modified_on] DEFAULT (sysdatetime()) NOT NULL
);

