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

func delete(_ root: BinaryTreeNode?, _ value: Int) -> BinaryTreeNode? {
    // 1.
    // tree is empty return nil
    guard let root = root else { return nil }
    
    // 2.
    // value is less than root, delete and assign leftChild its new value
    if value < root.value {
        root.left = delete(root.left, value) // e.g returns nil to 7 node if deleting 5
    }
    
    // 3.
    // value is greater than root, delete and assign rightChild's its new value
    else if value > root.value {
        root.right = delete(root.right, value)
    }
    
    // 4.
    // value is equal to the roots value
    else {
        // 5.
        // one child
        if root.left == nil {
            return root.right
        } else if root.right == nil {
            return root.left
        }
        
        // 6.
        // two children
        // we use a helper function to get the in-order successor e.g if deleting 10 the in-order successor would be 11
        // we first copy the in-order succsssor to the root
        // then we delete the value we copied from the right subtree
        root.value = minValue(root.right)
        root.right = delete(root.right, root.value)
    }
    
    return root
}

func minValue(_ root: BinaryTreeNode?) -> Int {
    
    if root?.left == nil {
        return root?.value ?? 0
    }
    return minValue(root?.left)
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

minValue(rootNode)
delete(rootNode, 5)
// test insert and in-order traversal
print("in-order traversal after inserting nodes")
inOrderTraversal(rootNode) // 7 9 10 11 13 16
print("\n")

// test search
print("searching...")
print(search(rootNode, 7)) // true
print(search(rootNode, 0)) // false

func convertToBST(_ arr: [Int], _ low: Int, _ high: Int, _ root: BinaryTreeNode?) -> BinaryTreeNode? {
  // 1. - base case when we have one node
  if low > high {
    return root
  }
  // 2. - calculate the middle index
  let midIndex = (low + high) / 2
  
  // 3. - create the new root from the middle index
  let root = BinaryTreeNode(arr[midIndex])
  
  // 4. - recursively perform conversion on the left subtree
  root.left = convertToBST(arr, low, midIndex - 1, root.left)
  
  // 5. - recursively perform conversion on the right subtree
  root.right = convertToBST(arr, midIndex + 1, high, root.right)
  
  // 6. - return the converted BST
  return root
}

let arr = [3, 10, 7, 5, 1].sorted()
let bst = convertToBST(arr, 0, arr.count - 1, nil)
inOrderTraversal(bst) // 1 3 5 7 10
