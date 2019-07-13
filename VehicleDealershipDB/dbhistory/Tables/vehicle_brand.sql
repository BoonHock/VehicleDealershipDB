CREATE TABLE [dbhistory].[vehicle_brand] (
    [vehicle_brand]      INT           NOT NULL,
    [vehicle_brand_name] NVARCHAR (20) NOT NULL,
    [modified_by]        INT           NOT NULL,
    [modified_on]        DATETIME2 (0) CONSTRAINT [DF_vehicle_brand_modified_on] DEFAULT (sysdatetime()) NOT NULL
);

