//: [Previous](@previous)

import Foundation

/*
 1389. Create Target Array in the Given Order
 Easy

 Given two arrays of integers nums and index. Your task is to create target array under the following rules:

 Initially target array is empty.
 From left to right read nums[i] and index[i], insert at index index[i] the value nums[i] in target array.
 Repeat the previous step until there are no elements to read in nums and index.
 Return the target array.

 It is guaranteed that the insertion operations will be valid.

 Example 1:

 Input: nums = [0,1,2,3,4], index = [0,1,2,2,1]
 Output: [0,4,1,3,2]
 Explanation:
 nums       index     target
 0            0        [0]
 1            1        [0,1]
 2            2        [0,1,2]
 3            2        [0,1,3,2]
 4            1        [0,4,1,3,2]
 Example 2:

 Input: nums = [1,2,3,4,0], index = [0,1,2,3,0]
 Output: [0,1,2,3,4]
 Explanation:
 nums       index     target
 1            0        [1]
 2            1        [1,2]
 3            2        [1,2,3]
 4            3        [1,2,3,4]
 0            0        [0,1,2,3,4]
 Example 3:

 Input: nums = [1], index = [0]
 Output: [1]
 */

func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
    var resultsArr = [Int]()
    var arrCount = Int()
    if nums.count == index.count {
        arrCount = nums.count
    }
    for i in 0..<arrCount {
        resultsArr.insert(nums[i], at: index[i])
    }
    return resultsArr
}

createTargetArray([0,1,2,3,4], [0,1,2,2,1])

/*
 1342. Number of Steps to Reduce a Number to Zero
 Easy

 Given a non-negative integer num, return the number of steps to reduce it to zero. If the current number is even, you have to divide it by 2, otherwise, you have to subtract 1 from it.

 Example 1:

 Input: num = 14
 Output: 6
 Explanation:
 Step 1) 14 is even; divide by 2 and obtain 7.
 Step 2) 7 is odd; subtract 1 and obtain 6.
 Step 3) 6 is even; divide by 2 and obtain 3.
 Step 4) 3 is odd; subtract 1 and obtain 2.
 Step 5) 2 is even; divide by 2 and obtain 1.
 Step 6) 1 is odd; subtract 1 and obtain 0.
 Example 2:

 Input: num = 8
 Output: 4
 Explanation:
 Step 1) 8 is even; divide by 2 and obtain 4.
 Step 2) 4 is even; divide by 2 and obtain 2.
 Step 3) 2 is even; divide by 2 and obtain 1.
 Step 4) 1 is odd; subtract 1 and obtain 0.
 Example 3:

 Input: num = 123
 Output: 12
 */

func numberOfSteps (_ num: Int) -> Int {
    var i = num
    var numOfSteps = 0
    
    while i > 0 {
        if i % 2 == 0 {
            i = i / 2
            numOfSteps += 1
        } else {
            i -= 1
            numOfSteps += 1
        }
    }
     
    return numOfSteps
}

numberOfSteps(123)


/*
 771. Jewels and Stones
 
 You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.

 The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".

 Example 1:
 
 Input: J = "aA", S = "aAAbbbb"
 Output: 3
 Example 2:

 Input: J = "z", S = "ZZ"
 Output: 0
 */

func numJewelsInStones(_ J: String, _ S: String) -> Int {
    var jewelSet = Set<String>()
    
    var num = 0
    for jewel in J {
        jewelSet.insert(String(jewel))
    }
    for stone in S {
        if jewelSet.contains(String(stone)) {
            num += 1
        }
    }
    return num
}

numJewelsInStones("aA", "aAAbbbb")

/*
 1207. Unique Number of Occurrences
 Easy

 Given an array of integers arr, write a function that returns true if and only if the number of occurrences of each value in the array is unique.

 Example 1:

 Input: arr = [1,2,2,1,1,3]
 Output: true
 Explanation: The value 1 has 3 occurrences, 2 has 2 and 3 has 1. No two values have the same number of occurrences.
 Example 2:

 Input: arr = [1,2]
 Output: false
 Example 3:

 Input: arr = [-3,0,1,-3,1,1,1,-3,10,0]
 Output: true
 */

func uniqueOccurrences(_ arr: [Int]) -> Bool {
    
    var occDict: [Int:Int] = [:]
    var occurrences = [Int]()
    
    for num in arr {
        if occDict[num] == nil {
            occDict[num] = 1
        } else {
            occDict[num]! += 1
        }
    }
    for (_, val) in occDict {
        occurrences.append(val)
    }
    let occurrencesSet = Set(occurrences)
    
    if occurrencesSet.count == occurrences.count {
        return true
    } else {
        return false
    }
}

uniqueOccurrences([-3,0,1,-3,1,1,1,-3,10,0])

