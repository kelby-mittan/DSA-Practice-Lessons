//: [Previous](@previous)

import Foundation

class Node<T: Comparable>: Equatable {
  var value: T
  var children: [Int: Node<T>] = [:]

  init(_ value: T, _ children: Node<T>?...) {  //variatic arguments
    self.value = value
    for i in 0..<children.count {
      guard let child = children[i] else {
        continue
      }
      self.children[i] = child
    }
  }

  var leftChild: Node<T>? {
    get { return self.children[0] }
    set { self.children[0] = newValue }
  }

  var rightChild: Node<T>? {
    get { return self.children[1] }
    set { self.children[1] = newValue }
  }

  static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
    return lhs.value == rhs.value && lhs.children == rhs.children
  }
}

class Tree<T: Comparable>: Equatable {
  static func == (lhs: Tree<T>, rhs: Tree<T>) -> Bool {
    return lhs.root == rhs.root
  }

  var root: Node<T>?
  init(_ root: Node<T>? = nil) {
    self.root = root
  }
}

//
// ALGORITHMS
//

func isBinaryTree<T>(_ tree: Tree<T>) -> Bool {
  guard let root = tree.root else {
    return false
  }
  return isBTreeHelper(root)
}

func isBTreeHelper<T>(_ node: Node<T>) -> Bool {
  print("got to the helper", node.value)
  if node.children.count > 2 {
    print("nodes children more than 2")
    return false
  }
  for (_, child) in node.children {
    if !isBTreeHelper(child) {
      return false
    }
  }
  return true
}

func isBinarySearchTree<T>(_ tree: Tree<T>) -> Bool {
  return isBSTHelper(tree.root)
}

func isBSTHelper<T>(_ node: Node<T>?) -> Bool {
  // base case
  guard let node = node else { return false }
  if node.children.count > 2 {
    return false
  }
  if let left = node.leftChild?.value {
    if left > node.value {
      return false
    }

  } else if let right = node.rightChild?.value {
    if right < node.value {
      return false
    }
  }
  // iterative step
  for (_, child) in node.children {
    if !isBSTHelper(child) {
      return false
    }
  }

  return true
}

func isBalancedBinarySearchTree<T>(_ tree: Tree<T>) -> Bool {
  return false
}

func getHeight<T>(_ tree: Tree<T>) -> Int {
  return getHeight(tree.root)
}

func getHeight<T>(_ node: Node<T>?) -> Int {  // function overloading
  guard let node = node else {
    return 0
  }

  var heights: [Int] = []
  for (_, child) in node.children {
    heights.append(getHeight(child))
  }
  return 1 + (heights.max() ?? 0)
}

func getNodeCount<T>(_ tree: Tree<T>) -> Int {
    return getNodeCount(tree.root?.leftChild) + getNodeCount(tree.root?.rightChild) + 1
}

func getNodeCount<T>(_ node: Node<T>?) -> Int {
  return 0
}

func balance<T>(_ tree: Tree<T>) {

}

func breadthFirstTraversal<T>(_ tree: Tree<T>, _ visit: ((T) -> Void)) {

}

func depthFirstPreOrderTraversal<T>(_ tree: Tree<T>, _ visit: ((T) -> Void)) {

}

func depthFirstInOrderTraversal<T>(_ tree: Tree<T>, _ visit: ((T) -> Void)) {

}

func depthFirstPostOrderTraversal<T>(_ tree: Tree<T>, _ visit: ((T) -> Void)) {

}

func prettyTreeString<T>(_ tree: Tree<T>) -> String {
    return tree.root?.description ?? "Tree is nil"
}

@discardableResult func balanceBinarySearchTree<T>(_ tree: Tree<T>) -> Tree<T> {
  return tree
}


extension Node: CustomStringConvertible {
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
