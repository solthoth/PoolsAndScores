CREATE TABLE [dbo].[Team]
(
	[TeamId] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(50) NOT NULL, 
    [Abbreviation] VARCHAR(10) NOT NULL, 
    [City] VARCHAR(50) NOT NULL, 
    [DivisionId] INT NOT NULL, 
    CONSTRAINT [FK_Team_ToDivision] FOREIGN KEY ([DivisionId]) REFERENCES [Division]([DivisionId])
)

GO

CREATE INDEX [IX_Team_DivisionId] ON [dbo].[Team] ([DivisionId])
