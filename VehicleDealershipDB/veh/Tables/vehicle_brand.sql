CREATE TABLE [veh].[vehicle_brand] (
    [vehicle_brand]      INT           IDENTITY (1, 1) NOT NULL,
    [vehicle_brand_name] NVARCHAR (20) NOT NULL,
    [country]            SMALLINT      NOT NULL,
    [modified_by]        INT           NOT NULL,
    CONSTRAINT [PK_vehicle_brand] PRIMARY KEY CLUSTERED ([vehicle_brand] ASC),
    CONSTRAINT [FK_vehicle_brand_country] FOREIGN KEY ([country]) REFERENCES [hr].[country] ([country]),
    CONSTRAINT [FK_vehicle_brand_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);




GO
-- =============================================
-- Author:		hock
-- Create date: 13.7.2019
-- Description:	
-- =============================================
CREATE TRIGGER [veh].[trig_history_vehicle_brand] 
   ON  [veh].[vehicle_brand]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO dbhistory.vehicle_brand
(
	[vehicle_brand]
	,[vehicle_brand_name]
	,[modified_by]
	,[modified_on]
)

SELECT
	[vehicle_brand]
	,[vehicle_brand_name]
	,[modified_by]
	,SYSDATETIME()

FROM inserted


    -- Insert statements for trigger here

END