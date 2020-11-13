//: [Previous](@previous)

import Foundation

/*
 977. Squares of a Sorted Array
 Easy

 Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.

 Example 1:

 Input: [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Example 2:

 Input: [-7,-3,2,3,11]
 Output: [4,9,9,49,121]
 */

func sortedSquares(_ A: [Int]) -> [Int] {
    var n = 0
    var m = A.count - 1
    var index = A.count - 1
    var array = A
    while n <= m {
        let n2 = A[n] * A[n]
        let m2 = A[m] * A[m]
        if n2 <= m2 {
            array[index] = m2
            m -= 1
            index -= 1
        } else {
            array[index] = n2
            n += 1
            index -= 1
        }
    }
    return array
}

sortedSquares([-7,-3,2,3,11])

//================================================================================

/*
 1189. Maximum Number of Balloons
 Easy

 Given a string text, you want to use the characters of text to form as many instances of the word "balloon" as possible.

 You can use each character in text at most once. Return the maximum number of instances that can be formed.

 Example 1:

 Input: text = "nlaebolko"
 Output: 1
 Example 2:



 Input: text = "loonbalxballpoon"
 Output: 2
 Example 3:

 Input: text = "leetcode"
 Output: 0
 */

func maxNumberOfBalloons(_ text: String) -> Int {
    var dict = [Character:Int]()
    let balloon = "balloon"
    var min = Int.max

    for char in text {
        dict[char, default: 0] += 1
    }

    dict["l"] = (dict["l"] ?? 0) / 2
    dict["o"] = (dict["o"] ?? 0) / 2

    for letter in balloon {
        guard let count = dict[letter] else { return 0 }
        if count < min {
            min = count
        }
    }
    if min == Int.max {
        return 0
    } else {
       return min
    }
}

maxNumberOfBalloons("loonbalxballpoon")
