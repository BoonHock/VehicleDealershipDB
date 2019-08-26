-- =============================================
-- Author:		hock
-- Create date: 26.8.2019
-- Description:	insert new person
-- =============================================
CREATE PROCEDURE [hr].[sp_insert_person] 
	-- Add the parameters for the stored procedure here
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
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [hr].[person]
(
	[name]
	,[ic_no]
	,[image]
	,[person_type]
	,[driving_license]
	,[gender]
	,[race]
	,[address]
	,[city]
	,[state]
	,[postcode]
	,[country]
	,[occupation]
	,[company]
	,[modified_by]
)
VALUES 
(
	@name,
	@ic_no,
	@image,
	@person_type,
	@driving_license,
	@gender,
	@race,
	@address,
	@city,
	@state,
	@postcode,
	@country,
	@occupation,
	@company,
	@modified_by
)

SELECT SCOPE_IDENTITY();


END