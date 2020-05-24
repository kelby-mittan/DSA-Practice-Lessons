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


/*
 1266. Minimum Time Visiting All Points
 Easy

 On a plane there are n points with integer coordinates points[i] = [xi, yi]. Your task is to find the minimum time in seconds to visit all points.

 You can move according to the next rules:

 In one second always you can either move vertically, horizontally by one unit or diagonally (it means to move one unit vertically and one unit horizontally in one second).
 You have to visit the points in the same order as they appear in the array.
 
 Example 1:
 Input: points = [[1,1],[3,4],[-1,0]]
 Output: 7
 Explanation: One optimal path is [1,1] -> [2,2] -> [3,3] -> [3,4] -> [2,3] -> [1,2] -> [0,1] -> [-1,0]
 Time from [1,1] to [3,4] = 3 seconds
 Time from [3,4] to [-1,0] = 4 seconds
 Total time = 7 seconds
 
 
 Example 2:

 Input: points = [[3,2],[-2,2]]
 Output: 5
 */

func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
    var seconds = 0
    for i in 0..<points.count - 1 {
        let x = points[i+1][0]-points[i][0]
        let y = points[i+1][1]-points[i][1]
        seconds += max(abs(x), abs(y))
    }
    return seconds
//    var counter = 0
//    var currentLocation = points[0]
//    var vP = 0
//
//    while currentLocation != points[points.count - 1] {
//
//        if currentLocation == points[vP + 1] {vP += 1 }
//
//        if currentLocation[0] != points[vP + 1][0] && currentLocation[1] != points[vP + 1][1] {
//            if currentLocation[0] < points[vP + 1][0] {
//                currentLocation[0] += 1
//            } else {
//                currentLocation[0] -= 1
//            }
//
//            if currentLocation[1] < points[vP + 1][1] {
//                currentLocation[1] += 1
//            } else {
//                currentLocation[1] -= 1
//            }
//
//            counter += 1
//
//        } else if currentLocation[1] == points[vP + 1][1] && currentLocation[0] != points[vP + 1][0] {
//            if currentLocation[0] < points[vP + 1][0] {
//                currentLocation[0] += 1
//                counter += 1
//            } else {
//                currentLocation[0] -= 1
//                counter += 1
//            }
//        } else if currentLocation[0] == points[vP + 1][0] && currentLocation[1] != points[vP + 1][1] {
//            if currentLocation[1] < points[vP + 1][1] {
//                currentLocation[1] += 1
//                counter += 1
//            } else {
//                currentLocation[1] -= 1
//                counter += 1
//            }
//        }
//    }
//    return counter
}
