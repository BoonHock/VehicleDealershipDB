CREATE TABLE [dbhistory].[vehicle_group] (
    [vehicle_group]      INT           NOT NULL,
    [vehicle_group_name] NVARCHAR (50) NOT NULL,
    [vehicle_brand]      INT           NOT NULL,
    [modified_by]        INT           NOT NULL,
    [modified_on]        DATETIME2 (0) CONSTRAINT [DF_vehicle_group_modified_on] DEFAULT (sysdatetime()) NOT NULL
);

