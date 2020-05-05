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
