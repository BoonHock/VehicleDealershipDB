-- =============================================
-- Author:		hock
-- Create date: 1.9.2019
-- Description:	insert organisation
-- =============================================
CREATE PROCEDURE [hr].[sp_insert_organisation] 
	-- Add the parameters for the stored procedure here

	@name nvarchar(100),
	@registration_no nvarchar(20),
	@org_type int,
	@country smallint,
	@url nvarchar(2083),
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


INSERT INTO [hr].[organisation]
(
	[name]
	,[registration_no]
	,[organisation_type]
	,[country]
	,[url]
	,[modified_by]
)
VALUES 
(
	@name,
	@registration_no,
	@org_type,
	@country,
	@url,
	@modified_by
)

SELECT SCOPE_IDENTITY();


END