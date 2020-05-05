//: [Previous](@previous)

import Foundation

/*
 1. Two Sum
 Easy

 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 Example:

 Given nums = [2, 7, 11, 15], target = 9,

 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int : Int]()
    var res = [Int]()
    
    
    // [2,5,3,1]                        [2:0, 5:1 ,
    //(0,2)
    // (1,5)
    // (2,3)
    for (i, n) in nums.enumerated() {
        if let index = dict[target - n] { // dict[5] = 1
            res.append(index) // 1
            res.append(i)  // 2
        }
        // dict[5] = 1
        dict[n] = i
    }
    return res
}

twoSum([2,5,3,1], 8)

/*
 125. Valid Palindrome
 Easy
 
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

 Note: For the purpose of this problem, we define empty string as valid palindrome.

 Example 1:

 Input: "A man, a plan, a canal: Panama"
 Output: true
 Example 2:

 Input: "race a car"
 Output: false
 */

func isPalindrome(_ s: String) -> Bool {
    let str = s.lowercased().replacingOccurrences(of: " ", with: "")
    var reversed = String()
    var puncless = String()
    for char in str {
        if char.isLetter || char.isNumber {
            puncless.append(char)
        }
    }
    let strLet = puncless
    
    while !puncless.isEmpty {
        guard let lastLetter = puncless.popLast() else { return false }
        reversed.append(lastLetter)
    }
    print(strLet)
    print(reversed)
    return strLet == reversed
}

isPalindrome("A man, a plan, a canal: Panama")
