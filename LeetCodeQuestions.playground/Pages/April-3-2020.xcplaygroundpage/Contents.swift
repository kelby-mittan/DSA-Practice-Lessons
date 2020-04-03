//: [Previous](@previous)

import Foundation

//=======================================================
//=======================================================

/*
 1313. Decompress Run-Length Encoded List
 Easy
 
 We are given a list nums of integers representing a list compressed with run-length encoding.
 
 Consider each adjacent pair of elements [freq, val] = [nums[2*i], nums[2*i+1]] (with i >= 0).  For each such pair, there are freq elements with value val concatenated in a sublist. Concatenate all the sublists from left to right to generate the decompressed list.
 
 Return the decompressed list.
 
 Example 1:
 
 Input: nums = [1,2,3,4]
 Output: [2,4,4,4]
 Explanation: The first pair [1,2] means we have freq = 1 and val = 2 so we generate the array [2].
 The second pair [3,4] means we have freq = 3 and val = 4 so we generate [4,4,4].
 At the end the concatenation [2] + [4,4,4] is [2,4,4,4].
 Example 2:
 
 Input: nums = [1,1,2,3]
 Output: [1,3,3]
 */

func decompressRLElist(_ nums: [Int]) -> [Int] {
    
    var resultArr = [Int]()
    var index = 0
    let arrLength = nums.count
    
    for _ in 0..<arrLength {
        if index == arrLength {
            break
        }
        let occ = nums[index]
        let val = nums[index + 1]
        index += 2
        resultArr.append(contentsOf: Array(repeating: val, count: occ))
        
    }
    return resultArr
}

decompressRLElist([1,2,3,4])

//=======================================================
//=======================================================

/*
 443. String Compression
 Easy
 Given an array of characters, compress it in-place.
 
 The length after compression must always be smaller than or equal to the original array.
 
 Every element of the array should be a character (not int) of length 1.
 
 After you are done modifying the input array in-place, return the new length of the array.
 
 
 Follow up:
 Could you solve it using only O(1) extra space?
 
 Example 1:
 
 Input:
 ["a","a","b","b","c","c","c"]
 
 Output:
 Return 6, and the first 6 characters of the input array should be: ["a","2","b","2","c","3"]
 
 Explanation:
 "aa" is replaced by "a2". "bb" is replaced by "b2". "ccc" is replaced by "c3".
 
 
 Example 2:
 
 Input:
 ["a"]
 
 Output:
 Return 1, and the first 1 characters of the input array should be: ["a"]
 
 Explanation:
 Nothing is replaced.
 */

func compress(_ chars: inout [Character]) -> Int {
    
    var index = 0
    let charArr = chars
    chars.removeAll()
    
    while index < charArr.count {
        
        let currentChar = charArr[index]
        var count = 1
        var nextIndex = index + 1
        
        while nextIndex < charArr.count {
            if currentChar == charArr[nextIndex] {
                count += 1
                nextIndex += 1
            } else {
                break
            }
        }
        
        index = nextIndex
        chars.append(currentChar)
        if count > 1 {
            chars.append(contentsOf: Array(String(count)))
        }
    }
    return chars.count
}
// expected ["a","3","b","2","a","2"]
var charsArr: [Character] = ["a","a","a","b","b","a","a"]
compress(&charsArr)

//=======================================================
//=======================================================

/*
 1290. Convert Binary Number in a Linked List to Integer
 Easy

 Given head which is a reference node to a singly-linked list. The value of each node in the linked list is either 0 or 1. The linked list holds the binary representation of a number.

 Return the decimal value of the number in the linked list.

 Example 1:

 Input: head = [1,0,1]
 Output: 5
 Explanation: (101) in base 2 = (5) in base 10
 Example 2:

 Input: head = [0]
 Output: 0
 Example 3:

 Input: head = [1]
 Output: 1
 Example 4:

 Input: head = [1,0,0,1,0,0,1,1,1,0,0,0,0,0,0]
 Output: 18880
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

let node1 = ListNode(1)
let node2 = ListNode(0)
let node3 = ListNode(1)
let node4 = ListNode(1)
let node5 = ListNode(0)
let node6 = ListNode(1)
let node7 = ListNode(1)
let node8 = ListNode(0)
let node9 = ListNode(1)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node7
node7.next = node8
node8.next = node9

func getDecimalValue(_ head: ListNode?) -> Int {
    var result = 0
    var node = head
    while node != nil {
        result = result * 2 + node!.val
        node = node?.next
    }
    return result
}

getDecimalValue(node1)
