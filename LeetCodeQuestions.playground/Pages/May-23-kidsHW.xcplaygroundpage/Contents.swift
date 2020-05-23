//: [Previous](@previous)

import Foundation

/*
 1450. Number of Students Doing Homework at a Given Time
 Easy

 Given two integer arrays startTime and endTime and given an integer queryTime.

 The ith student started doing their homework at the time startTime[i] and finished it at time endTime[i].

 Return the number of students doing their homework at time queryTime. More formally, return the number of students where queryTime lays in the interval [startTime[i], endTime[i]] inclusive.

  

 Example 1:

 Input: startTime = [1,2,3], endTime = [3,2,7], queryTime = 4
 Output: 1
 Explanation: We have 3 students where:
 The first student started doing homework at time 1 and finished at time 3 and wasn't doing anything at time 4.
 The second student started doing homework at time 2 and finished at time 2 and also wasn't doing anything at time 4.
 The third student started doing homework at time 3 and finished at time 7 and was the only student doing homework at time 4.
 Example 2:

 Input: startTime = [4], endTime = [4], queryTime = 4
 Output: 1
 Explanation: The only student was doing their homework at the queryTime.
 Example 3:

 Input: startTime = [4], endTime = [4], queryTime = 5
 Output: 0
 Example 4:

 Input: startTime = [1,1,1,1], endTime = [1,3,2,4], queryTime = 7
 Output: 0
 Example 5:

 Input: startTime = [9,8,7,6,5,4,3,2,1], endTime = [10,10,10,10,10,10,10,10,10], queryTime = 5
 Output: 5
 */

func busyStudent(_ startTime: [Int], _ endTime: [Int], _ queryTime: Int) -> Int {
    
    var numStudents = 0
    var i = startTime.count - 1
    
    while i > 0 {
        if endTime[i] >= queryTime && startTime[i] <= queryTime {
            numStudents += 1
        }
        i -= 1
    }
    return numStudents
}

busyStudent([9,8,7,6,5,4,3,2,1], [10,10,10,10,10,10,10,10,10], 5)

/*
 905. Sort Array By Parity
 Easy

 Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.

 You may return any answer array that satisfies this condition.

  

 Example 1:

 Input: [3,1,2,4]
 Output: [2,4,3,1]
 The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
 */

func sortArrayByParity(_ A: [Int]) -> [Int] {
    var result = [Int]()
    
    for i in 0..<A.count {
        if A[i] % 2 == 0 {
            result.insert(A[i], at: 0)
        } else {
            result.append(A[i])
        }
    }
    
    return result
}

sortArrayByParity([3,1,2,4])
