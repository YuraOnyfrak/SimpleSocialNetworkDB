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
 StatusMessage int  NULL DEFAULT 0,

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

--0 - Pending
--1-Accepted
--2 -Rejected
--3 -Blocked


 