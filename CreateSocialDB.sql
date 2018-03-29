create database SimpleSocialNetworks

Use SimpleSocialNetworks

Go
CREATE TABLE Users
(
	Id  INT IDENTITY   NOT NULL ,	
	FirstName VARCHAR(30),
	LastName VARCHAR(30),	
	CONSTRAINT PK_UsersID PRIMARY KEY  (Id)  

)

GO
CREATE TABLE UsersSecurity
(
	Id  INT IDENTITY,
	Email VARCHAR(30)  UNIQUE,
	UserPassword VARCHAR(30),
	EmailConfirmed bit,
	CONSTRAINT PK_UsersSecurityID PRIMARY KEY  (Id)
)

--JoinDate DATE,
--UserImage VARCHAR(30),
--StatusText VARCHAR(30),
--About VARCHAR(30)

Go
CREATE TABLE MessagesTable
(
 Id int IDENTITY ,
 Receiver  INT  NOT NULL ,
 Sender INT  NOT NULL ,
 MessageText NVARCHAR(2000),
 SentDate Date NOT NULL ,
 StatusMessage int NOT NULL DEFAULT '0',

 CONSTRAINT PK_MessagesID PRIMARY KEY  (Id),

 CONSTRAINT FK_Receiver FOREIGN KEY (Receiver)  REFERENCES Users (Id),

 CONSTRAINT FK_Sender FOREIGN KEY (Sender)  REFERENCES Users (Id)
 


)


Go
CREATE TABLE Friends
(
 Id int IDENTITY ,
 UserOneId INT,
 UserTwoId INT ,
 StatusCode INT NOT NULL DEFAULT '0',
 Action_user_id INT,
 FOREIGN KEY (UserOneId)  REFERENCES Users (Id)  ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_UserTwoId  FOREIGN KEY (UserTwoId )  REFERENCES Users (Id),
 CONSTRAINT FK_Action_user_id FOREIGN KEY (Action_user_id)  REFERENCES Users (Id),
 CONSTRAINT PK_FriendsID PRIMARY KEY  (Id),
 CONSTRAINT UC_Person UNIQUE (UserOneId,UserTwoId )
 
)


drop table Friends
--0 - Pending
--1-Accepted
--2 -Rejected
--3 -Blocked

Go
CREATE TABLE EventsTable
(
 Id INT IDENTITY,
 Name NVARCHAR(256),
 Duration TIME,
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
 CREATE TABLE EventsUser
 (
 Id INT IDENTITY,
 UserID INT,
 EventID INT,
 CONSTRAINT PK_EventsUserID PRIMARY KEY  (Id),
 FOREIGN KEY (UserId)  REFERENCES Users (Id)  ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (EventID)  REFERENCES EventsTable (Id)  ON DELETE CASCADE ON UPDATE CASCADE
 )
 -- -1 the end
 -- 0 todat
 -- 1 in the future



INSERT INTO Users VALUES
('user0','super0'),
('user1','super1'),
('user2','super2'),
('user3','super3'),
('user4','super4'),
('user5','super5'),
('user6','super6'),
('user7','super7');


INSERT INTO Friends VALUES
(1, 2, 1, 1),
(1, 3, 1, 3),
(1, 4, 1, 4),
(1, 5, 0, 5),
(1, 6, 3, 1),
(2, 3, 1, 2),
(2, 4, 1, 4),
(3, 5, 1, 3),
(4, 3, 0, 1);

GO
--Friend Request
INSERT INTO Friends VALUES
(4, 2, 0, 1);

GO
--Accept Friend Request
UPDATE Friends SET StatusCode = 1, Action_user_id = 2
WHERE UserOneId = 1 AND UserTwoId = 5

GO
--Checking Friendship
SELECT * FROM Friends
WHERE UserOneId  = 1 AND UserTwoId = 2 AND StatusCode = 1

Go
--Friends List
SELECT  Users.FirstName, Users.LastName FROM Friends
JOIN Users ON Users.Id=UserTwoId
WHERE (UserOneId  = 2 OR UserTwoId = 1)
AND  StatusCode  = 1



Go
--count pending friends
SELECT COUNT(StatusCode ) AS CountPendingFriends
FROM Friends
WHERE StatusCode = 0


