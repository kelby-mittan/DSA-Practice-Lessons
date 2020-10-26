//: [Previous](@previous)

import Foundation


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

/*
 1221. Split a String in Balanced Strings
 Easy
 
 Balanced strings are those who have equal quantity of 'L' and 'R' characters.
 
 Given a balanced string s split it in the maximum amount of balanced strings.
 
 Return the maximum amount of splitted balanced strings.
 
 Example 1:
 
 Input: s = "RLRRLLRLRL"
 Output: 4
 Explanation: s can be split into "RL", "RRLL", "RL", "RL", each substring contains same number of 'L' and 'R'.
 Example 2:
 
 Input: s = "RLLLLRRRLR"
 Output: 3
 Explanation: s can be split into "RL", "LLLRRR", "LR", each substring contains same number of 'L' and 'R'.
 Example 3:
 
 Input: s = "LLLLRRRR"
 Output: 1
 Explanation: s can be split into "LLLLRRRR".
 Example 4:
 
 Input: s = "RLRRRLLRLL"
 Output: 2
 Explanation: s can be split into "RL", "RRRLLRLL", since each substring contains an equal number of 'L' and 'R'
 */

func balancedStringSplit(_ s: String) -> Int {
    var balance = 0
    var split = 0
    
    for char in s {
        if char == "L" {
            balance += 1
        } else {
            balance -= 1
        }
        
        if balance == 0 {
            split += 1
        }
    }
    
    return split
}
