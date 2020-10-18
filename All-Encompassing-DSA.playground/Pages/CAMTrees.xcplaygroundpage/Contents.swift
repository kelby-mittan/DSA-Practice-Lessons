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
    
    private var queue: [T] = []
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public var peek: T? {
        return queue.first
    }
    
    public func enqueue(_ element: T) {
        queue.append(element)
    }
    
    @discardableResult
    public func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return queue.removeFirst()
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

/*
 Binary Search Trees
 
 - Binary Trees
 - Each node can have at most two children.
 - Children have parents.
 
 - Properties of binary search trees
 - Left child values are less than parent node value.
 - Right child values are greater than or equal to parent node value.
 - The values in a binary search tree must be comparable!!!.!
 
 - Three common methods of a binary search tree:
 - Insert
 - Remove
 - Search / Contains
 
 - Why a binary search tree?
 - All of the above methods can be performed with a runtime of O(log n). This is ideal. We want this.
 
 - Removal / Deletion / Obliteration
 - Three cases:
 - Removal of a leaf node.
 - Removal of a node with one child.
 - Removal of a node with two children.
 
 */

class BinaryNode<T> {
    
    var value: T
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(_ value: T){
        self.value = value
    }
    
}

extension BinaryNode: CustomStringConvertible {
    
    public func inOrderTraversal(_ visit: (BinaryNode) -> ()) {
        leftChild?.inOrderTraversal(visit)
        visit(self)
        rightChild?.inOrderTraversal(visit)
    }
    
    public var minimum: T {
        return leftChild?.minimum ?? self.value
    }
    
    public var description: String {
        var str = ""
        if let left = leftChild {
            str += "(\(left.description) <- "
        }
        str += "\(value)"
        if let right = rightChild {
            str += " -> (\(right.description))"
        }
        return str
    }
    
}

// Values must be comparable
struct BinarySearchTree<T: Comparable> {
    
    // The root of our tree
    private (set) var root: BinaryNode<T>?
    
    // Not Necessary
    init() {}
    
    // Public function that can be called
    public mutating func insert(_ value: T) {
        root = insert(root, value)
    }
    
    // Helper function for insertion of binary node
    private func insert(_ node: BinaryNode<T>?, _ value: T) -> BinaryNode<T> {
        
        // We reached the destination to place the new node.
        guard let node = node else { return BinaryNode<T>(value) }
        
        // The value we are inserting is less than the value of the node we are currently at.
        if value < node.value {
            node.leftChild = insert(node.leftChild, value)
        } else { // The value we are inserting is greater than or equal to the value of the node we are currently at.
            node.rightChild = insert(node.rightChild, value)
        }
        
        return node
    }
    //
    //    // Runtime is O(n)
    //    public func contains(_ value: T) -> Bool {
    //
    //        var exists = false // By default the value does not exist.
    //
    //        // Visits all nodes in the tree to see if the value exists.
    //        root?.inOrderTraversal({ (node) in
    //            if node.value == value {
    //                exists = true // Found the value.
    //            }
    //        })
    //
    //        return exists
    //    }
    
    // Runtime is O(log n)
    public func betterContains(_ value: T) -> Bool {
        
        // Start at the beginning
        var currentNode = root
        
        // Continue searching as long as currentNode exists.
        while let node = currentNode {
            
            if node.value == value { // Found the value we are looking for
                return true
            }
            
            // Value we are looking for is less than the current value. Go left.
            if value < node.value {
                currentNode = node.leftChild
            } else { // Value we are looking for is greater than or equal to the current value. Go right.
                currentNode = node.rightChild
            }
            
        }
        // We failed to find the value
        return false
        
    }
    
    public mutating func removeNode(_ value: T) {
        root = removeNode(root, value)
    }
    
    private func removeNode(_ node: BinaryNode<T>?, _ value: T) -> BinaryNode<T>? {
        
        guard let node = node else { return nil }
        
        // We found the node we want to remove
        if node.value == value {
            // Case 1: Removal of a leaf node
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            } else if node.leftChild == nil { // Case 2a: Node has right child
                return node.rightChild
            } else if node.rightChild == nil { // Case 2b:  Node has left child
                return node.leftChild
            } else { // Case 3: Node has two children
                if let right = node.rightChild {
                    node.value = right.minimum
                    node.rightChild = removeNode(node.rightChild, node.value)
                }
            }
        } else if value < node.value { // The value we are searching for is less than the value of the current node.
            node.leftChild = removeNode(node.leftChild, value)
        } else { // The value we are searching for is greater than or equal to the value of the current node.
            node.rightChild = removeNode(node.rightChild, value)
        }
        
        return node
    }
    
    public func printTree() -> String {
        return root?.description ?? "Tree is Nil"
    }
    
    
}

/*
 
 First call to remove (root, 64)
 - root.value = 12
 - root.rightChild = remove(root.rightChild, 64) => root.rightChild
 Second call to remove (root.rightChild, 64)
 - root.rightChild.value = 14
 - root.rightChild = remove(root.rightChild.rightChild, 64) => root.rightChild.rightChild
 Third call to remove (root.rightChild.rightChild, 64)
 - root.rightChild.rightChild.value = 23
 - root.rightChild.rightChild = remove(493Node, 64) => 493Node
 Fourth call to remove (493Node, 64)
 - 493Node.value = 493
 - 493Node.leftChild = remove(node64, 64) => nil
 Fifth call to remove (Node64, 64)
 - node64.value = 64
 - return nil
 
 */

/* Insertion
 12
 /  \
 14
 /  \
 23
 /  \
 493
 /  \
 64  503
 */

var tree = BinarySearchTree<Int>()

tree.insert(12)
tree.insert(14)
tree.insert(23)
tree.insert(493)
tree.insert(64)
tree.insert(503)
tree.insert(11)
tree.insert(10)
tree.insert(4)

tree.root?.inOrderTraversal({ (node) in
    print(node.value, terminator: " ")
})
print("")
print(tree.printTree())

//tree.removeNode(64)
//tree.removeNode(12)
print(tree.printTree())


