-- =============================================
-- Author:		hock
-- Create date: 1.9.2019
-- Description:	update org
-- =============================================
CREATE PROCEDURE [hr].[sp_update_organisation] 
	-- Add the parameters for the stored procedure here
	@org INT,
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
UPDATE [hr].[organisation]
SET [name] = @name,
	[registration_no] = @registration_no,
	[organisation_type] = @org_type,
	[country] = @country,
	[url] = @url,
	[modified_by] = @modified_by

WHERE [organisation] = @org


END