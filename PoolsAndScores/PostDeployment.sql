/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/* Load teams first time database is created */
IF (select count(*) from Division)=0
begin
	delete from Division
	insert into Division(DivisionId, Name)
	SELECT 1, 'AFC-NORTH' UNION ALL
	SELECT 2, 'AFC-SOUTH' UNION ALL
	SELECT 3, 'AFC-EAST'  UNION ALL
	SELECT 4, 'AFC-WEST'  UNION ALL
	SELECT 5, 'NFC-NORTH' UNION ALL
	SELECT 6, 'NFC-SOUTH' UNION ALL
	SELECT 7, 'NFC-EAST'  UNION ALL
	SELECT 8, 'NFC-WEST'
end
IF (Select count(*) from Team)=0 
begin
	DELETE from Team
	insert into Team(TeamId, Name, City, Abbreviation, DivisionId)
	/* AFC DIVISION */
	select  1, 'Ravens',  'Baltimore',	  'BAL', 1 UNION ALL
	select  2, 'Bengals', 'Cincinnati',   'CIN', 1 UNION ALL
	select  3, 'Browns',  'Cleveland',	  'CLE', 1 UNION ALL
	select  4, 'Steelers','Pittsburgh',   'PIT', 1 UNION ALL
	select  5, 'Texans',  'Houston',	  'HOU', 2 UNION ALL
	select  6, 'Colts',   'Indianapolis', 'IND', 2 UNION ALL
	select  7, 'Jaguars', 'Jacksonville', 'JAC', 2 UNION ALL
	select  8, 'Titans',  'Tennessee',    'TEN', 2 UNION ALL
	select  9, 'Bills',   'Buffalo',	  'BUF', 3 UNION ALL
	select 10, 'Dolphins','Miami',		  'MIA', 3 UNION ALL
	select 11, 'Patriots','New England',  'NE',  3 UNION ALL
	select 12, 'Jets',    'New York',	  'NYJ', 3 UNION ALL
	select 13, 'Broncos', 'Denver',		  'DEN', 4 UNION ALL
	select 14, 'Chiefs',  'Kansas City',  'KC',  4 UNION ALL
	select 15, 'Raiders', 'Oakland',	  'OAK', 4 UNION ALL
	select 16, 'Chargers','San Diego',	  'SD',  4 UNION ALL
	/* NFC DIVISON */
	select 17, 'Bears',		'Chicago',		'CHI',	5 UNION ALL
	select 18, 'Lions',		'Detroit',		'DET',	5 UNION ALL
	select 19, 'Packers',	'Green Bay',	'GB',	5 UNION ALL
	select 20, 'Vikings',	'Minnesota',	'MIN',	5 UNION ALL
	select 21, 'Falcons',	'Atlanta',		'ATL',	6 UNION ALL
	select 22, 'Panthers',	'Carolina',		'CAR',	6 UNION ALL
	select 23, 'Saints',	'New Orleans',	'NO',	6 UNION ALL
	select 24, 'Buccaneers','Tampa Bay',	'TB',	6 UNION ALL
	select 25, 'Cowboys',	'Dallas',		'DAL',	7 UNION ALL
	select 26, 'Giants',	'New York',		'NYG',	7 UNION ALL
	select 27, 'Eagles',	'Philadelphia',	'PHI',	7 UNION ALL
	select 28, 'Redskins',	'Washington',	'WAS',	7 UNION ALL
	select 29, 'Cardinals', 'Arizona',		'ARI',	8 UNION ALL
	select 30, '49ers',		'San Francisco','SF',	8 UNION ALL
	select 31, 'Seahawks',	'Seattle',		'SEA',	8 UNION ALL
	select 32, 'Rams',		'St. Louis',	'STL',	8
end