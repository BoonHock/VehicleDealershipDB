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