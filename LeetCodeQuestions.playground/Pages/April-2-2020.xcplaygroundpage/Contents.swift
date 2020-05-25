
import Foundation

/*
    ==========================================================
    1365. How Many Numbers Are Smaller Than the Current Number
    ==========================================================
    Easy

    Given the array nums, for each nums[i] find out how many numbers in the array are smaller than it. That is, for each nums[i] you have to count the number of valid j's such that j != i and nums[j] < nums[i].

    Return the answer in an array.

    Example 1:

    Input: nums = [8,1,2,2,3]
    Output: [4,0,1,1,3]
    Explanation:
    For nums[0]=8 there exist four smaller numbers than it (1, 2, 2 and 3).
    For nums[1]=1 does not exist any smaller number than it.
    For nums[2]=2 there exist one smaller number than it (1).
    For nums[3]=2 there exist one smaller number than it (1).
    For nums[4]=3 there exist three smaller numbers than it (1, 2 and 2).
    Example 2:

    Input: nums = [6,5,4,8]
    Output: [2,1,0,3]
    Example 3:

    Input: nums = [7,7,7,7]
    Output: [0,0,0,0]
*/


func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
    
    let sorted = nums.sorted()
    var resultArr = [Int]()
    var dict = [Int:Int]()
    
    for i in 0..<sorted.count {
        if dict[sorted[i]] == nil {
            dict[sorted[i]] = i
        }
    }
    for i in 0..<nums.count {
        resultArr.append(dict[nums[i]]!)
    }
    
    return resultArr
    
//    for i in nums {
//        var count = 0
//        for j in nums {
//            if j < i {
//                count += 1
//            }
//        }
//        resultArr.append(count)
//    }
    
}

let nums = [6,5,4,8]

smallerNumbersThanCurrent(nums)


/*
 315.
 ======================================================================
 You are given an integer array nums and you have to return a new counts array. The counts array has the property where counts[i] is the number of smaller elements to the right of nums[i].
 ======================================================================

 Example:

 Input: [5,2,6,1]
 Output: [2,1,1,0]
 Explanation:
 To the right of 5 there are 2 smaller elements (2 and 1).
 To the right of 2 there is only 1 smaller element (1).
 To the right of 6 there is 1 smaller element (1).
 To the right of 1 there is 0 smaller element.
 */

func countSmaller(_ nums: [Int]) -> [Int] {
    var resultArr = [Int]()
    
    for (i, num) in nums.enumerated() {
        var count = 0
        
        for (j, val) in nums.enumerated() {
            if j > i && val < num {
                count += 1
            }
        }
        resultArr.append(count)
    }
    
    return resultArr
}
countSmaller([5,2,6,1])


/*
 ======================================================================
 728. Self Dividing Numbers
 ======================================================================
 Easy

 A self-dividing number is a number that is divisible by every digit it contains.
 For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0, and 128 % 8 == 0.
 Also, a self-dividing number is not allowed to contain the digit zero.

 Given a lower and upper number bound, output a list of every possible self dividing number, including the bounds if possible.

 Example 1:
 Input:
 left = 1, right = 22
 Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]
 Note:

 The boundaries of each input argument are 1 <= left <= right <= 10000.
 */

func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
    var resultsArr = [Int]()
    
    for num in left...right {
        let numArr = Array(String(num))
        if !numArr.contains("0") {
            for i in numArr {
                let iInt = Int(String(i)) ?? 0
                if num % iInt == 0 {
                    if !resultsArr.contains(num) {
                        resultsArr.append(num)
                    }
                    continue
                } else {
                    resultsArr.removeAll(where: { $0 == num })
                    break
                }
            }
        }
    }
    return resultsArr
}

selfDividingNumbers(1, 22)

/*
 ======================================================================
 1295. Find Numbers with Even Number of Digits
 ======================================================================
 Easy
 
 Given an array nums of integers, return how many of them contain an even number of digits.
  
 Example 1:

 Input: nums = [12,345,2,6,7896]
 Output: 2
 Explanation:
 12 contains 2 digits (even number of digits).
 345 contains 3 digits (odd number of digits).
 2 contains 1 digit (odd number of digits).
 6 contains 1 digit (odd number of digits).
 7896 contains 4 digits (even number of digits).
 Therefore only 12 and 7896 contain an even number of digits.
 */

func findNumbers(_ nums: [Int]) -> Int {
    var count = 0
    
    for num in nums {
        let numArr = Array(String(num))
        if numArr.count % 2 == 0 {
            count += 1
        }
    }
    return count
}

findNumbers([12,345,2,6,7896])

/*
 ======================================================================
 1281. Subtract the Product and Sum of Digits of an Integer
 ======================================================================
 Easy

 Given an integer number n, return the difference between the product of its digits and the sum of its digits.
  

 Example 1:

 Input: n = 234
 Output: 15
 Explanation:
 Product of digits = 2 * 3 * 4 = 24
 Sum of digits = 2 + 3 + 4 = 9
 Result = 24 - 9 = 15
 Example 2:

 Input: n = 4421
 Output: 21
 Explanation:
 Product of digits = 4 * 4 * 2 * 1 = 32
 Sum of digits = 4 + 4 + 2 + 1 = 11
 Result = 32 - 11 = 21
 */

func subtractProductAndSum(_ n: Int) -> Int {
    
    let numArr = Array(String(n))
    var prod = 1
    var sum = 0
    for num in numArr {
        prod *= Int(String(num)) ?? 0
        sum += Int(String(num)) ?? 0
    }
    return prod - sum
}

subtractProductAndSum(4421)


/*
 ======================================================================
 263. Ugly Number
 ======================================================================
 Write a program to check whether a given number is an ugly number.
 Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.

 Example 1:

 Input: 6
 Output: true
 Explanation: 6 = 2 × 3
 Example 2:

 Input: 8
 Output: true
 Explanation: 8 = 2 × 2 × 2
 Example 3:

 Input: 14
 Output: false
 Explanation: 14 is not ugly since it includes another prime factor 7.
 */

func isUgly(_ num: Int) -> Bool {
    
    if num == 0{
        return false
    }
    if num == 1{
        return true
    }
    var i = num
    
    while i % 2 == 0 {
        i/=2
    }
    while i % 3 == 0 {
        i /= 3
    }
    while i % 5 == 0 {
        i /= 5
    }
    return i == 1
}
isUgly(8)

/*
 ======================================================================
 1380. Lucky Numbers in a Matrix
 ======================================================================
 Easy
 Given a m * n matrix of distinct numbers, return all lucky numbers in the matrix in any order.

 A lucky number is an element of the matrix such that it is the minimum element in its row and maximum in its column.

 Example 1:

 Input: matrix = [[3,7,8],[9,11,13],[15,16,17]]
 Output: [15]
 Explanation: 15 is the only lucky number since it is the minimum in its row and the maximum in its column
 Example 2:

 Input: matrix = [[1,10,4,2],[9,3,8,7],[15,16,17,12]]
 Output: [12]
 Explanation: 12 is the only lucky number since it is the minimum in its row and the maximum in its column.
 Example 3:

 Input: matrix = [[7,8],[1,2]]
 Output: [7]
 */

let matrix = [[3,7,8],[9,11,13],[15,16,17]]
/*
 3   7   8
 9  11  13
 15 16  17
 */
func luckyNumbers (_ matrix: [[Int]]) -> [Int] {
    
    var minimumValueRowIndices = Array(repeating: 0, count: matrix.count)
    var maximumValueColumn = Array(repeating: -1, count: matrix[0].count)
    
    var luckyNumbers: [Int] = []
    
    for row in 0..<matrix.count {
        for column in 0..<matrix[row].count {
            // Track the minimum indices per row and add the index only if
            // the value is less than the value associated with the index in
            // minimumValueRowIndices for this particlular row
            if matrix[row][column] < matrix[row][minimumValueRowIndices[row]] {
                minimumValueRowIndices[row] = column
            }
            
            // Track the maxium
            if matrix[row][column] > maximumValueColumn[column] {
                maximumValueColumn[column] = matrix[row][column]
            }
        }
    }
    for row in 0..<matrix.count {
        // does the minium value of the row equal the max value at that column?
        if matrix[row][minimumValueRowIndices[row]] == maximumValueColumn[minimumValueRowIndices[row]] {
            luckyNumbers.append(maximumValueColumn[minimumValueRowIndices[row]])
        }
    }
    return luckyNumbers
}

luckyNumbers(matrix)
