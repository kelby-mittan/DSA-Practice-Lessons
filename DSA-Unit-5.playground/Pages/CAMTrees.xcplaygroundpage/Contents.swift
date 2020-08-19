//: [Previous](@previous)

import Foundation
/*
 Trees
 
 - There is a binary search tree.
 - Children + Parents + Grand Parents
 - Nodes
 - Balancing
 
 - Nodes
    - Like a linked list, a tree is composed of nodes.
    - There are special types of nodes:
        - root: The origin node, is the root of the tree.
        - leaves: A node without any children is called a leaf.
 
            2 <- Root
           / \
   Leaf   3   5
              |
              7 <- Leaf
 
- Parent / Child relationship + Hierarchy:
    - Every node has exactly one parent. With the exception of the root.
    - In a general tree, there is no limit on the number of children that a node can have.
    - There are exceptions. For example, a binary tree can have at most two children.
    - Example:
                           Depth   0              Drinks
                                                 /      \
                           Depth   1           Hot      Cold
                                             /  |  \     |  \
                           Depth   2  Tea Coffee Cocoa  Water Juice
 
 - Traversing through Trees:
    - Depth First
    - Breadth First / Level Order Traversal
 
    - Depth First:
        - Visit each node until all paths are exhausted (until each node is visited).
        - Accomplished with recursion.
 
    - Breadth First:
        - A lateral approach to visiting each node.
        - Start from the root, and visit each level in order from left to right.
        - Uses a Queue.
 
 - Binary Trees:
    - They can have at most two children.
    - Because of the above property, binary trees have access to three types of depth first traversal:
        - In-order
        - Post-order
        - Pre-order
    - Breadth First traversal is also possible.
    
 */
class Queue<T> {
    
    private var queueueueueueueue: [T] = []
    
    public var isEmpty: Bool {
        return queueueueueueueue.isEmpty
    }
    
    public var peek: T? {
        return queueueueueueueue.first
    }
    
    public func enqueue(_ element: T) {
        queueueueueueueue.append(element)
    }
    
    @discardableResult
    public func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return queueueueueueueue.removeFirst()
    }
}
class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
}
extension TreeNode {
    
    public func depthTraversal(_ visit: (TreeNode) -> ()) {
        visit(self)
        for child in children {
            child.depthTraversal(visit)
        }
    }
    
    public func breadthTraversal(_ visit: (TreeNode) -> ()) {
        visit(self)
        let childQueue = Queue<TreeNode>()
        children.map{ childQueue.enqueue($0) }
        
        while let poppedChild = childQueue.dequeue() {
            visit(poppedChild)
            poppedChild.children.map{ childQueue.enqueue($0) }
        }
    }
    
}
var root = TreeNode<String>("Maitree")
var cheltree = TreeNode<String>("Cheltree")
var keltree = TreeNode<String>("Keltree")
var brentree = TreeNode<String>("Brentree")
var camtree = TreeNode<String>("Camtree")
var jaheetree = TreeNode<String>("Jaheetree")
var tantree = TreeNode<String>("Tantree")
var tiffatree = TreeNode<String>("Tiffatree")
var juantree = TreeNode<String>("Juantree")
var lutree = TreeNode<String>("Lutree")
var yulitree = TreeNode<String>("Yulitree")
root.children.append(cheltree)
root.children.append(keltree)
keltree.children.append(brentree)
keltree.children.append(camtree)
keltree.children.append(jaheetree)
keltree.children.append(tantree)
keltree.children.append(tiffatree)
cheltree.children.append(juantree)
cheltree.children.append(lutree)
cheltree.children.append(yulitree)
//root.depthTraversal { (node) in
//    print(node.value)
//}
//root.breadthTraversal { (node) in
//    print(node.value)
//}
/*
                                Maitree
                                /     \
                            Cheltree  Keltree
                            / | |    / | | | \
                           J  L Y   B  C J Ta Ti
*/
class BinaryTreeNode<T> {
    
    public var value: T
    public var leftChild: BinaryTreeNode?
    public var rightChild: BinaryTreeNode?
    
    init(_ value: T) {
        self.value = value
    }
}
extension BinaryTreeNode {
    
    public func breadthFirstTraversal(_ visit: (BinaryTreeNode?) -> ()) {
        
        visit(self)
        let childQueue = Queue<BinaryTreeNode>()
        childQueue.enqueue(self)
        
        while let poppedChild = childQueue.dequeue() {
            
            if let left = poppedChild.leftChild {
                visit(left)
                childQueue.enqueue(left)
            }
            
            if let right = poppedChild.rightChild {
                visit(right)
                childQueue.enqueue(right)
            }
            
        }
    }
    
    public func preOrderTraversal(_ visit: (BinaryTreeNode?) -> ()) {
        visit(self)
        leftChild?.preOrderTraversal(visit)
        rightChild?.preOrderTraversal(visit)
    }
    
    public func inOrderTraversal(_ visit: (BinaryTreeNode?) -> ()) {
        leftChild?.inOrderTraversal(visit)
        visit(self)
        rightChild?.inOrderTraversal(visit)
    }
    
    public func postOrderTraversal(_ visit: (BinaryTreeNode?) -> ()) {
        leftChild?.postOrderTraversal(visit)
        rightChild?.postOrderTraversal(visit)
        visit(self)
    }
    
}
/*
                     Maitree
                     /     \
                 Cheltree  Keltree
                 /  |      /      \
                J   L     B       Ti
 
 Pre-order Traversal: Self -> Left -> Right
 In-order Traversal: Left -> Self -> Right
 Post-order Traversal: Left -> Right -> Self
 */
/*
 In-order traversal for above tree:
 Maitree.leftChild
 Cheltree.leftChild
 Juantree.leftChild == nil
 Juantree.self
 Juantree.rightChild == nil
 Cheltree.self
 Cheltree.rightChild
 Lutree.leftChild == nil
 Lutree.self
 Lutree.rightChild == nil
 Maitree.self
 Maitree.rightChild
 Keltree.leftChild
 BrenTree.leftChild == nil
 BrenTree.self
 BrenTree.rightChild == nil
 KelTree.self
 KelTree.rightChild
 TiffaTree.leftChild == nil
 TiffaTree.self
 TiffaTree.rightChild == nil
 */

