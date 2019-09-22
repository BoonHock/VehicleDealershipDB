CREATE TABLE [misc].[colour] (
    [colour]      INT           IDENTITY (1, 1) NOT NULL,
    [colour_name] NVARCHAR (20) NOT NULL,
    [modified_by] INT           NOT NULL,
    CONSTRAINT [PK_color] PRIMARY KEY CLUSTERED ([colour] ASC),
    CONSTRAINT [FK_color_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_color] UNIQUE NONCLUSTERED ([colour_name] ASC)
);

