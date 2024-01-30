**Tables**
**User Table**
![User](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/a4a9b63e-b2ff-4e4d-a7cb-7ed387a96b75)

**Tweet Table**
![Tweet](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/81b43d93-6971-4225-acc0-0b6abed13eea)

**Likes Table**
![likes](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/fca9db40-45e6-430d-b9e0-53133eb9e217)

**Retweet Table**
![Retweet](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/6594890e-4e5f-41ae-b0d5-e0ff616936f9)

**Follow table**
![Follow](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/eb4ee7b1-2c83-4b82-a825-4ac4167210f4)

**Queries**
-- Query1: Fetch all users name from database.
         -- SELECT Name FROM twitter.User;
         ![Query1](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/d99ade28-fb23-42e6-8069-d28146fc5dff)

-- Query2: Fetch all tweets of user by user id most recent tweets 
    -- SELECT Tweet.TextualContent AS Tweets
       FROM Tweet 
       WHERE Tweet.UserID = 1 
       ORDER BY Tweet.Timestamp DESC;
      ![Query2](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/4ae1fe8f-4956-462a-a130-a6b8e34be616)

-- Query3: Fetch retweet count of particular tweet by tweet id.
        -- SELECT COUNT(Retweet.RetweetID) AS RetweetCount
           FROM Retweet
           WHERE Retweet.TweetID = 1;
           ![Query3](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/d4c1c59e-e322-4b70-9411-7bc125925ee6)

-- Query4:  Fetch comment count of a particular tweet by tweet ID.
       -- SELECT COUNT(CommentTweet.TweetID) AS CommentCount
          FROM Tweet AS OriginalTweet
          JOIN Tweet AS CommentTweet ON OriginalTweet.TweetID = CommentTweet.OriginalTweetID
          WHERE OriginalTweet.TweetID = 4;
          ![Query4](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/06dba05a-f5f7-4de7-8d20-b19deeb73a67)

-- Query5: Fetch all users' names who have retweeted a particular tweet by tweet ID.
       -- SELECT User.Name 
          FROM User 
          JOIN Retweet ON User.UserID = Retweet.UserID 
          WHERE Retweet.TweetID = 1;
          ![Query5](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/bc95a703-bdbe-4967-ba97-b419af7c5377)

  -- Query6: Fetch all commented tweet's content for a particular tweet by tweet ID.
         -- SELECT CommentTweet.TextualContent AS Comments
            FROM Tweet AS OriginalTweet
            JOIN Tweet AS CommentTweet ON OriginalTweet.TweetID = CommentTweet.OriginalTweetID
            WHERE OriginalTweet.TweetID = 4;
            ![Query6](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/d0ce80fe-2e1a-4603-b110-ded704f24661)
            
  -- Query7: Fetch all commented tweet's content for a particular tweet by tweet ID.
          -- SELECT CommentTweet.TextualContent AS Comments
             FROM Tweet AS OriginalTweet
             JOIN Tweet AS CommentTweet ON OriginalTweet.TweetID = CommentTweet.OriginalTweetID
             WHERE OriginalTweet.TweetID = 4;
             ![Query7](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/f4544a34-7dab-4f71-a40c-1dd63a26ef07)



  -- Query8: Fetch the user's timeline  (All tweets from users whom I am following with tweet content and user name who has tweeted it).
          --SELECT User.Name, Tweet.TextualContent 
            FROM User 
            JOIN Follow ON User.UserID = Follow.FollowingID 
            JOIN Tweet ON Follow.FollowingID = Tweet.UserID 
            WHERE Follow.FollowerID = 2
            ORDER BY Tweet.Timestamp DESC;
           ![Query8](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/55ded762-d308-4297-8434-a7361dee1458)
       

