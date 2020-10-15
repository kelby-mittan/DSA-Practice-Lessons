
import Foundation

/*
 771. Jewels and Stones
 Easy
 
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
 Example 5:
 
 Input: head = [0,0]
 Output: 0
 */

// * Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func getDecimalValue(_ head: ListNode?) -> Int {
    var result = 0
    var node = head
    while node != nil {
        result = result * 2 + node!.val
        node = node?.next
    }
    return result
}
