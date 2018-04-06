Use SimpleSocialNetworks

GO 
INSERT INTO MessagesTable VALUES
(4,2,'Hello!',GETDATE(),0),
(2,4,'Hi!',GETDATE(),0),
(2,3,'How are you!',GETDATE(),0),
(3,2,'Fine!',GETDATE(),0)


GO
--CHOICE OF LIST OF FRIENDS WHO WERE RECORDED
SELECT DISTINCT FirstName, LastName FROM Users
	JOIN  MessagesTable ON MessagesTable.Receiver= Users.Id 
	AND 
	MessagesTable.Sender = (SELECT Id FROM Users WHERE FirstName = 'user1')
	


