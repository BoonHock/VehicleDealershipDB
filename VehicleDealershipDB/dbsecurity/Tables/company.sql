CREATE TABLE [dbsecurity].[company] (
    [company_name]    NVARCHAR (150) NOT NULL,
    [registration_no] NVARCHAR (20)  NOT NULL,
    [address]         NVARCHAR (255) CONSTRAINT [DF_company_address] DEFAULT ('') NOT NULL,
    [tel_no]          NVARCHAR (50)  CONSTRAINT [DF_company_tel_no] DEFAULT ('') NOT NULL,
    [fax_no]          NVARCHAR (50)  CONSTRAINT [DF_company_tel_no1] DEFAULT ('') NOT NULL,
    [email]           NVARCHAR (100) CONSTRAINT [DF_company_tel_no2] DEFAULT ('') NOT NULL
);

