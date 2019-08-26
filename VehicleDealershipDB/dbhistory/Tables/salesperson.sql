CREATE TABLE [dbhistory].[salesperson] (
    [salesperson] INT           NOT NULL,
    [person]      INT           NULL,
    [company]     INT           NULL,
    [location]    NVARCHAR (50) CONSTRAINT [DF_salesperson_location] DEFAULT ('') NOT NULL,
    [is_active]   BIT           CONSTRAINT [DF_salesperson_is_active] DEFAULT ((1)) NOT NULL,
    [date_join]   DATE          CONSTRAINT [DF_salesperson_date_join] DEFAULT (sysdatetime()) NOT NULL,
    [date_leave]  DATE          CONSTRAINT [DF_salesperson_date_leave] DEFAULT (NULL) NULL,
    [modified_by] INT           NOT NULL,
    [modified_on] DATETIME2 (0) CONSTRAINT [DF_salesperson_modified_on] DEFAULT (sysdatetime()) NOT NULL
);



