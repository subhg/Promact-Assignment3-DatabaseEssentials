CREATE SCHEMA `twitter` ;
-- Tables & Data
-- User Table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(15)
);
-- User Data
INSERT INTO User (UserID, Name, Email, PhoneNumber)
VALUES
(1, 'Vader', 'vader@example.com', '123-456-7890'),
(2, 'Leia', 'leia@example.com', '987-654-3210'),
(3, 'Obi-Wan', 'obiwan@example.com', '111-222-3333'),
(4, 'Han', 'han@example.com', '555-123-4567'),
(5, 'Chewbacca', 'chewy@example.com', '555-987-6543'),
(6, 'Luke', 'luke@example.com', '555-111-2222');


-- Tweet Table
CREATE TABLE Tweet (
    TweetID INT PRIMARY KEY,
    UserID INT,
    TextualContent VARCHAR(255),
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    OriginalTweetID INT, -- Added for referencing the original tweet
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (OriginalTweetID) REFERENCES Tweet(TweetID)
);

-- Tweet Data

INSERT INTO Tweet (TweetID, UserID, TextualContent, OriginalTweetID, Timestamp)
VALUES
(1, 1, 'I find your lack of faith disturbing.', NULL, '2024-01-25 10:00:00'),
(2, 3, 'The Force will be with you. Always.', NULL, '2024-01-25 10:30:00'),
(3, 4, 'Fast ship? You''ve never heard of the Millennium Falcon?', NULL, '2024-01-26 12:00:00'),
(4, 5, 'Roarrrrrrrrr!', NULL, '2024-01-26 12:30:00'),
(5, 6, 'I am a Jedi, like my father before me.', NULL, '2024-01-26 13:00:00'),
(6, 2, 'This is a comment on the original tweet.', 1, '2024-01-27 09:00:00'),
(7, 1, 'Impressive. Most impressive.', 3, '2024-01-27 09:30:00'),
(8, 5, 'Chewbacca approves!', 4, '2024-01-27 10:00:00');

--  Update OriginalTweetID 
UPDATE Tweet
SET OriginalTweetID = 4
WHERE TweetID = 7;



-- Likes Table
CREATE TABLE Likes (
    LikeID INT PRIMARY KEY,
    UserID INT,
    TweetID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (TweetID) REFERENCES Tweet(TweetID)
);

-- Likes data

INSERT INTO Likes (LikeID, UserID, TweetID)
VALUES
(1, 2, 1),
(2, 5, 3),
(3, 6, 4),
(4, 4, 5);
--  Update TweetID in Like Table
UPDATE Likes
SET TweetID = 1 
WHERE LikeID = 1; 
UPDATE Likes
SET TweetID = 1 
WHERE LikeID = 3; 


-- Retweet Table
CREATE TABLE Retweet (
    RetweetID INT PRIMARY KEY,
    UserID INT,
    OriginalTweetID INT,
    RetweetTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (OriginalTweetID) REFERENCES Tweet(TweetID)
);

-- Retweet data
INSERT INTO Retweet (RetweetID, UserID, OriginalTweetID, RetweetTimestamp)
VALUES
(1, 3, 1, '2024-01-25 11:00:00'),
(2, 6, 3, '2024-01-26 12:15:00'),
(3, 4, 5, '2024-01-26 13:30:00');
-- change of OriginalTweetID
UPDATE Retweet
SET OriginalTweetID = 1
WHERE RetweetID = 2;
UPDATE Retweet
SET OriginalTweetID = 1
WHERE RetweetID = 3;

--  Update column name in Retweet table from OriginalTweetID to TweetID
ALTER TABLE Retweet
CHANGE COLUMN OriginalTweetID TweetID INT;


-- Follow Table
CREATE TABLE Follow (
    FollowID INT PRIMARY KEY,
    FollowerID INT,
    FollowingID INT,
    FOREIGN KEY (FollowerID) REFERENCES User(UserID),
    FOREIGN KEY (FollowingID) REFERENCES User(UserID)
);

-- Follow data
INSERT INTO Follow (FollowID, FollowerID, FollowingID)
VALUES
(1, 2, 1),
(2, 1, 3),
(3, 5, 1),
(4, 6, 4);

-- commands for showing table
SELECT * FROM twitter.User;

SELECT * FROM twitter.Tweet;

SELECT * FROM twitter.Likes;

SELECT * FROM twitter.Retweet;

SELECT * FROM twitter.Follow;

-- Queries 

-- Fetch all users name from database.
SELECT Name FROM twitter.User;

-- Fetch all tweets of user by user id most recent tweets 
SELECT Tweet.TextualContent AS Tweets
FROM Tweet 
WHERE Tweet.UserID = 1 
ORDER BY Tweet.Timestamp DESC;

-- Fetch like count of particular tweet by tweet id.
SELECT COUNT(*) AS LikeCount 
FROM Likes
WHERE Likes.TweetID = 1;

-- Fetch retweet count of particular tweet by tweet id.
SELECT COUNT(Retweet.RetweetID) AS RetweetCount
FROM Retweet
WHERE Retweet.TweetID = 1;

-- Fetch comment count of a particular tweet by tweet ID.
SELECT COUNT(CommentTweet.TweetID) AS CommentCount
FROM Tweet AS OriginalTweet
JOIN Tweet AS CommentTweet ON OriginalTweet.TweetID = CommentTweet.OriginalTweetID
WHERE OriginalTweet.TweetID = 4;

-- Fetch all users' names who have retweeted a particular tweet by tweet ID.
SELECT User.Name 
FROM User 
JOIN Retweet ON User.UserID = Retweet.UserID 
WHERE Retweet.TweetID = 1;

-- Fetch all commented tweet's content for a particular tweet by tweet ID.
SELECT CommentTweet.TextualContent AS Comments
FROM Tweet AS OriginalTweet
JOIN Tweet AS CommentTweet ON OriginalTweet.TweetID = CommentTweet.OriginalTweetID
WHERE OriginalTweet.TweetID = 4;


-- Fetch the user's timeline  (All tweets from users whom I am following with tweet content and user name who has tweeted it).
SELECT User.Name, Tweet.TextualContent 
FROM User 
JOIN Follow ON User.UserID = Follow.FollowingID 
JOIN Tweet ON Follow.FollowingID = Tweet.UserID 
WHERE Follow.FollowerID = 2
ORDER BY Tweet.Timestamp DESC;
