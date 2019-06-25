CREATE TABLE [veh].[vehicle] (
    [vehicle]         INT           NOT NULL,
    [chassis_no]      VARCHAR (100) NOT NULL,
    [registration_no] VARCHAR (10)  NULL,
    CONSTRAINT [PK_vehicle] PRIMARY KEY CLUSTERED ([vehicle] ASC)
);

