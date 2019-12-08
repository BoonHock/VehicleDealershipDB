CREATE TABLE [fin].[vehicle_sale_charges] (
    [vehicle_sale_charges] INT             IDENTITY (1, 1) NOT NULL,
    [vehicle]              INT             NOT NULL,
    [description]          NVARCHAR (50)   NOT NULL,
    [amount]               DECIMAL (18, 4) CONSTRAINT [DF_vehicle_sale_charges_amount] DEFAULT ((0)) NOT NULL,
    [modified_by]          INT             NOT NULL,
    CONSTRAINT [PK_vehicle_sale_charges] PRIMARY KEY CLUSTERED ([vehicle_sale_charges] ASC),
    CONSTRAINT [FK_vehicle_sale_charges_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_sale_charges_vehicle] FOREIGN KEY ([vehicle]) REFERENCES [fin].[vehicle_sale] ([vehicle]) ON DELETE CASCADE
);





