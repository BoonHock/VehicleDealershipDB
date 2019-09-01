-- =============================================
-- Author:		hock
-- Create date: 1.9.2019
-- Description:	update and insert org contact
-- =============================================
CREATE PROCEDURE [hr].[sp_update_insert_organisation_contact] 
	-- Add the parameters for the stored procedure here
	@org INT = 1,
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
DELETE FROM [misc].[bulkcopy_table]
WHERE [nvarchar1] = ''
	AND [nvarchar2] = ''


DELETE FROM [hr].[organisation_contact]
WHERE [contact] NOT IN (
	SELECT [nvarchar1]
	FROM [misc].[bulkcopy_table]
	WHERE [created_by] = @uid
)
	AND [organisation] = @org

-- update 
UPDATE ORGCONTACT
SET [contact] = BULKCOPYTABLE.[nvarchar1],
	[remark] = BULKCOPYTABLE.[nvarchar2],
	[modified_by] = @uid

FROM [hr].[organisation_contact] ORGCONTACT

JOIN [misc].[bulkcopy_table] BULKCOPYTABLE
	ON BULKCOPYTABLE.[nvarchar1] = ORGCONTACT.[contact]

WHERE ORGCONTACT.[organisation] = @org


-- insert
INSERT INTO [hr].[organisation_contact]
(
	[organisation],
	[contact],
	[remark],
	[modified_by]
)

SELECT
	@org,
	[nvarchar1],
	[nvarchar2],
	@uid

FROM [misc].[bulkcopy_table]

WHERE [created_by] = @uid
	AND [nvarchar1] NOT IN
	(
		SELECT [contact]
		FROM [hr].[organisation_contact]
		WHERE [organisation] = @org
	)


END