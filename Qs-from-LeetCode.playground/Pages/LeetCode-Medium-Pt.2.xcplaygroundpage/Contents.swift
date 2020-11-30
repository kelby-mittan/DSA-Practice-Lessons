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

class Twitter {

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

//====================================================================================

/*
 1476. Subrectangle Queries
 Medium

 Implement the class SubrectangleQueries which receives a rows x cols rectangle as a matrix of integers in the constructor and supports two methods:

 1. updateSubrectangle(int row1, int col1, int row2, int col2, int newValue)

 Updates all values with newValue in the subrectangle whose upper left coordinate is (row1,col1) and bottom right coordinate is (row2,col2).
 2. getValue(int row, int col)

 Returns the current value of the coordinate (row,col) from the rectangle.
  

 Example 1:

 Input
 ["SubrectangleQueries","getValue","updateSubrectangle","getValue","getValue","updateSubrectangle","getValue","getValue"]
 [[[[1,2,1],[4,3,4],[3,2,1],[1,1,1]]],[0,2],[0,0,3,2,5],[0,2],[3,1],[3,0,3,2,10],[3,1],[0,2]]
 Output
 [null,1,null,5,5,null,10,5]
 Explanation
 SubrectangleQueries subrectangleQueries = new SubrectangleQueries([[1,2,1],[4,3,4],[3,2,1],[1,1,1]]);
 // The initial rectangle (4x3) looks like:
 // 1 2 1
 // 4 3 4
 // 3 2 1
 // 1 1 1
 subrectangleQueries.getValue(0, 2); // return 1
 subrectangleQueries.updateSubrectangle(0, 0, 3, 2, 5);
 // After this update the rectangle looks like:
 // 5 5 5
 // 5 5 5
 // 5 5 5
 // 5 5 5
 subrectangleQueries.getValue(0, 2); // return 5
 subrectangleQueries.getValue(3, 1); // return 5
 subrectangleQueries.updateSubrectangle(3, 0, 3, 2, 10);
 // After this update the rectangle looks like:
 // 5   5   5
 // 5   5   5
 // 5   5   5
 // 10  10  10
 subrectangleQueries.getValue(3, 1); // return 10
 subrectangleQueries.getValue(0, 2); // return 5
 Example 2:

 Input
 ["SubrectangleQueries","getValue","updateSubrectangle","getValue","getValue","updateSubrectangle","getValue"]
 [[[[1,1,1],[2,2,2],[3,3,3]]],[0,0],[0,0,2,2,100],[0,0],[2,2],[1,1,2,2,20],[2,2]]
 Output
 [null,1,null,100,100,null,20]
 Explanation
 SubrectangleQueries subrectangleQueries = new SubrectangleQueries([[1,1,1],[2,2,2],[3,3,3]]);
 subrectangleQueries.getValue(0, 0); // return 1
 subrectangleQueries.updateSubrectangle(0, 0, 2, 2, 100);
 subrectangleQueries.getValue(0, 0); // return 100
 subrectangleQueries.getValue(2, 2); // return 100
 subrectangleQueries.updateSubrectangle(1, 1, 2, 2, 20);
 subrectangleQueries.getValue(2, 2); // return 20
 */

class SubrectangleQueries {

    var rectangle: [[Int]]
    
    init(_ rectangle: [[Int]]) {
        self.rectangle = rectangle
    }
    
    func updateSubrectangle(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int, _ newValue: Int) {
        for i in row1...row2 {
            for j in col1...col2 {
                rectangle[i][j] = newValue
                print(rectangle[i][j])
            }
        }
    }
    
    func getValue(_ row: Int, _ col: Int) -> Int {
        return rectangle[row][col]
    }
}

/**
 * Your SubrectangleQueries object will be instantiated and called as such:
 * let obj = SubrectangleQueries(rectangle)
 * obj.updateSubrectangle(row1, col1, row2, col2, newValue)
 * let ret_2: Int = obj.getValue(row, col)
 */

/*
 Input
 ["SubrectangleQueries","getValue","updateSubrectangle","getValue","getValue","updateSubrectangle","getValue"]
 [[[[1,1,1],[2,2,2],[3,3,3]]],[0,0],[0,0,2,2,100],[0,0],[2,2],[1,1,2,2,20],[2,2]]
 Output
 [null,1,null,100,100,null,20]
 */

var obj = SubrectangleQueries([[1,1,1],[2,2,2],[3,3,3]])
obj.getValue(0, 0)
print(obj.updateSubrectangle(0, 0, 2, 2, 100))

