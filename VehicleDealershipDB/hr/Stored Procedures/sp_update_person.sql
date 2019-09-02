-- =============================================
-- Author:		hock
-- Create date: 29.8.2019
-- Description:	update person
-- =============================================
CREATE PROCEDURE [hr].[sp_update_person] 
	-- Add the parameters for the stored procedure here
	@person int,
	@name nvarchar(100),
	@ic_no nvarchar(50),
	@image varbinary(max) = NULL,
	@person_type int,
	@driving_license nvarchar(15),
	@gender bit,
	@race int,
	@address nvarchar(200),
	@city nvarchar(15),
	@state nvarchar(15),
	@postcode nvarchar(10),
	@country smallint,
	@occupation nvarchar(50),
	@company nvarchar(150),
	@url nvarchar(2083),
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [hr].[person]
SET [name] = @name,
	[ic_no] = @ic_no,
	[image] = @image,
	[person_type] = @person_type,
	[driving_license] = @driving_license,
	[gender] = @gender,
	[race] = @race,
	[address] = @address,
	[city] = @city,
	[state] = @state,
	[postcode] = @postcode,
	[country] = @country,
	[occupation] = @occupation,
	[company] = @company,
	[url] = @url,
	[modified_by] = @modified_by

WHERE [person] = @person

END