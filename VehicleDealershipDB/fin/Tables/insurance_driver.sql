CREATE TABLE [fin].[insurance_driver] (
    [vehicle]     INT            NOT NULL,
    [ic_no]       NVARCHAR (20)  NOT NULL,
    [driver]      NVARCHAR (200) NOT NULL,
    [modified_by] INT            NOT NULL,
    CONSTRAINT [PK_insurance_driver] PRIMARY KEY CLUSTERED ([vehicle] ASC, [ic_no] ASC),
    CONSTRAINT [FK_insurance_driver_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_insurance_driver_vehicle_sale] FOREIGN KEY ([vehicle]) REFERENCES [fin].[vehicle_sale] ([vehicle])
);

