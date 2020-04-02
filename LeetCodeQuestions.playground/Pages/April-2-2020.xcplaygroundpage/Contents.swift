
import Foundation

//1365. How Many Numbers Are Smaller Than the Current Number
//Easy

//Given the array nums, for each nums[i] find out how many numbers in the array are smaller than it. That is, for each nums[i] you have to count the number of valid j's such that j != i and nums[j] < nums[i].
//
//Return the answer in an array.

//Example 1:
//
//Input: nums = [8,1,2,2,3]
//Output: [4,0,1,1,3]
//Explanation:
//For nums[0]=8 there exist four smaller numbers than it (1, 2, 2 and 3).
//For nums[1]=1 does not exist any smaller number than it.
//For nums[2]=2 there exist one smaller number than it (1).
//For nums[3]=2 there exist one smaller number than it (1).
//For nums[4]=3 there exist three smaller numbers than it (1, 2 and 2).
//Example 2:
//
//Input: nums = [6,5,4,8]
//Output: [2,1,0,3]
//Example 3:
//
//Input: nums = [7,7,7,7]
//Output: [0,0,0,0]

func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
    
    var resultArr = [Int]()
    
    for i in nums {
        var count = 0
        for j in nums {
            if j < i {
                count += 1
            }
        }
        resultArr.append(count)
    }
    
    return resultArr
}

let nums = [6,5,4,8]

smallerNumbersThanCurrent(nums)


/*
 315.
 You are given an integer array nums and you have to return a new counts array. The counts array has the property where counts[i] is the number of smaller elements to the right of nums[i].

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
