Use SimpleSocialNetworks

Go
INSERT INTO Records VALUES
('nullreferenceexception',GETDATE());

Go
INSERT INTO  Comments VALUES
(1,1,GETDATE(),'how fix this bug'),
(2,1,GETDATE(),'way1'),
(3,1,GETDATE(),'way2'),
(4,1,GETDATE(),'way3'),
(2,1,GETDATE(),'way4'),
(4,1,GETDATE(),'way5'),
(2,1,GETDATE(),'way6')

INSERT INTO TreePaths VALUES
(3,3),
(3,4),
(3,5),
(3,6),
(3,7),
(4,4),
(4,5),
(4,6),
(4,7),
(5,5),
(5,6),
(5,7),
(6,6),
(6,7),
(7,7)



--add comments to other comments

INSERT INTO  Comments VALUES
(5,1,GETDATE(),'way1')

INSERT INTO TreePaths (Ansector,Descendant)
	SELECT t.Ansector,15 FROM TreePaths AS t
	WHERE t.Descendant = 5
UNION ALL
     SELECT 15,15

-- view all Ansector
SELECT * FROM Comments c
JOIN TreePaths t ON (c.id = t.Ansector)
WHERE t.Descendant = 7


--delete comments
DELETE FROM TreePaths WHERE Descendant = 15

DELETE FROM Comments WHERE  Id =15
