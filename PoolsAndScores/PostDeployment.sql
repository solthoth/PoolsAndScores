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
	insert into Team(Name, City, Abbreviation)
	/* AFC DIVISION */
	select 'Ravens',  'Baltimore',	  'BAL', 1 UNION ALL
	select 'Bengals', 'Cincinnati',   'CIN', 1 UNION ALL
	select 'Browns',  'Cleveland',	  'CLE', 1 UNION ALL
	select 'Steelers','Pittsburgh',   'PIT', 1 UNION ALL
	select 'Texans',  'Houston',	  'HOU', 2 UNION ALL
	select 'Colts',   'Indianapolis', 'IND', 2 UNION ALL
	select 'Jaguars', 'Jacksonville', 'JAC', 2 UNION ALL
	select 'Titans',  'Tennessee',    'TEN', 2 UNION ALL
	select 'Bills',   'Buffalo',	  'BUF', 3 UNION ALL
	select 'Dolphins','Miami',		  'MIA', 3 UNION ALL
	select 'Patriots','New England',  'NE',  3 UNION ALL
	select 'Jets',    'New York',	  'NYJ', 3 UNION ALL
	select 'Broncos', 'Denver',		  'DEN', 4 UNION ALL
	select 'Chiefs',  'Kansas City',  'KC',  4 UNION ALL
	select 'Raiders', 'Oakland',	  'OAK', 4 UNION ALL
	select 'Chargers','San Diego',	  'SD',  4 UNION ALL
	/* NFC DIVISON */
	select 'Bears',		'Chicago',		'CHI',	5 UNION ALL
	select 'Lions',		'Detroit',		'DET',	5 UNION ALL
	select 'Packers',	'Green Bay',	'GB',	5 UNION ALL
	select 'Vikings',	'Minnesota',	'MIN',	5 UNION ALL
	select 'Falcons',	'Atlanta',		'ATL',	6 UNION ALL
	select 'Panthers',	'Carolina',		'CAR',	6 UNION ALL
	select 'Saints',	'New Orleans',	'NO',	6 UNION ALL
	select 'Buccaneers','Tampa Bay',	'TB',	6 UNION ALL
	select 'Cowboys',	'Dallas',		'DAL',	7 UNION ALL
	select 'Giants',	'New York',		'NYG',	7 UNION ALL
	select 'Eagles',	'Philadelphia',	'PHI',	7 UNION ALL
	select 'Redskins',	'Washington',	'WAS',	7 UNION ALL
	select 'Cardinals', 'Arizona',		'ARI',	8 UNION ALL
	select '49ers',		'San Francisco','SF',	8 UNION ALL
	select 'Seahawks',	'Seattle',		'SEA',	8 UNION ALL
	select 'Rams',		'St. Louis',	'STL',	8
end