-- =============================================
-- Author:		hock
-- Create date: 19.12.2019
-- Description:	update insert insurance comprehensive rate
-- =============================================
CREATE PROCEDURE fin.sp_update_insert_ins_com_rate 
	-- Add the parameters for the stored procedure here
	@ins_com int,
	@uid int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

-- make sure int1 and int2 must have value and more than 0
UPDATE [misc].[bulkcopy_table]
SET [int1] = case when ISNULL([int1],0) < 0 then 0 else ISNULL([int1],0) end,
	[int2] = case when ISNULL([int2],0) < 0 then 0 else ISNULL([int2],0) end

WHERE [created_by] = @uid

-- delete where not exists from incoming data
DELETE FROM [fin].[insurance_comprehensive_rate]

WHERE NOT EXISTS 
(
	SELECT 1
	FROM [misc].[bulkcopy_table]
	WHERE [int1] = [cc_min]
		AND [int2] = [cc_max]
		AND [created_by] = @uid
)
	AND [insurance_comprehensive] = @ins_com

-- update from incoming data
UPDATE IC
	SET IC.[value] = BK.[decimal18_4]

FROM [fin].[insurance_comprehensive_rate] IC

JOIN [misc].[bulkcopy_table] BK
	ON BK.[int1] = IC.[cc_min]
	AND BK.[int2] = IC.[cc_max]

WHERE BK.[created_by] = @uid
	AND IC.[insurance_comprehensive] = @ins_com

-- insert from incoming data
INSERT INTO [fin].[insurance_comprehensive_rate]
(
	[insurance_comprehensive],
	[cc_min],
	[cc_max],
	[value],
	[modified_by]
)

SELECT 
	@ins_com,
	BK.[int1],
	BK.[int2],
	BK.[decimal18_4],
	@uid

FROM [misc].[bulkcopy_table] BK 
WHERE BK.[created_by] = @uid 
	AND NOT EXISTS 
	(
		SELECT 1
		FROM [fin].[insurance_comprehensive_rate] IC
		WHERE IC.[insurance_comprehensive] = @ins_com
			AND IC.[cc_min] = BK.[int1]
			AND IC.[cc_max] = BK.[int2]
	)



END