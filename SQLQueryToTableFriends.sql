Use SimpleSocialNetworks

GO
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




