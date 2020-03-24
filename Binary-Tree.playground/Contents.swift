import UIKit

// Binary Tree - Abstract data type

// the components of a tree are the root node, the child node

// a node is referred to as a leaf if it does not have any children

// There are 2 ways to traverse a binary tree
// 1. Breadth-first traversal - uses a queue to keep track of visited nodes
// 2. Depth-first traversal: in-order, post-order, pre-order

class BinaryTreeNode<T> {
    var value: T
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    
    init(_ value: T) {
        self.value = value
    }
    
}

struct Queue<T> {
    private var elements = [T]()
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public var peek: T? {
        return elements.first
    }
    
    public mutating func enqueue(_ item: T) {
        elements.append(item) // O(1)
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return elements.removeFirst() // O(n)
    }
}

/*
        root
          1
        /   \
        2    3
       / \
      4   5
 */

let rootNode = BinaryTreeNode<Int>(1)
let twoNode = BinaryTreeNode<Int>(2)
let threeNode = BinaryTreeNode<Int>(3)
let fourNode = BinaryTreeNode<Int>(4)
let fiveNode = BinaryTreeNode<Int>(5)

rootNode.leftChild = twoNode
rootNode.rightChild = threeNode
twoNode.leftChild = fourNode
twoNode.rightChild = fiveNode

/*
       root
         1
       /   \
       2    3
      / \
     4   5
*/

extension BinaryTreeNode {
    
    func breadthFirstTraversal(visit: (BinaryTreeNode) -> ()) {
        // using queue to keep track of nodes as they are visited
        var queue = Queue<BinaryTreeNode>()
        visit(self) // self represents the root node
        
        queue.enqueue(self) // add the root node to the queue
        
        while let node = queue.dequeue() {
            // check for left child and enqueue as needed
            if let leftChild = node.leftChild { // using optional binding
                visit(leftChild)
                queue.enqueue(leftChild)
            }
            // check for right child and enqueue as needed
            if let rightChild = node.rightChild { // using optional binding
                visit(rightChild)
                queue.enqueue(rightChild)
            }
        }
        
    }
}

// test out breadth-first traversal
print("breadth first traversal")
rootNode.breadthFirstTraversal { (node) in
    print(node.value, terminator: "->")
}
print("\n")


