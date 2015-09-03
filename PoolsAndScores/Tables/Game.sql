CREATE TABLE [dbo].[Game]
(
	[GameId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	[ScheduleId] INT NOT NULL,
    [HomeTeamId] INT NOT NULL, 
    [AwayTeamId] INT NOT NULL, 
    [HomeScore] INT NOT NULL DEFAULT 0, 
    [AwayScore] NCHAR(10) NOT NULL DEFAULT 0, 
    [WeekDay] VARCHAR(10) NOT NULL DEFAULT '', 
    [WeekTime] VARCHAR(10) NOT NULL DEFAULT '', 
    [GameStatsInfoSysId] INT NOT NULL, 
    [EntertainmentId] INT NOT NULL, 
    [GameType] VARCHAR(10) NOT NULL, 
    CONSTRAINT [FK_Game_ToSchedule] FOREIGN KEY (ScheduleId) REFERENCES [Schedule]([ScheduleId]), 
    CONSTRAINT [FK_Game_ToTeamHome] FOREIGN KEY ([HomeTeamId]) REFERENCES [Team]([TeamId]),
	CONSTRAINT [FK_Game_ToTeamAway] FOREIGN KEY ([AwayTeamId]) REFERENCES [Team]([TeamId])
)

GO

CREATE INDEX [IX_Game_ScheduleId] ON [dbo].[Game] ([ScheduleId])

GO

CREATE INDEX [IX_Game_ScheduleIdIHomeAway] ON [dbo].[Game] ([ScheduleId]) Include ([HomeTeamId], [AwayTeamId])

GO

CREATE INDEX [IX_Game_HomeTeamId] ON [dbo].[Game] ([HomeTeamId])

GO

CREATE INDEX [IX_Game_AwayTeamId] ON [dbo].[Game] ([AwayTeamId])
