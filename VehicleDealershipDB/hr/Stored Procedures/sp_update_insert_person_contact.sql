-- =============================================
-- Author:		hock
-- Create date: 31.8.2019
-- Description:	update and insert person contact
-- =============================================
CREATE PROCEDURE [hr].[sp_update_insert_person_contact] 
	-- Add the parameters for the stored procedure here
	@person INT = 1,
	@uid int = 1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
-- trim incoming contact and remark first
-- remarks may be null when user remove all text from dgv cell
UPDATE [misc].[bulkcopy_table]
SET [nvarchar1] = LTRIM(RTRIM([nvarchar1])),
	[nvarchar2] = RTRIM(LTRIM(ISNULL([nvarchar2],'')))

WHERE [created_by] = @uid

-- delete rows that have no value
DELETE
FROM [misc].[bulkcopy_table]
WHERE [nvarchar1] = ''
	AND [nvarchar2] = ''

-- delete existing contact that is not in incoming data
DELETE FROM [hr].[person_contact]
WHERE [contact] NOT IN (
	SELECT [nvarchar1]
	FROM [misc].[bulkcopy_table]
	WHERE [created_by] = @uid
)
	AND [person] = @person


-- update 
UPDATE PERSONCONTACT
SET [contact] = BULKCOPYTABLE.[nvarchar1],
	[remark] = BULKCOPYTABLE.[nvarchar2],
	[modified_by] = @uid

FROM [hr].[person_contact] PERSONCONTACT

JOIN [misc].[bulkcopy_table] BULKCOPYTABLE
	ON BULKCOPYTABLE.[nvarchar1] = PERSONCONTACT.[contact]

WHERE PERSONCONTACT.[person] = @person

-- insert
INSERT INTO [hr].[person_contact]
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
	AND [nvarchar1] NOT IN
	(
		SELECT [contact]
		FROM [hr].[person_contact]
		WHERE [person] = @person
	)


END