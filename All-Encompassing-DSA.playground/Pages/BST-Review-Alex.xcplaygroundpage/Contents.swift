//: [Previous](@previous)

import Foundation

class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    init(_ value: Int) {
        self.value = value
    }
}

/*
          10
         /  \
       7     13
     /  \   /  \
    5    9 11   16
 */

// insert
@discardableResult
func insert(_ root: BinaryTreeNode?, _ value: Int) -> BinaryTreeNode? {
    let newNode = BinaryTreeNode(value)
    guard let root = root else { return newNode }
    if value < root.value {
        if root.left == nil {
            root.left = newNode
        } else {
            return insert(root.left, value)
        }
    } else if value > root.value {
        if root.right == nil {
            root.right = newNode
        } else {
            return insert(root.right, value)
        }
    }
    return root
}

// in-order traversal
func inOrderTraversal(_ root: BinaryTreeNode?) {
    guard let root = root else { return }
    inOrderTraversal(root.left)
    print(root.value, terminator: " ")
    inOrderTraversal(root.right)
}

// search
func search(_ root: BinaryTreeNode?, _ value: Int) -> Bool {
    guard let root = root else { return false }
    if value == root.value {
        return true
    } else if value < root.value {
        return search(root.left, value)
    } else if value > root.value {
        return search(root.right, value)
    }
    return false
}

// test binary search tree functionality

/*
      10
     /  \
    7     13
   /  \   /  \
  5    9 11   16
 */

let rootNode = insert(nil, 10)
insert(rootNode, 7)
insert(rootNode, 13)
insert(rootNode, 5)
insert(rootNode, 9)
insert(rootNode, 11)
insert(rootNode, 16)

// test insert and in-order traversal
print("in-order traversal after inserting nodes")
inOrderTraversal(rootNode) // 5 7 9 10 11 13 16
print("\n")

// test search
print("searching...")
print(search(rootNode, 7)) // true
print(search(rootNode, 0)) // false
