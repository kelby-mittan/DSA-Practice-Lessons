//: [Previous](@previous)

import Foundation

/*
 Create a function or method that when given a time (a string in HH:MM format) give this smallest angle created between the hour and minute hands on a circular wall clock.
 
 example 1:
 Input: 3:00
 Output: 90 degrees,
 
 example 2:
 Input: 3:30
 Output: 90 degrees
 
 example 3:
 Input: 12:30
 Output: 180 degrees
 
 180 / 30 = angle minute
 minute = 6 degree
 hour = 30 degree
 
 03:30
 3:30
 3:45
 
 example 4:
 Input: 1:45
 
 hourDegree < minutes = negative value
 negative value and positive value the same.
 abs
 
 circular clock is 360 degrees=
 hour = 30
 minute = 6
 
 func smallestAngle(time) -> Int
 1. split that string into two ints
 time.split -> (hour, degree)
 2. convert hour and mimutes to degrees
 
 3. returning the smallest thing
 */

//func smallestAngle(_ time: String) -> Int {
//    let timeArr = time.components(separatedBy: ":")
//
//    //split
////    let charArr = time.split(separator: ":")
////    let timeArr = charArr.map { String($0) }
//
//    let minutes = (Int(timeArr[1]) ?? 0) * 6
//    let hourDegree = ((Int(timeArr[0]) ?? 0) * 30) * (60 / minutes)
//
//
//    var smallestDegree = 0
//
//    // if hourDegree >= minutes {
//    //   smallestDegree = hourDegree - minutes
//    // } else {
//    //   smallestDegree = minutes - hourDegree
//    // }
//
//    // abs function
//    smallestDegree = abs(hourDegree - minutes)
//
//    if smallestDegree >= 180 {
//        smallestDegree = 360 - smallestDegree
//        return smallestDegree
//    } else {
//        return smallestDegree
//    }
//}

//let input1 = "3:00"
//let input2 = "9:00"
//let input3 = "3:20"
//let input4 = "4:28"
//
//print(smallestAngle(input1))
//print(smallestAngle(input2))
//print(smallestAngle(input3))
//print(smallestAngle(input4))


func leftRotate(arr: [Int], shift: Int) -> [Int] {
    var result = arr
    
    for _ in 1...shift {

        let num = result.first!
        result.append(num)
        result.removeFirst()
    }
    return result
}

leftRotate(arr: [1,2,3,4,5], shift: 2)
