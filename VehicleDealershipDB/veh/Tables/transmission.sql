CREATE TABLE [veh].[transmission] (
    [transmission]      INT           IDENTITY (1, 1) NOT NULL,
    [transmission_name] NVARCHAR (20) NOT NULL,
    [modified_by]       INT           NOT NULL,
    CONSTRAINT [PK_transmission] PRIMARY KEY CLUSTERED ([transmission] ASC),
    CONSTRAINT [FK_transmission_user] FOREIGN KEY ([modified_by]) REFERENCES [dbsecurity].[user] ([user]),
    CONSTRAINT [IX_transmission] UNIQUE NONCLUSTERED ([transmission_name] ASC)
);



