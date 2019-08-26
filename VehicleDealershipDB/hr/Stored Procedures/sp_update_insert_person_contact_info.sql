-- =============================================
-- Author:		hock
-- Create date: 27.8.2019
-- Description:	update and insert person contact
-- =============================================
CREATE PROCEDURE [hr].[sp_update_insert_person_contact_info] 
	-- Add the parameters for the stored procedure here
	@person INT = 1,
	@uid int = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE CONTACTINFO
SET [contact] = BULKCOPYTABLE.[nvarchar1],
	[remark] = BULKCOPYTABLE.[nvarchar2],
	[modified_by] = @uid

FROM [hr].[person_contact_info] CONTACTINFO

JOIN [misc].[bulkcopy_table] BULKCOPYTABLE
	ON BULKCOPYTABLE.[int1] = CONTACTINFO.[person_contact_info]

WHERE [person] = @person

INSERT INTO [hr].[person_contact_info]
(
	[person],
	[contact],
	[remark],
	[modified_by]
)

SELECT
	@person,
	[nvarchar1],
	[nvarchar2],
	@uid

FROM [misc].[bulkcopy_table]

WHERE [created_by] = @uid
	AND [int1] NOT IN
	(
		SELECT [person_contact_info].[person_contact_info]
		FROM [hr].[person_contact_info]
	)

END