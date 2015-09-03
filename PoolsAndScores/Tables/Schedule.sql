CREATE TABLE [dbo].[Schedule]
(
	[ScheduleId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Week] INT NOT NULL, 
    [Year] CHAR(4) NOT NULL, 
    [T] VARCHAR(5) NOT NULL, 
    [GD] INT NOT NULL DEFAULT 0, 
    [BPH] INT NOT NULL DEFAULT 0
)

GO

CREATE INDEX [IX_Schedule_Week] ON [dbo].[Schedule] ([Week])

GO

CREATE INDEX [IX_Schedule_Year] ON [dbo].[Schedule] ([Year])

GO

CREATE INDEX [IX_Schedule_YearIWeek] ON [dbo].[Schedule] ([Year]) Include ([Week])

GO

CREATE INDEX [IX_Schedule_WeekIYear] ON [dbo].[Schedule] ([Week]) Include ([Year])
