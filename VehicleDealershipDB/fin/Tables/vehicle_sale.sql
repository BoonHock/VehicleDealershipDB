CREATE TABLE [fin].[vehicle_sale] (
    [vehicle]         INT           IDENTITY (1, 1) NOT NULL,
    [vehicle_sale_no] NVARCHAR (50) NOT NULL,
    [sale_date]       DATE          NOT NULL,
    [modified_by]     INT           NOT NULL,
    CONSTRAINT [PK_vehicle_sale_1] PRIMARY KEY CLUSTERED ([vehicle] ASC),
    CONSTRAINT [FK_vehicle_sale_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_vehicle_sale] UNIQUE NONCLUSTERED ([vehicle_sale_no] ASC)
);



