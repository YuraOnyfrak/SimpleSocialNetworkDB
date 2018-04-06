Use SimpleSocialNetworks


GO

INSERT INTO EventsTable VALUES
 ('Concert Skillet',  GETDATE(),  SYSDATETIME() , '', 'Kyiv', 13000, '', 1, 1),
 ('Concert PowerWolf',  GETDATE(),  SYSDATETIME() , '', 'Lviv', 1000, '', 1, 1),
 ('Concert Eminem',  GETDATE(),  SYSDATETIME() , '', 'Kyiv', 6000, '', 1, 1)
 
 GO

 INSERT INTO EventsUser VALUES
 (2,5),
 (3,5),
 (4,5);

GO
-- select name user and event which user will visit
SELECT FirstName, EventsTable.Name FROM Users
	 JOIN EventsUser ON EventsUser.UserID = Users.Id 
	 JOIN EventsTable ON EventsUser.EventID = EventsTable.Id

GO	
--- search count event  which user will visit for every user
SELECT FirstName,  COUNT(*) as CountEvent FROM Users
	JOIN EventsUser ON EventsUser.UserID = Users.Id 	
	GROUP BY FirstName

GO
--- search count user  for every event
SELECT  Name, COUNT(*) as CountUsers  FROM EventsTable	
	JOIN EventsUser ON EventsUser.EventID = EventsTable.Id
	GROUP BY Name 
	

GO
--- search count user  for Concert Skillet
SELECT  Name, COUNT(*) as CountUsers  FROM EventsTable	
	JOIN EventsUser ON EventsUser.EventID = EventsTable.Id
	GROUP BY Name 
	HAVING Name = 'Concert Skillet'

Go
-- USER CHOICE WHICH IS NOT A NON-CONCERT
SELECT   * FROM Users
WHERE NOT EXISTS (SELECT * FROM EventsUser WHERE EventsUser.UserID = Users.Id)

Go
--USER CHOICE WHAT IS ON THE CONCERTS : 'Concert PowerWolf'  && 'Concert Eminem
SELECT DISTINCT FirstName  FROM Users
	JOIN EventsUser ON EventsUser.UserID = Users.Id 
	JOIN EventsTable ON EventsUser.EventID = EventsTable.Id
WHERE EventsTable.Name IN ('Concert PowerWolf','Concert Eminem')

