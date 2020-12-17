//: [Previous](@previous)

import Foundation

/*
 1302. Deepest Leaves Sum
 Medium
 
 Given a binary tree, return the sum of values of its deepest leaves.
 
 Example 1:
 
 Input: root = [1,2,3,4,5,null,6,7,null,null,null,null,8]
 Output: 15
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

func deepestLeavesSum(_ root: TreeNode?) -> Int {
    var arr = [Int]()
    let depth = 0
    var maxDepth = 0
    traverse(root, depth, &maxDepth, &arr)
    return arr.reduce(0, +)
}

func traverse(_ root: TreeNode?, _ depth: Int, _ maxDepth: inout Int, _ arr: inout [Int]) {
    
    if root == nil {
        return
    }
    
    if depth > maxDepth {
        arr.removeAll()
        arr.append(root!.val)
    } else if depth == maxDepth {
        arr.append(root!.val)
    }
    maxDepth = max(maxDepth, depth)
    
    traverse(root?.left, depth + 1, &maxDepth, &arr)
    traverse(root?.right, depth + 1, &maxDepth, &arr)
    
}
