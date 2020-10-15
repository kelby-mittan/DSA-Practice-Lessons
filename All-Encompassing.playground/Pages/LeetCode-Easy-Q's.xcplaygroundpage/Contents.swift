
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


/*
 1480. Running Sum of 1d Array
 Easy
 
 Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
 
 Return the running sum of nums.
 
 Example 1:
 
 Input: nums = [1,2,3,4]
 Output: [1,3,6,10]
 Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].
 Example 2:
 
 Input: nums = [1,1,1,1,1]
 Output: [1,2,3,4,5]
 Explanation: Running sum is obtained as follows: [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1].
 Example 3:
 
 Input: nums = [3,1,2,10,1]
 Output: [3,4,6,16,17]
 */

func runningSum(_ nums: [Int]) -> [Int] {
    var arr = [Int]()
    var sum = 0
    for n in nums{
        sum += n
        arr.append(sum)
    }
    return arr
}

/*
 1470. Shuffle the Array
 Easy

 Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].

 Return the array in the form [x1,y1,x2,y2,...,xn,yn].

 Example 1:

 Input: nums = [2,5,1,3,4,7], n = 3
 Output: [2,3,5,4,1,7]
 Explanation: Since x1=2, x2=5, x3=1, y1=3, y2=4, y3=7 then the answer is [2,3,5,4,1,7].
 Example 2:

 Input: nums = [1,2,3,4,4,3,2,1], n = 4
 Output: [1,4,2,3,3,2,4,1]
 Example 3:

 Input: nums = [1,1,2,2], n = 2
 Output: [1,2,1,2]
 */

func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
    let arr = Array(nums[0..<n])
    let arr2 = Array(nums[n..<nums.count])
    var resultArr = [Int]()
    for i in 0..<n{
        resultArr.append(arr[i])
        resultArr.append(arr2[i])
    }
    return resultArr
}

/*
 1528. Shuffle String
 Easy

 Given a string s and an integer array indices of the same length.

 The string s will be shuffled such that the character at the ith position moves to indices[i] in the shuffled string.

 Return the shuffled string.

 Example 1:

 Input: s = "codeleet", indices = [4,5,6,7,0,2,1,3]
 Output: "leetcode"
 Explanation: As shown, "codeleet" becomes "leetcode" after shuffling.
 
 Example 2:

 Input: s = "abc", indices = [0,1,2]
 Output: "abc"
 Explanation: After shuffling, each character remains in its position.
 
 Example 3:

 Input: s = "aiohn", indices = [3,1,4,2,0]
 Output: "nihao"
 
 Example 4:

 Input: s = "aaiougrt", indices = [4,0,2,6,7,3,1,5]
 Output: "arigatou"
 
 Example 5:

 Input: s = "art", indices = [1,0,2]
 Output: "rat"
 */

func restoreString(_ s: String, _ indices: [Int]) -> String {
    var arr = Array<Character>(repeating: " ", count: indices.count)
    let chars = Array(s)
    for i in 0 ..< indices.count {
     arr[indices[i]] = chars[i]
    }
    return String(arr)
}

/*
 1512. Number of Good Pairs
 Easy
 
 Given an array of integers nums.

 A pair (i,j) is called good if nums[i] == nums[j] and i < j.

 Return the number of good pairs.

 Example 1:

 Input: nums = [1,2,3,1,1,3]
 Output: 4
 Explanation: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.
 Example 2:

 Input: nums = [1,1,1,1]
 Output: 6
 Explanation: Each pair in the array are good.
 Example 3:

 Input: nums = [1,2,3]
 Output: 0
 */

func numIdenticalPairs(_ nums: [Int]) -> Int {
//    var pairsCount = 0
//
//    for (i, iVal) in nums.enumerated() {
//        for (j,jVal) in nums.enumerated() {
//            if iVal == jVal && i != j {
//                pairsCount += 1
//            }
//        }
//    }
//    return pairsCount / 2
    
    var pairsCount: [Int] = [0]
    for i in 1..<nums.count {
        pairsCount.append((pairsCount.last ?? 0) + i)
    }
    var dict = [Int: Int]() // num: count
    for num in nums {
        dict[num] = dict[num, default: 0] + 1
    }
    var result = 0 // count pairs
    for (_, count) in dict {
        result += pairsCount[count - 1]
    }
    return result
}

/*
 204. Count Primes
 Easy
 
 Count the number of prime numbers less than a non-negative number, n.

 Example 1:

 Input: n = 10
 Output: 4
 Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
 Example 2:

 Input: n = 0
 Output: 0
 Example 3:

 Input: n = 1
 Output: 0
 */

func countPrimes(_ n: Int) -> Int {
//    if n <= 2 {
//        return 0
//    }
//    var notPrimeArr = Array(repeating: false, count: n))
//    var count = 0
//
//    for i in 2..<n {
//        if !notPrimeArr[i] {
//            count += 1
//            var j = 2
//            while i * j < n {
//                notPrimeArr[i * j] = true
//                j += 1
//            }
//        }
//    }
//
//    return count
    var count = 0
    var primes = Array(repeating: true, count: n)
    var i = 2
    
    while i < n {
        if primes[i] == true {
            count += 1
            var j = i * 2
            while j < n {
                primes[j] = false
                j += i
            }
        }
        i += 1
    }
    return count
}

countPrimes(10)
