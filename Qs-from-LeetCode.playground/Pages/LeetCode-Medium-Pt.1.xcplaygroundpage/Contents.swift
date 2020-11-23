//: [Previous](@previous)

import Foundation

/*
 451. Sort Characters By Frequency
 Medium
 
 Given a string, sort it in decreasing order based on the frequency of characters.
 
 Example 1:
 
 Input:
 "tree"
 
 Output:
 "eert"
 
 Explanation:
 'e' appears twice while 'r' and 't' both appear once.
 So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
 Example 2:
 
 Input:
 "cccaaa"
 
 Output:
 "cccaaa"
 
 Explanation:
 Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
 Note that "cacaca" is incorrect, as the same characters must be together.
 Example 3:
 
 Input:
 "Aabb"
 
 Output:
 "bbAa"
 
 Explanation:
 "bbaA" is also a valid answer, but "Aabb" is incorrect.
 Note that 'A' and 'a' are treated as two different characters.
 */

func frequencySort(_ s: String) -> String {
    var occDict = [Character:Int]()
    let sArr = Array(s)
    for char in sArr {
        if occDict[char] == nil {
            occDict[char] = 1
        } else {
            occDict[char]! += 1
        }
    }
    let sortedDict = occDict.sorted { $0.value > $1.value }
    var resultArr = [String]()
    for (key,val) in sortedDict {
        var valNum = val
        while valNum > 0 {
            resultArr.append(String(key))
            valNum -= 1
        }
        
    }
    return resultArr.joined()
}

frequencySort("Aabb")

//====================================================================================

/*
 Given a binary tree, return the sum of values of nodes with even-valued grandparent.  (A grandparent of a node is the parent of its parent, if it exists.)
 
 If there are no nodes with an even-valued grandparent, return 0.
 
 Input: root = [6,7,8,2,7,1,3,9,null,1,4,null,null,null,5]
 Output: 18
 Explanation: The red nodes are the nodes with even-value grandparent while the blue nodes are the even-value grandparents.
 
 
 Constraints:
 
 The number of nodes in the tree is between 1 and 10^4.
 The value of nodes is between 1 and 100.
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func sumEvenGrandparent(_ root: TreeNode?) -> Int {
    var sum = 0
    
    func dfs(_ root: TreeNode?, _ parent: TreeNode?, _ gParent: TreeNode?) {
        guard let node = root else { return }
        
        if let gp = gParent, gp.val % 2 == 0 { sum += node.val }
        
        dfs(node.left, node, parent)
        dfs(node.right, node, parent)
    }
    
    dfs(root, nil, nil)
    
    return sum
}

let rootNode = TreeNode(6, TreeNode(7, TreeNode(2, TreeNode(9, nil, nil), nil), TreeNode(7, TreeNode(1, nil, nil), TreeNode(4, nil, nil))), TreeNode(8, TreeNode(1, nil, nil), TreeNode(3, nil, TreeNode(5, nil, nil))))

sumEvenGrandparent(rootNode)

//================================================================================

/*
 442. Find All Duplicates in an Array
 Medium
 
 Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
 
 Find all the elements that appear twice in this array.
 
 Could you do it without extra space and in O(n) runtime?
 
 Example:
 Input:
 [4,3,2,7,8,2,3,1]
 
 Output:
 [2,3]
 */

func findDuplicates(_ nums: [Int]) -> [Int] {
    
    var occDict = [Int:Int]()
    var resultArr = [Int]()
    for num in nums {
        if occDict[num] == nil {
            occDict[num] = 1
        } else {
            resultArr.append(num)
        }
    }
    return resultArr
}

findDuplicates([4,3,2,7,8,2,3,1])

//==============================================================================

/*
 912. Sort an Array
 Medium
 
 Given an array of integers nums, sort the array in ascending order.
 
 Example 1:
 
 Input: nums = [5,2,3,1]
 Output: [1,2,3,5]
 Example 2:
 
 Input: nums = [5,1,1,2,0,0]
 Output: [0,0,1,1,2,5]
 */

func sortArray(_ nums: [Int]) -> [Int] {
    var varArr = nums
    quicksortLomuto(&varArr, low: 0, high: varArr.count - 1)
    return varArr
}

func lomutoPartition(_ arr: inout [Int], low: Int, high: Int) -> Int {
    
    let pivot = arr[high]
    var i = low
    
    // iterate through the array using j variable as our marker
    
    for j in low..<high {
        if arr[j] <= pivot {
            // swap and increment i
            arr.swapAt(i, j)
            i += 1
        }
    }
    arr.swapAt(i, high)
    return i
}

func quicksortLomuto(_ arr: inout [Int], low: Int, high: Int) {
    if low < high {
        // get a new pivot
        let pivot = lomutoPartition(&arr, low: low, high: high)
        // recursive calls
        // left array
        quicksortLomuto(&arr, low: low, high: pivot - 1)
        // right array
        quicksortLomuto(&arr, low: pivot + 1, high: high)
    }
}

sortArray([4,2,6,7,84,3,2,5])

//=============================================================================

/*
 525. Contiguous Array
 Medium
 
 Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.
 
 Example 1:
 Input: [0,1]
 Output: 2
 Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
 
 Example 2:
 Input: [0,1,0]
 Output: 2
 Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
 */

func findMaxLength(_ nums: [Int]) -> Int {
    var count = 0
    var maxLength = 0
    var freqDict = [Int: Int]() // [count: index]
    freqDict[0] = -1
    // if we have seen the count before we are looking at the contiguous subarray
    for (currentIndex, num) in nums.enumerated() {
        if num == 0 {
            count -= 1
        } else {
            count += 1
        }
        // keep track of seen counts and indices
        if let firstSeenIndex = freqDict[count] {
            maxLength = max(maxLength, currentIndex - firstSeenIndex)
        } else {
            freqDict[count] = currentIndex // first time we have seen this count
        }
    }
    return maxLength
}

findMaxLength([0,1,0])

//==========================================================================

/*
 443. String Compression
 Medium

 Given an array of characters chars, compress it using the following algorithm:

 Begin with an empty string s. For each group of consecutive repeating characters in chars:

 If the group's length is 1, append the character to s.
 Otherwise, append the character followed by the group's length.
 The compressed string s should not be returned separately, but instead be stored in the input character array chars. Note that group lengths that are 10 or longer will be split into multiple characters in chars.

 After you are done modifying the input array, return the new length of the array.

  
 Follow up:
 Could you solve it using only O(1) extra space?

  

 Example 1:

 Input: chars = ["a","a","b","b","c","c","c"]
 Output: Return 6, and the first 6 characters of the input array should be: ["a","2","b","2","c","3"]
 Explanation: The groups are "aa", "bb", and "ccc". This compresses to "a2b2c3".
 Example 2:

 Input: chars = ["a"]
 Output: Return 1, and the first character of the input array should be: ["a"]
 Explanation: The only group is "a", which remains uncompressed since it's a single character.
 Example 3:

 Input: chars = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]
 Output: Return 4, and the first 4 characters of the input array should be: ["a","b","1","2"].
 Explanation: The groups are "a" and "bbbbbbbbbbbb". This compresses to "ab12".
 Example 4:

 Input: chars = ["a","a","a","b","b","a","a"]
 Output: Return 6, and the first 6 characters of the input array should be: ["a","3","b","2","a","2"].
 Explanation: The groups are "aaa", "bb", and "aa". This compresses to "a3b2a2". Note that each group is independent even if two groups have the same character.
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
var arrToCompress: [Character] = ["a","a","a","b","b","a","a"]
compress(&arrToCompress)

//===============================================================================

/*
 189. Rotate Array
 Medium

 Given an array, rotate the array to the right by k steps, where k is non-negative.

 Follow up:

 Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
 Could you do it in-place with O(1) extra space?
  

 Example 1:

 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 Example 2:

 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
 */

func rotate(_ nums: inout [Int], _ k: Int) {
        
   let times = k % nums.count

    nums = Array(nums[nums.count-times..<nums.count]) + Array(nums[0..<nums.count-times])
}

var rotateArr = [1,2,3,4,5,6,7]
rotate(&rotateArr, 3)
