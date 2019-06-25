-- =============================================
-- Author:		hock
-- Create date: 14.04.2019
-- Description:	select user
-- =============================================
CREATE PROCEDURE [dbsecurity].[sp_insert_user] 
	-- Add the parameters for the stored procedure here
	@username nvarchar(20),
	@name nvarchar(200),
	@password nvarchar(MAX),
	@ic_no nvarchar(30),
	@join_date date,
	@modified_by int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
INSERT INTO [dbsecurity].[user]
(
	[username],
	[name],
	[password],
	[ic_no],
	[join_date],
	[modifed_by]
)
VALUES (
	@username,
	@name,
	@password,
	@ic_no,
	@join_date,
	CASE WHEN @modified_by = 0 THEN NULL ELSE @modified_by END
) 

END
