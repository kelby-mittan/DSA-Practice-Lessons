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
