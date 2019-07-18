CREATE TABLE [hr].[salesperson] (
    [salesperson]              INT            IDENTITY (1, 1) NOT NULL,
    [person]                   INT            NULL,
    [company]                  INT            NULL,
    [location]                 NVARCHAR (255) CONSTRAINT [DF_salesman_location] DEFAULT ('') NOT NULL,
    [is_active]                BIT            CONSTRAINT [DF_salesman_is_active] DEFAULT ((1)) NOT NULL,
    [date_join]                DATE           CONSTRAINT [DF_salesman_date_join] DEFAULT (sysdatetime()) NOT NULL,
    [date_leave]               DATE           CONSTRAINT [DF_salesman_date_leave] DEFAULT (NULL) NULL,
    [sales_target1]            FLOAT (53)     CONSTRAINT [DF_salesman_sales_target_jan] DEFAULT ((0)) NOT NULL,
    [sales_target2]            FLOAT (53)     CONSTRAINT [DF_salesman_sales_target_jan11] DEFAULT ((0)) NOT NULL,
    [sales_target3]            FLOAT (53)     CONSTRAINT [DF_salesman_sales_target_jan10] DEFAULT ((0)) NOT NULL,
    [sales_target4]            FLOAT (53)     CONSTRAINT [DF_salesman_sales_target_jan9] DEFAULT ((0)) NOT NULL,
    [sales_target5]            FLOAT (53)     CONSTRAINT [DF_salesman_sales_target_jan8] DEFAULT ((0)) NOT NULL,
    [sales_target6]            FLOAT (53)     CONSTRAINT [DF_salesman_sales_target_jan7] DEFAULT ((0)) NOT NULL,
    [sales_target7]            FLOAT (53)     CONSTRAINT [DF_salesman_sales_target_jan6] DEFAULT ((0)) NOT NULL,
    [sales_target8]            FLOAT (53)     CONSTRAINT [DF_salesman_sales_target_jan5] DEFAULT ((0)) NOT NULL,
    [sales_target9]            FLOAT (53)     CONSTRAINT [DF_salesman_sales_target_jan4] DEFAULT ((0)) NOT NULL,
    [sales_target10]           FLOAT (53)     CONSTRAINT [DF_salesman_sales_target_jan3] DEFAULT ((0)) NOT NULL,
    [sales_target11]           FLOAT (53)     CONSTRAINT [DF_salesman_sales_target_jan2] DEFAULT ((0)) NOT NULL,
    [sales_target12]           FLOAT (53)     CONSTRAINT [DF_salesman_sales_target_jan1] DEFAULT ((0)) NOT NULL,
    [insurance_renew_target1]  FLOAT (53)     CONSTRAINT [DF_salesman_sales_target_dec1] DEFAULT ((0)) NOT NULL,
    [insurance_renew_target2]  FLOAT (53)     CONSTRAINT [DF_salesman_insurance_renew_target_jan11] DEFAULT ((0)) NOT NULL,
    [insurance_renew_target3]  FLOAT (53)     CONSTRAINT [DF_salesman_insurance_renew_target_jan1] DEFAULT ((0)) NOT NULL,
    [insurance_renew_target4]  FLOAT (53)     CONSTRAINT [DF_salesman_insurance_renew_target_jan4] DEFAULT ((0)) NOT NULL,
    [insurance_renew_target5]  FLOAT (53)     CONSTRAINT [DF_salesman_insurance_renew_target_jan113] DEFAULT ((0)) NOT NULL,
    [insurance_renew_target6]  FLOAT (53)     CONSTRAINT [DF_salesman_insurance_renew_target_jan14] DEFAULT ((0)) NOT NULL,
    [insurance_renew_target7]  FLOAT (53)     CONSTRAINT [DF_salesman_insurance_renew_target_jan3] DEFAULT ((0)) NOT NULL,
    [insurance_renew_target8]  FLOAT (53)     CONSTRAINT [DF_salesman_insurance_renew_target_jan112] DEFAULT ((0)) NOT NULL,
    [insurance_renew_target9]  FLOAT (53)     CONSTRAINT [DF_salesman_insurance_renew_target_jan13] DEFAULT ((0)) NOT NULL,
    [insurance_renew_target10] FLOAT (53)     CONSTRAINT [DF_salesman_insurance_renew_target_jan2] DEFAULT ((0)) NOT NULL,
    [insurance_renew_target11] FLOAT (53)     CONSTRAINT [DF_salesman_insurance_renew_target_jan111] DEFAULT ((0)) NOT NULL,
    [insurance_renew_target12] FLOAT (53)     CONSTRAINT [DF_salesman_insurance_renew_target_jan12] DEFAULT ((0)) NOT NULL,
    [modified_by]              INT            NOT NULL,
    CONSTRAINT [PK_salesman] PRIMARY KEY CLUSTERED ([salesperson] ASC),
    CONSTRAINT [CK_salesman] CHECK ([person] IS NULL AND [company] IS NOT NULL OR [person] IS NOT NULL AND [company] IS NULL),
    CONSTRAINT [FK_salesman_company] FOREIGN KEY ([company]) REFERENCES [hr].[organisation] ([organisation]),
    CONSTRAINT [FK_salesman_person] FOREIGN KEY ([person]) REFERENCES [hr].[person] ([person]),
    CONSTRAINT [FK_salesman_user1] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_salesman] UNIQUE NONCLUSTERED ([person] ASC, [company] ASC)
);




GO
-- =============================================
-- Author:		hock
-- Create date: 13.7.2019
-- Description:	
-- =============================================
CREATE TRIGGER [hr].[trig_history_salesperson] 
   ON  [hr].[salesperson]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO dbhistory.salesperson
(
	[salesperson]
	,[person]
	,[company]
	,[location]
	,[is_active]
	,[date_join]
	,[date_leave]
	,[sales_target1]
	,[sales_target2]
	,[sales_target3]
	,[sales_target4]
	,[sales_target5]
	,[sales_target6]
	,[sales_target7]
	,[sales_target8]
	,[sales_target9]
	,[sales_target10]
	,[sales_target11]
	,[sales_target12]
	,[insurance_renew_target1]
	,[insurance_renew_target2]
	,[insurance_renew_target3]
	,[insurance_renew_target4]
	,[insurance_renew_target5]
	,[insurance_renew_target6]
	,[insurance_renew_target7]
	,[insurance_renew_target8]
	,[insurance_renew_target9]
	,[insurance_renew_target10]
	,[insurance_renew_target11]
	,[insurance_renew_target12]
	,[modified_by]
	,[modified_on]
)

SELECT
	[salesperson]
	,[person]
	,[company]
	,[location]
	,[is_active]
	,[date_join]
	,[date_leave]
	,[sales_target1]
	,[sales_target2]
	,[sales_target3]
	,[sales_target4]
	,[sales_target5]
	,[sales_target6]
	,[sales_target7]
	,[sales_target8]
	,[sales_target9]
	,[sales_target10]
	,[sales_target11]
	,[sales_target12]
	,[insurance_renew_target1]
	,[insurance_renew_target2]
	,[insurance_renew_target3]
	,[insurance_renew_target4]
	,[insurance_renew_target5]
	,[insurance_renew_target6]
	,[insurance_renew_target7]
	,[insurance_renew_target8]
	,[insurance_renew_target9]
	,[insurance_renew_target10]
	,[insurance_renew_target11]
	,[insurance_renew_target12]
	,[modified_by]
	,SYSDATETIME()

FROM inserted


    -- Insert statements for trigger here

END