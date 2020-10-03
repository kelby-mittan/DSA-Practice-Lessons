import UIKit

// Binary Tree
        // definition: At most can have 2 children
// Depth-first traversal

/*
 
 1. in-order
 2. pre-order
 3. post-order
 
 */
/*
                       1
                    /     \
                   2       3
                  / \     / \
                 4   5   6   7
                        /
                       8
                        \
                         9
 */

// implement a binary tree node...
class BinaryTreeNode<S> {
    var value: S
    var leftChild: BinaryTreeNode? // this is a class
    var rightChild: BinaryTreeNode? // and its optional so it has a value of nil because its of type class BinaryTreeNode
    
    init(_ value: S){
        self.value = value
    }
}

extension BinaryTreeNode {
    // in order traversal
    // rules
    
    /*
     visit left child recursively
     visit node
     visit right child recursively
     */
    
    func inOrderTraversal(visit: (BinaryTreeNode) -> () ) {
        // this is a visit closure
        leftChild?.inOrderTraversal(visit: visit) // keep calling untill there is nothing left on the left side then move on to right
        visit(self)
        rightChild?.inOrderTraversal(visit: visit)
        
    }
    
    //  closures captures values (stores them for use a call time)
    func preOrderTraversal(visit: (BinaryTreeNode) -> () ){
        visit(self)
        leftChild?.preOrderTraversal(visit: visit)
        rightChild?.preOrderTraversal(visit: visit)
    }
    
    
    func postOrderTraversal(visit: (BinaryTreeNode) -> () ){
        leftChild?.postOrderTraversal(visit: visit)
        rightChild?.postOrderTraversal(visit: visit)
        visit(self)
    }
    
    
    
    
}// end of class

// create a tree
let treeNode = BinaryTreeNode<Int>(1)
let twoNode = BinaryTreeNode<Int>(2)
let threeNode = BinaryTreeNode<Int>(3)
let fourNode = BinaryTreeNode<Int>(4)
let fiveNode = BinaryTreeNode<Int>(5)
// more nodes
let sixNode = BinaryTreeNode<Int>(6)
let sevenNode = BinaryTreeNode<Int>(7)
let eightNode = BinaryTreeNode<Int>(8)
let nineNode = BinaryTreeNode<Int>(9)
let tenNode = BinaryTreeNode<Int>(10)

treeNode.leftChild = twoNode
treeNode.rightChild = threeNode
twoNode.leftChild = fourNode
twoNode.rightChild = fiveNode
threeNode.leftChild = sixNode
threeNode.rightChild = sevenNode
sixNode.leftChild = eightNode
eightNode.rightChild = nineNode

// test in order
// expectedOutput = 4, 2, 5, 1, 3

print("In order Traversal: below ")
treeNode.inOrderTraversal { (node) in
    // another closure that says what to do with the values
    print(node.value, terminator: " ")
}

print("\n")


// test pre order traversal
print("preOrder Traversal")
treeNode.preOrderTraversal { (node) in
    print(node.value, terminator: " ")
}

print("\n")


// test post order traversal
print("post order traversal")
treeNode.postOrderTraversal { (node) in
    print(node.value, terminator: " ")
}

print("\n")

func maxDepth(_ root: BinaryTreeNode<Int>?) -> Int {
    if root == nil {
        return 0
    }
    let left = maxDepth(root!.leftChild)
    let right = maxDepth(root!.rightChild)
    return 1 + max(left,right)
}

maxDepth(eightNode)

func minimum(_ tree: BinaryTreeNode<Int>?) -> Int {
    var node = tree!
    
    while let left = node.leftChild {
        node = left
    }
    
    return node.value
}

minimum(treeNode)

func maximum(_ tree: BinaryTreeNode<Int>?) -> Int {
    var node = tree!
    
    while let right = node.rightChild {
        node = right
    }
    
    return node.value
}

maximum(treeNode)

func height(_ tree: BinaryTreeNode<Int>?) -> Int {
    if tree?.leftChild == nil && tree?.rightChild == nil {
        return 0
    } else {
        return 1 + max(height(tree?.leftChild), height(tree?.rightChild))
    }
}

height(eightNode)


func insert(_ root: BinaryTreeNode<Int>, _ node: BinaryTreeNode<Int>) {
    if root.value > node.value {
        if let leftNode = root.leftChild {
            insert(leftNode, node)
        } else {
            root.leftChild = node
        }
    } else {
        if let rightNode = root.rightChild {
            insert(rightNode, node)
        } else {
            root.rightChild = node
        }
    }
}

insert(sevenNode, tenNode)

treeNode.inOrderTraversal { (node) in
    // another closure that says what to do with the values
    print(node.value, terminator: " ")
}

/*
 938. Range Sum of BST
 Easy

 Given the root node of a binary search tree, return the sum of values of all nodes with value between L and R (inclusive).

 The binary search tree is guaranteed to have unique values.

  

 Example 1:

 Input: root = [10,5,15,3,7,null,18], L = 7, R = 15
 Output: 32
 Example 2:

 Input: root = [10,5,15,3,7,13,18,1,null,6], L = 6, R = 10
 Output: 23
 */

func rangeSumBST(_ root: BinaryTreeNode<Int>?, _ L: Int, _ R: Int) -> Int {
    
    var sum = 0
    guard let node = root else { return sum }
    if L <= node.value &&  node.value <= R {
        sum += node.value
    }
    if L < node.value {
        sum = sum + rangeSumBST(node.leftChild, L, R)
    }
    if node.value < R {
        sum = sum + rangeSumBST(node.rightChild, L, R)
    }

    return sum
}
