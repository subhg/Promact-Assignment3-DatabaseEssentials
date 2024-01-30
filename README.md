**Tables**<br>
**User Table**
<br>
![User](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/a4a9b63e-b2ff-4e4d-a7cb-7ed387a96b75)

**Tweet Table**
<br>
![Tweet](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/81b43d93-6971-4225-acc0-0b6abed13eea)

**Likes Table**
<br>
![likes](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/fca9db40-45e6-430d-b9e0-53133eb9e217)

**Retweet Table**
<br>
![Retweet](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/6594890e-4e5f-41ae-b0d5-e0ff616936f9)

**Follow table**
<br>
![Follow](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/eb4ee7b1-2c83-4b82-a825-4ac4167210f4)

**Queries**
<br><br>
 Query1: Fetch all users name from database.
<br>
<br>
          SELECT Name FROM twitter.User;
         <br>
         ![Query1](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/d99ade28-fb23-42e6-8069-d28146fc5dff)

Query2: Fetch all tweets of user by user id most recent tweets 
<br>
<br>
       SELECT Tweet.TextualContent AS Tweets<br>
       FROM Tweet<br> 
       WHERE Tweet.UserID = 1 <br>
       ORDER BY Tweet.Timestamp DESC;<br>
       <br>
      ![Query2](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/4ae1fe8f-4956-462a-a130-a6b8e34be616)

 Query3: Fetch retweet count of particular tweet by tweet id.
<br>
<br>
          SELECT COUNT(Retweet.RetweetID) AS RetweetCount<br>
           FROM Retweet<br>
           WHERE Retweet.TweetID = 1;<br>
           <br>
           ![Query4](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/a97eae03-5a9d-4d80-ba0c-b4126dfd3822)

           
 Query4:  Fetch comment count of a particular tweet by tweet ID.
<br>
<br>
          SELECT COUNT(CommentTweet.TweetID) AS CommentCount<br>
          FROM Tweet AS OriginalTweet<br>
          JOIN Tweet AS CommentTweet ON OriginalTweet.TweetID = CommentTweet.OriginalTweetID<br>
          WHERE OriginalTweet.TweetID = 4;<br>
          <br>
          ![Query5](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/0400919b-5f7d-4003-9b91-49ce3fa07ee9)


 Query5: Fetch all users' names who have retweeted a particular tweet by tweet ID.
<br>
<br>
          SELECT User.Name <br>
          FROM User <br>
          JOIN Retweet ON User.UserID = Retweet.UserID <br>
          WHERE Retweet.TweetID = 1;<br>
          <br>
          ![Query6](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/4357c6ef-2a48-478d-9c6a-d6c19d786028)


   Query6: Fetch like count of particular tweet by tweet id.
   <br>
   <br>
            SELECT COUNT(*) AS LikeCount <br>
            FROM Likes<br>
            WHERE Likes.TweetID = 1;<br.
            ![Query3](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/fa18af6d-94ac-4fc3-ad2b-bccf5f4e968e)

            
   Query7: Fetch all commented tweet's content for a particular tweet by tweet ID.
  <br>
  <br>
             SELECT CommentTweet.TextualContent AS Comments<br>
             FROM Tweet AS OriginalTweet<br>
             JOIN Tweet AS CommentTweet ON OriginalTweet.TweetID = CommentTweet.OriginalTweetID<br>
             WHERE OriginalTweet.TweetID = 4;<br>
             <br>
             ![Query7](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/f4544a34-7dab-4f71-a40c-1dd63a26ef07)



  -- Query8: Fetch the user's timeline  (All tweets from users whom I am following with tweet content and user name who has tweeted it).
  <br>
  <br>
            SELECT User.Name, Tweet.TextualContent <br>
            FROM User <br>
            JOIN Follow ON User.UserID = Follow.FollowingID <br>
            JOIN Tweet ON Follow.FollowingID = Tweet.UserID <br>
            WHERE Follow.FollowerID = 2<br>
            ORDER BY Tweet.Timestamp DESC;<br>
            <br>
           ![Query8](https://github.com/subhg/Promact-Assignment3-DatabaseEssentials/assets/113555022/55ded762-d308-4297-8434-a7361dee1458)
       

