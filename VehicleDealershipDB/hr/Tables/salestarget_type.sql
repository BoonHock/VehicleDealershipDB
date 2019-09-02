CREATE TABLE [hr].[salestarget_type] (
    [salestarget_type]      INT           IDENTITY (1, 1) NOT NULL,
    [salestarget_type_name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_salestarget_type] PRIMARY KEY CLUSTERED ([salestarget_type] ASC)
);

