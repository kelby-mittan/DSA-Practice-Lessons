//: [Previous](@previous)

import Foundation

/*
 88. Merge Sorted Array
 Easy
 
 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 
 Note:
 
 The number of elements initialized in nums1 and nums2 are m and n respectively.
 You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
 Example:
 
 Input:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 
 Output: [1,2,2,3,5,6]
 */

func mergeSort(_ nums: [Int]) -> [Int] {
    
    guard nums.count > 1 else { return nums }
    
    let left = Array(nums[0..<nums.count/2])
    let right = Array(nums[nums.count/2..<nums.count])
    
    return basicMerge(leftArr: mergeSort(left), rightArr: mergeSort(right))
}

func basicMerge(leftArr: [Int], rightArr: [Int]) -> [Int] {
    var left = leftArr
    var right = rightArr
    var resultArr = [Int]()
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            resultArr.append(left.removeFirst())
        } else {
            resultArr.append(right.removeFirst())
        }
    }
    
    return resultArr + left + right
}

var randomArr = [Int]()

for _ in 1...10 {
    randomArr.append(Int.random(in: 1...100))
}

print(randomArr)
randomArr = mergeSort(randomArr)
print(randomArr)

//======================================================================
//======================================================================

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    //    var k = m + n - 1
    //    var i = m - 1
    //    var j = n - 1
    //    while k >= 0 && j >= 0 {
    //        if i >= 0 && nums1[i] > nums2[j] {
    //            nums1[k] = nums1[i]
    //            i -= 1
    //        } else {
    //            nums1[k] = nums2[j]
    //            j -= 1
    //        }
    //        k -= 1
    //    }
    var left = [Int]()
    var right = [Int]()
    for (i,num) in nums1.enumerated() {
        if i <= m - 1 {
            left.append(num)
        }
    }
    for (i,num) in nums2.enumerated() {
        if i <= n - 1 {
            right.append(num)
        }
    }
    nums1.removeAll()
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            nums1.append(left.removeFirst())
        } else {
            nums1.append(right.removeFirst())
        }
    }
    
    nums1 = nums1 + left + right
}
var arr1 = [1,2,3,0,0,0]
merge(&arr1, 3, [2,5,6], 3)


//======================================================================
//======================================================================


func merge<T: Comparable>(_ leftArr: [T], _ rightArr: [T]) -> [T] {
    
    var leftIndex = 0
    var rightIndex = 0
    
    var resultsArr = [T]()
    
    while leftIndex < leftArr.count && rightIndex < rightArr.count {
        let leftElement = leftArr[leftIndex]
        let rightElement = rightArr[rightIndex]
        
        // compare
        
        if leftElement < rightElement {
            resultsArr.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            resultsArr.append(rightElement)
            rightIndex += 1
        } else {
            resultsArr.append(leftElement)
            leftIndex += 1
            resultsArr.append(rightElement)
            rightIndex += 1
        }
    }
    
    // out here append elements remaining in left , right arrays
    
    if leftIndex < leftArr.count {
        resultsArr.append(contentsOf: leftArr[leftIndex...])
    }
    
    if rightIndex < rightArr.count {
        resultsArr.append(contentsOf: rightArr[rightIndex...])
    }
    
    return resultsArr
}

//======================================================================
//======================================================================

/*
 704. Binary Search
 Easy
 
 Given a sorted (in ascending order) integer array nums of n elements and a target value, write a function to search target in nums. If target exists, then return its index, otherwise return -1.
 
 
 Example 1:
 
 Input: nums = [-1,0,3,5,9,12], target = 9
 Output: 4
 Explanation: 9 exists in nums and its index is 4
 
 Example 2:
 
 Input: nums = [-1,0,3,5,9,12], target = 2
 Output: -1
 Explanation: 2 does not exist in nums so return -1
 */

func search(_ nums: [Int], _ target: Int) -> Int {
    var leftIndex = 0
    var rightIndex = nums.count - 1
    
    while leftIndex <= rightIndex {
        let midIndex = (leftIndex + rightIndex) / 2
        if target < nums[midIndex] {
            rightIndex = midIndex - 1
        } else if target > nums[midIndex] {
            leftIndex = midIndex + 1
        } else {
            return midIndex
        }
    }
    return -1
}

search([2,5,7,8,9,10,22,23,44,45,554,636,1211], 23)
