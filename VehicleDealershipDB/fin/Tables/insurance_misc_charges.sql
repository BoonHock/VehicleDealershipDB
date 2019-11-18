CREATE TABLE [fin].[insurance_misc_charges] (
    [insurance_misc_charges] INT             IDENTITY (1, 1) NOT NULL,
    [vehicle]                INT             NOT NULL,
    [description]            NVARCHAR (50)   NOT NULL,
    [amount]                 DECIMAL (18, 4) CONSTRAINT [DF_insurance_misc_charges_amount] DEFAULT ((0)) NOT NULL,
    [modified_by]            INT             NOT NULL,
    CONSTRAINT [PK_insurance_misc_charges] PRIMARY KEY CLUSTERED ([insurance_misc_charges] ASC),
    CONSTRAINT [FK_insurance_misc_charges_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_insurance_misc_charges_vehicle] FOREIGN KEY ([vehicle]) REFERENCES [fin].[vehicle_sale] ([vehicle])
);

