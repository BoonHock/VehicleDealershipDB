CREATE TABLE [veh].[vehicle_brand] (
    [vehicle_brand]      INT           IDENTITY (1, 1) NOT NULL,
    [vehicle_brand_name] NVARCHAR (20) NOT NULL,
    [country]            SMALLINT      NOT NULL,
    [modified_by]        INT           NOT NULL,
    CONSTRAINT [PK_vehicle_brand] PRIMARY KEY CLUSTERED ([vehicle_brand] ASC),
    CONSTRAINT [FK_vehicle_brand_country] FOREIGN KEY ([country]) REFERENCES [hr].[country] ([country]),
    CONSTRAINT [FK_vehicle_brand_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);






GO
