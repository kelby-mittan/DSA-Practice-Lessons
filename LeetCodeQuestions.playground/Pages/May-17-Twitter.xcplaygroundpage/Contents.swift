//: [Previous](@previous)

import Foundation

/*
 355. Design Twitter
 Medium
 
 Design a simplified version of Twitter where users can post tweets, follow/unfollow another user and is able to see the 10 most recent tweets in the user's news feed. Your design should support the following methods:
 
 postTweet(userId, tweetId): Compose a new tweet.
 getNewsFeed(userId): Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent.
 follow(followerId, followeeId): Follower follows a followee.
 unfollow(followerId, followeeId): Follower unfollows a followee.
 Example:
 
 Twitter twitter = new Twitter();
 
 // User 1 posts a new tweet (id = 5).
 twitter.postTweet(1, 5);
 
 // User 1's news feed should return a list with 1 tweet id -> [5].
 twitter.getNewsFeed(1);
 
 // User 1 follows user 2.
 twitter.follow(1, 2);
 
 // User 2 posts a new tweet (id = 6).
 twitter.postTweet(2, 6);
 
 // User 1's news feed should return a list with 2 tweet ids -> [6, 5].
 // Tweet id 6 should precede tweet id 5 because it is posted after tweet id 5.
 twitter.getNewsFeed(1);
 
 // User 1 unfollows user 2.
 twitter.unfollow(1, 2);
 
 // User 1's news feed should return a list with 1 tweet id -> [5],
 // since user 1 is no longer following user 2.
 twitter.getNewsFeed(1);
 */

//class Tweet {
//    
//    let id: Int
//    let time: TimeInterval
//    var next: Tweet?
//    
//    
//    init(_ id: Int) {
//        self.id = id
//        time = NSDate().timeIntervalSince1970
//        next = nil
//    }
//    
//    
//}
//
//class User {
//    
//    let id: Int
//    var followed: Set<Int>
//    var tweetHead: Tweet?
//    
//    
//    init(_ id: Int) {
//        self.id = id
//        followed = Set<Int>()
//        follow(id)
//        tweetHead = nil
//    }
//    
//    func follow(_ id: Int) {
//        followed.insert(id)
//    }
//    
//    func unfollow(_ id: Int) {
//        followed.remove(id)
//    }
//    
//    func post(_ id: Int) {
//        let tweet = Tweet(id)
//        tweet.next = tweetHead
//        tweetHead = tweet
//    }
//    
//    
//}
//
//class Twitter {
//    
//    var userMap = [Int: User]()
//    
//    
//    init() {
//        userMap = [Int: User]()
//    }
//    
//    func postTweet(_ userID: Int, _ tweetID: Int) {
//        if !userMap.keys.contains(userID) {
//            let user = User(userID)
//            userMap[userID] = user
//        }
//        userMap[userID]?.post(tweetID)
//    }
//    
//    func getNewsFeed(_ userID: Int) -> [Int] {
//        guard let user = userMap[userID] else {
//            return []
//        }
//        
//        let users = user.followed
//        var n = 10
//        var result = [Int]()
//        var maxHeap = Heap { (a: Tweet, b: Tweet) -> Bool in
//            a.time > b.time
//        }
//        
//        for user in users {
//            let tweet = userMap[user]?.tweetHead
//            if let tweet = tweet {
//                maxHeap.insert(tweet)
//            }
//        }
//        
//        while !maxHeap.isEmpty && n > 0 {
//            let tweet = maxHeap.remove()
//            result.append(tweet!.id)
//            n -= 1
//            if let nextTweet = tweet!.next {
//                maxHeap.insert(nextTweet)
//            }
//        }
//        
//        return result
//    }
//    
//    func follow(_ followerID: Int, _ followeeID: Int) {
//        if !userMap.keys.contains(followerID) {
//            let user = User(followerID)
//            userMap[followerID] = user
//        }
//        if !userMap.keys.contains(followeeID) {
//            let user = User(followeeID)
//            userMap[followeeID] = user
//        }
//        userMap[followerID]?.follow(followeeID)
//    }
//    
//    func unfollow(_ followerID: Int, _ followeeID: Int) {
//        if !userMap.keys.contains(followerID) {
//            return
//        }
//        if !userMap.keys.contains(followeeID) {
//            return
//        }
//        userMap[followerID]?.unfollow(followeeID)
//    }
//    
//    
//}


class Twitter2 {
    
    var followers = [Int:Set<Int>]()
    var tweets = [(userId: Int, tweetId: Int)]()
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Compose a new tweet. */
    func postTweet(_ userId: Int, _ tweetId: Int) {
        tweets.append((userId,tweetId))
    }
    
    /** Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent. */
    func getNewsFeed(_ userId: Int) -> [Int] {
//        var tenTweets = tweets.filter { (tweet) -> Bool in
//            tweet.userId == userId || followers[tweet.userId]!.contains(userId)
//        }
//        var result = [Int]()
//
//        if tenTweets.count > 10 {
//            tenTweets = Array(tweets[tweets.count-10...tweets.count-1])
//        }
//
//        for tweet in tenTweets {
//            result.append(tweet.tweetId)
//        }
//        return result
        
        let followees = self.followers[userId] ?? []

        let feed = tweets.reversed().reduce([]) {
          accum, value -> [Int] in
          let (tweetUserId, tweetId) = value

          if userId == tweetUserId || followees.contains(tweetUserId) {
            return accum + [tweetId]
          }

          return accum
        }

        return Array(feed.prefix(10))
    }
    
    /** Follower follows a followee. If the operation is invalid, it should be a no-op. */
    func follow(_ followerId: Int, _ followeeId: Int) {
        guard followerId != followeeId else { return }

        var followSet: Set<Int> = self.followers[followerId] ?? Set<Int>()

        followSet.insert(followeeId)

        self.followers[followerId] = followSet
    }
    
    /** Follower unfollows a followee. If the operation is invalid, it should be a no-op. */
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        guard followerId != followeeId else { return }

        guard var followSet = self.followers[followerId] else { return }

        followSet.remove(followeeId)

        self.followers[followerId] = followSet
    }
}

/**
 * Your Twitter object will be instantiated and called as such:
 * let obj = Twitter()
 * obj.postTweet(userId, tweetId)
 * let ret_2: [Int] = obj.getNewsFeed(userId)
 * obj.follow(followerId, followeeId)
 * obj.unfollow(followerId, followeeId)
 */
