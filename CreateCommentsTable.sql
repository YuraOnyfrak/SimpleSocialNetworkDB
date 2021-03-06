Use SimpleSocialNetworks

CREATE TABLE Records
 (
	Id INT IDENTITY,
	RecordText NVARCHAR(256) NOT NULL,
	RecordDate DATE NOT NULL DEFAULT GETDATE(),
 )
 GO

ALTER TABLE Records ADD 
	CONSTRAINT PK_Records PRIMARY KEY(Id) 
Go

 CREATE TABLE Comments
 (
	Id INT IDENTITY,
	AuthorId INT,
	RecordId INT,
	CommentDate DATE NOT NULL DEFAULT GETDATE(),
	CommentText NVARCHAR(256) NOT NULL,

 )
 GO

ALTER TABLE Comments ADD 
	CONSTRAINT PK_Comments PRIMARY KEY(Id) 
GO

ALTER TABLE Comments ADD CONSTRAINT
	FK_Users_Comments FOREIGN KEY(RecordId) 
	REFERENCES Records(Id) 
		ON UPDATE  CASCADE 
		ON DELETE  CASCADE
GO


ALTER TABLE Comments ADD CONSTRAINT
	FK_Records_Comments FOREIGN KEY(AuthorId) 
	REFERENCES Users(Id) 
		ON UPDATE  CASCADE 
		ON DELETE  CASCADE
GO


  CREATE TABLE TreePaths
  (
	Ansector INT  NOT NULL,
	Descendant INT  NOT NULL,
  )
GO

 ALTER TABLE TreePaths ADD 
	CONSTRAINT PK_TreePaths PRIMARY KEY(Ansector,Descendant) 
GO

ALTER TABLE TreePaths ADD CONSTRAINT
	FK_Ansector FOREIGN KEY(Ansector) 
	REFERENCES Comments(Id) 
		ON UPDATE  CASCADE 
		ON DELETE  CASCADE
GO

ALTER TABLE TreePaths ADD CONSTRAINT
	FK_Descendant FOREIGN KEY(Descendant) 
	REFERENCES Comments(Id)
GO

