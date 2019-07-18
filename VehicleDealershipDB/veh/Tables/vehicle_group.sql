CREATE TABLE [veh].[vehicle_group] (
    [vehicle_group]      INT           IDENTITY (1, 1) NOT NULL,
    [vehicle_group_name] NVARCHAR (50) NOT NULL,
    [vehicle_brand]      INT           NOT NULL,
    [modified_by]        INT           NOT NULL,
    CONSTRAINT [PK_vehicle_group] PRIMARY KEY CLUSTERED ([vehicle_group] ASC),
    CONSTRAINT [FK_vehicle_group_vehicle_brand] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [FK_vehicle_group_vehicle_brand1] FOREIGN KEY ([vehicle_brand]) REFERENCES [veh].[vehicle_brand] ([vehicle_brand]),
    CONSTRAINT [IX_vehicle_group] UNIQUE NONCLUSTERED ([vehicle_group_name] ASC, [vehicle_brand] ASC)
);




GO
-- =============================================
-- Author:		hock
-- Create date: 13.7.2019
-- Description:	
-- =============================================
CREATE TRIGGER [veh].[trig_history_vehicle_group] 
   ON  [veh].[vehicle_group]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO dbhistory.vehicle_group
(
	[vehicle_group]
	,[vehicle_group_name]
	,[vehicle_brand]
	,[modified_by]
	,[modified_on]
)

SELECT
	[vehicle_group]
	,[vehicle_group_name]
	,[vehicle_brand]
	,[modified_by]
	,SYSDATETIME()

FROM inserted


    -- Insert statements for trigger here

END