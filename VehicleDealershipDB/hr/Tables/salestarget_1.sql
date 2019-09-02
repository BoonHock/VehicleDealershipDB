CREATE TABLE [hr].[salestarget] (
    [salestarget]      INT           IDENTITY (1, 1) NOT NULL,
    [salesperson]      INT           NOT NULL,
    [salestarget_type] INT           NOT NULL,
    [salestarget_year] SMALLINT      NOT NULL,
    [target1]          FLOAT (53)    CONSTRAINT [DF_salesperson_target_target1] DEFAULT ((0)) NOT NULL,
    [target2]          FLOAT (53)    CONSTRAINT [DF_salesperson_target_target2] DEFAULT ((0)) NOT NULL,
    [target3]          FLOAT (53)    CONSTRAINT [DF_salesperson_target_target3] DEFAULT ((0)) NOT NULL,
    [target4]          FLOAT (53)    CONSTRAINT [DF_salesperson_target_target4] DEFAULT ((0)) NOT NULL,
    [target5]          FLOAT (53)    CONSTRAINT [DF_salesperson_target_target5] DEFAULT ((0)) NOT NULL,
    [target6]          FLOAT (53)    CONSTRAINT [DF_salesperson_target_target6] DEFAULT ((0)) NOT NULL,
    [target7]          FLOAT (53)    CONSTRAINT [DF_salesperson_target_target7] DEFAULT ((0)) NOT NULL,
    [target8]          FLOAT (53)    CONSTRAINT [DF_salesperson_target_target8] DEFAULT ((0)) NOT NULL,
    [target9]          FLOAT (53)    CONSTRAINT [DF_salesperson_target_target9] DEFAULT ((0)) NOT NULL,
    [target10]         FLOAT (53)    CONSTRAINT [DF_salesperson_target_target10] DEFAULT ((0)) NOT NULL,
    [target11]         FLOAT (53)    CONSTRAINT [DF_salesperson_target_target11] DEFAULT ((0)) NOT NULL,
    [target12]         FLOAT (53)    CONSTRAINT [DF_salesperson_target_target12] DEFAULT ((0)) NOT NULL,
    [modified_by]      INT           NOT NULL,
    [modified_on]      DATETIME2 (0) CONSTRAINT [DF_salesperson_target_modified_on] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_salestarget] PRIMARY KEY CLUSTERED ([salestarget] ASC),
    CONSTRAINT [FK_salesperson_target_salesperson] FOREIGN KEY ([salesperson]) REFERENCES [hr].[salesperson] ([salesperson]),
    CONSTRAINT [FK_salesperson_target_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_salestarget_salestarget_type] FOREIGN KEY ([salestarget_type]) REFERENCES [hr].[salestarget_type] ([salestarget_type])
);



