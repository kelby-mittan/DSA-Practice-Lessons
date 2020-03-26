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
                   / \
                  2   3
                 / \
                4   5
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

treeNode.leftChild = twoNode
treeNode.rightChild = threeNode
twoNode.leftChild = fourNode
twoNode.rightChild = fiveNode
threeNode.leftChild = sixNode
threeNode.rightChild = sevenNode

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
