-- =============================================
-- Author:		hock
-- Create date: 14.9.2019
-- Description:	update and insert org branch
-- =============================================
CREATE PROCEDURE hr.sp_update_insert_organisation_branch 
	-- Add the parameters for the stored procedure here
	@org int,
	@uid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE ORGBRANCH
SET [branch_name] = BULKCOPY.[nvarchar1],
	[address] = BULKCOPY.[nvarchar2],
	[city] = BULKCOPY.[nvarchar3],
	[state] = BULKCOPY.[nvarchar4],
	[postcode] = BULKCOPY.[nvarchar5],
	[country] = BULKCOPY.[int2],
	[modified_by] = BULKCOPY.[created_by]

FROM [hr].[organisation_branch] ORGBRANCH

JOIN [misc].[bulkcopy_table] BULKCOPY
	ON BULKCOPY.[int1] = ORGBRANCH.[organisation_branch]

WHERE [ORGBRANCH].[organisation] = @org
	AND [BULKCOPY].[created_by] = @uid


INSERT INTO [hr].[organisation_branch]
(
	[branch_name],
	[address],
	[city],
	[state],
	[postcode],
	[organisation],
	[country],
	[modified_by]
)
SELECT 
	[nvarchar1],
	[nvarchar2],
	[nvarchar3],
	[nvarchar4],
	[nvarchar5],
	@org,
	[int2],
	@uid

FROM [misc].[bulkcopy_table]

WHERE [int1] NOT IN 
(
	SELECT [organisation_branch]
	FROM [hr].[organisation_branch]
)
	AND [created_by] = @uid

END