//: [Previous](@previous)

import Foundation

/*
 832. Flipping an Image
 Easy

 Given a binary matrix A, we want to flip the image horizontally, then invert it, and return the resulting image.

 To flip an image horizontally means that each row of the image is reversed.  For example, flipping [1, 1, 0] horizontally results in [0, 1, 1].

 To invert an image means that each 0 is replaced by 1, and each 1 is replaced by 0. For example, inverting [0, 1, 1] results in [1, 0, 0].

 Example 1:

 Input: [[1,1,0],[1,0,1],[0,0,0]]
 Output: [[1,0,0],[0,1,0],[1,1,1]]
 Explanation: First reverse each row: [[0,1,1],[1,0,1],[0,0,0]].
 Then, invert the image: [[1,0,0],[0,1,0],[1,1,1]]
 Example 2:

 Input: [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]
 Output: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
 Explanation: First reverse each row: [[0,0,1,1],[1,0,0,1],[1,1,1,0],[0,1,0,1]].
 Then invert the image: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
 */

func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
    
    var flippedMatrix = [[Int]]()
    for arr in A {
        var flipped = [Int]()
        for num in arr {
            var n = num
            if n == 0 {
                n = 1
            } else {
                n = 0
            }
            flipped.insert(n, at: 0)
        }
        flippedMatrix.append(flipped)
    }
    return flippedMatrix
}

flipAndInvertImage([[1,1,0],[1,0,1],[0,0,0]])


/*
 189. Rotate Array
 Easy

 Given an array, rotate the array to the right by k steps, where k is non-negative.

 Follow up:

 Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
 Could you do it in-place with O(1) extra space?
  

 Example 1:

 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 Example 2:

 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
 */

func rotate(_ nums: inout [Int], _ k: Int) {
    
    let times = k % nums.count

    nums = Array(nums[nums.count-times..<nums.count]) + Array(nums[0..<nums.count-times])

//        for _ in 1...k {
//            let num = nums.removeLast()
//            nums.insert(num, at: 0)
//        }

}

var arr = [1,2,3]

rotate(&arr, 4)

/*
 122. Best Time to Buy and Sell Stock II
 Easy

 Say you have an array prices for which the ith element is the price of a given stock on day i.

 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).

 Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

 Example 1:

 Input: [7,1,5,3,6,4]
 Output: 7
 Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
              Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 Example 2:

 Input: [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
              Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
              engaging multiple transactions at the same time. You must sell before buying again.
 Example 3:

 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 */

func maxProfit(_ prices: [Int]) -> Int {
    
//    var min = prices.first!
//    var max = 0
//    var iMax = 0
//    var iMin = 0
//    
//    for (i,n) in prices.enumerated() {
//        if n < min {
//            min = n
//            iMin = i
//            print(iMin)
//        }
//        if n > max {
//            max = n
//            iMax = i
//            print(iMax)
//        }
//    }
//    
//    if iMax > iMin {
//        return max - min
//    } else {
//        return 0
//    }
    
    if prices.count == 0 {
        return 0
    }
    var profit = 0
    
    for i in 1..<prices.count {
        if prices[i] > prices[i-1] {
            profit += prices[i] - prices[i-1]
        }
    }
    
    return profit
}

maxProfit([1,2,3,4])
