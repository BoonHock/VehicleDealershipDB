CREATE TABLE [misc].[color] (
    [color]       INT           IDENTITY (1, 1) NOT NULL,
    [color_name]  NVARCHAR (20) NOT NULL,
    [modified_by] INT           NOT NULL,
    CONSTRAINT [PK_color] PRIMARY KEY CLUSTERED ([color] ASC),
    CONSTRAINT [FK_color_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_color] UNIQUE NONCLUSTERED ([color_name] ASC)
);






GO
