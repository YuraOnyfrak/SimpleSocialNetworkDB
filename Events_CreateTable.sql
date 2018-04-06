Use SimpleSocialNetworks

GO

CREATE TABLE EventsTable
(
 Id INT NOT NULL IDENTITY,
 Name NVARCHAR(256),
 DateEvent DATE,
 Duration DATE,
 DescriptionEvents NVARCHAR(256),
 AddressEvents NVARCHAR(256),
 MaxCountPeople INT ,
 ImageEvents NVARCHAR(256),
 StatusEvents INT,
 Visibility BIT NOT NULL DEFAULT 1,
 CONSTRAINT PK_EventsID PRIMARY KEY  (Id),
 CONSTRAINT CK_MaxCountPeople CHECK(MaxCountPeople>0)
 
 )

 GO

Drop table EventsUser

 CREATE TABLE EventsUser
 (
 Id INT IDENTITY,
 UserID INT,
 EventID INT,
 CONSTRAINT PK_EventsUserID PRIMARY KEY  (Id),
 FOREIGN KEY (EventID)  REFERENCES EventsTable (Id)  ON DELETE CASCADE ,
 FOREIGN KEY (UserId)  REFERENCES Users (Id)  ON DELETE CASCADE 
 
 )
 -- -1 the end
 -- 0 today
 -- 1 in the future
 

 