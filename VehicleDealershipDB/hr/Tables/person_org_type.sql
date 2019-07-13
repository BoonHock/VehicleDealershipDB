CREATE TABLE [hr].[person_org_type] (
    [person_org_type] INT           IDENTITY (1, 1) NOT NULL,
    [person_org_desc] NVARCHAR (50) NOT NULL,
    [modified_by]     INT           NOT NULL,
    [modified_on]     DATETIME2 (0) CONSTRAINT [DF_person_org_type_modified_on] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_person_organisation_type] PRIMARY KEY CLUSTERED ([person_org_type] ASC),
    CONSTRAINT [FK_person_org_type_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);


GO
-- =============================================
-- Author:		hock
-- Create date: 13.7.2019
-- Description:	
-- =============================================
CREATE TRIGGER [hr].[trig_history_person_org_type] 
   ON  [hr].person_org_type
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO dbhistory.person_org_type
(
	[person_org_type]
	,[person_org_desc]
	,[modified_by]
	,[modified_on]
)

SELECT
	[person_org_type]
	,[person_org_desc]
	,[modified_by]
	,[modified_on]

FROM inserted


    -- Insert statements for trigger here

END