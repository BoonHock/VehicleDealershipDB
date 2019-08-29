CREATE TABLE [hr].[salesperson] (
    [salesperson]  INT            IDENTITY (1, 1) NOT NULL,
    [person]       INT            NULL,
    [organisation] INT            NULL,
    [location]     NVARCHAR (255) CONSTRAINT [DF_salesman_location] DEFAULT ('') NOT NULL,
    [date_join]    DATE           CONSTRAINT [DF_salesman_date_join] DEFAULT (sysdatetime()) NOT NULL,
    [date_leave]   DATE           CONSTRAINT [DF_salesman_date_leave] DEFAULT (NULL) NULL,
    [modified_by]  INT            NOT NULL,
    CONSTRAINT [PK_salesman] PRIMARY KEY CLUSTERED ([salesperson] ASC),
    CONSTRAINT [CK_salesperson] CHECK ([person] IS NULL AND [organisation] IS NOT NULL OR [person] IS NOT NULL AND [organisation] IS NULL),
    CONSTRAINT [FK_salesman_company] FOREIGN KEY ([organisation]) REFERENCES [hr].[organisation] ([organisation]),
    CONSTRAINT [FK_salesman_person] FOREIGN KEY ([person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_salesman_user1] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_salesman] UNIQUE NONCLUSTERED ([person] ASC, [organisation] ASC)
);








GO
