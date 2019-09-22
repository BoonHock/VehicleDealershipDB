CREATE TABLE [hr].[salesperson] (
    [salesperson]         INT            IDENTITY (1, 1) NOT NULL,
    [person]              INT            NULL,
    [organisation_branch] INT            NULL,
    [location]            NVARCHAR (50)  CONSTRAINT [DF_salesman_location] DEFAULT ('') NOT NULL,
    [date_join]           DATE           CONSTRAINT [DF_salesman_date_join] DEFAULT (sysdatetime()) NOT NULL,
    [date_leave]          DATE           CONSTRAINT [DF_salesman_date_leave] DEFAULT (NULL) NULL,
    [remark]              NVARCHAR (255) CONSTRAINT [DF_salesperson_remark] DEFAULT ('') NOT NULL,
    [modified_by]         INT            NOT NULL,
    CONSTRAINT [PK_salesman] PRIMARY KEY CLUSTERED ([salesperson] ASC),
    CONSTRAINT [CK_salesperson] CHECK ([person] IS NULL AND [organisation_branch] IS NOT NULL OR [person] IS NOT NULL AND [organisation_branch] IS NULL),
    CONSTRAINT [FK_salesman_person] FOREIGN KEY ([person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_salesman_user1] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_salesperson_organisation_branch] FOREIGN KEY ([organisation_branch]) REFERENCES [hr].[organisation_branch] ([organisation_branch])
);














GO
