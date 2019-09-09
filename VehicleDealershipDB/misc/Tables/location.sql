CREATE TABLE [misc].[location] (
    [location]             INT           IDENTITY (1, 1) NOT NULL,
    [location_description] NVARCHAR (50) NOT NULL,
    [modified_by]          INT           NOT NULL,
    CONSTRAINT [PK_location] PRIMARY KEY CLUSTERED ([location] ASC),
    CONSTRAINT [FK_location_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user])
);

