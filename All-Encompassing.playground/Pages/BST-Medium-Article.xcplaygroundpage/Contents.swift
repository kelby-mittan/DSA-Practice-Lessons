
import Foundation

// Medium - https://medium.com/nickelfox/binary-search-tree-in-swift-9158aadbe6a3

class TreeNode<T: CustomStringConvertible> {
    
    var value: T
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    
    init(value: T,
         leftNode: TreeNode? = nil,
         rightNode: TreeNode? = nil) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

class BinaryTree<T: Comparable & CustomStringConvertible> {
    
    var rootNode: TreeNode<T>?
    
    func insert(element: T) {
        let node = TreeNode(value: element)
        if let rootNode = self.rootNode {
            self.insertHelper(rootNode, node)
        } else {
            self.rootNode = node
        }
    }
    
    // RECURSIVE FUNCTION
    private func insertHelper(_ rootNode: TreeNode<T>, _ node: TreeNode<T>) {
        if rootNode.value > node.value {
            if let leftNode = rootNode.leftNode {
                self.insertHelper(leftNode, node)
            } else {
                rootNode.leftNode = node
            }
        } else {
            if let rightNode = rootNode.rightNode {
                self.insertHelper(rightNode, node)
            } else {
                rootNode.rightNode = node
            }
        }
    }
}

extension BinaryTree {
    
    func traverse() {
        print("\nPRE-ORDER TRAVERSE")
        self.preorder(self.rootNode)
        print("\n\nIN-ORDER TRAVERSE")
        self.inorder(self.rootNode)
        print("\n\nPOST-ORDER TRAVERSE")
        self.postorder(self.rootNode)
        print("\n")
    }
    
    // NOTE : LEFT IS ALWAYS LEFT OF RIGHT
    // NLR : NODE(i.e. Root/Parent Node) LEFT RIGHT
    
    // LNR : LEFT NODE RIGHT
    private func inorder(_ node: TreeNode<T>?) {
        guard let _ = node else { return }
        inorder(node?.leftNode)
        print("\(node!.value)", terminator: " ")
        inorder(node?.rightNode)
    }
    
    // NLR : NODE LEFT RIGHT
    private func preorder(_ node: TreeNode<T>?) {
        guard let _ = node else { return }
        print("\(node!.value)", terminator: " ")
        preorder(node?.leftNode)
        preorder(node?.rightNode)
    }
    
    // LRN :  LEFT RIGHT NODE
    private func postorder(_ node: TreeNode<T>?) {
        guard let _ = node else { return }
        postorder(node?.leftNode)
        postorder(node?.rightNode)
        print("\(node!.value)", terminator: " ")
    }
}

extension BinaryTree {
    
    func search(element: T) -> Bool {
        return searchHelper(self.rootNode, element)
    }
    
     func searchHelper(_ rootNode: TreeNode<T>?, _ element: T) -> Bool {
                
//        guard let rootNode = rootNode else {
//            print("Not in tree: \(element)")
//            return false
//        }
//
//        print("ROOT NODE \(rootNode.data)")
//
//        if element > rootNode.data {
//            searchHelper(rootNode.rightNode, element)
//        } else if element < rootNode.data {
//            searchHelper(rootNode.leftNode, element)
//        } else {
//            print("In tree: \(rootNode.data)")
//        }
        
        guard let node = rootNode else { return false }
        if element == node.value { return true }
        if element < node.value {
            return searchHelper(node.leftNode, element)
        } else {
            return searchHelper(node.rightNode, element)
        }
        
//        return rootNode.data == element
    }
    
    func printTheTree() -> String {
        return rootNode?.description ?? ""
    }
}

extension TreeNode: CustomStringConvertible {
  public var description: String {
    var str = ""
    if let left = leftNode {
        str += "(\(left.description) <- "
    }
    str += "\(value)"
    if let right = rightNode {
      str += " -> (\(right.description))"
    }
    return str
  }
}

let tree = BinaryTree<String>()

tree.insert(element: "F")
tree.insert(element: "G")
tree.insert(element: "H")
tree.insert(element: "D")
tree.insert(element: "E")
tree.insert(element: "I")
tree.insert(element: "J")
tree.insert(element: "A")
tree.insert(element: "B")
tree.insert(element: "C")

tree.traverse()

tree.search(element: "Z")
print(tree.rootNode!.description)
let intTree = BinaryTree<Int>()

intTree.insert(element: 3)
intTree.insert(element: 2)
intTree.insert(element: 4)
intTree.insert(element: 5)
intTree.insert(element: 1)
intTree.insert(element: 100)
intTree.insert(element: 90)

print(intTree)

print(tree.printTheTree())
/**
  * Balanced Binary Search Tree
  */


//=================================================================================
//=================================================================================
//=================================================================================
//=================================================================================

class BinarySearchTree<T: Comparable> {
    public class Node<T: Comparable> {
      var val: T
      var left: Node?
      var right: Node?

      init(_ val: T) {
          self.val = val
      }
    }
    
    init() {}
    
    public var root: Node<T>?

    public func insert(_ val: T) {
      let newNode = Node(val)
      if root == nil {
        root = newNode
        return
      }
      // guard root != nil else { return }
      guard let validRoot = root else { return }

      insertHelper(validRoot, newNode)
      let balanceFactor = getBalanceFactor(validRoot)
      // if balanced, then we're done
      if abs(balanceFactor) <= 1 {
        return
      }
      rebalance(validRoot)
    }
    
    private func insertHelper(_ parent: Node<T>, _ node: Node<T>) {
        // look at the parent...
        if parent.val > node.val {
          if let newLeft = parent.left {
              insertHelper(newLeft, node)
          } else {
              parent.left = node
          }
        } else if parent.val < node.val {
            if let newRight = parent.right {
                insertHelper(newRight, node)
            } else {
                parent.right = node
            }
        }
        // if it's equal value, do nothing as the tree does not have duplicates
        
    }

    private func rotateLeft(_ node: Node<T>) -> Node<T>? {
        let newParent = node.right
      node.right = nil
        newParent?.left = node
      return newParent
    }

    private func rotateRight(_ node: Node<T>) -> Node<T>? {
      let newParent = node.left
      node.left = nil
        newParent?.right = node
      return newParent
    }

    private func getBalanceFactor(_ node: Node<T>?) -> Int {
      return getHeightHelper(node?.left) - getHeightHelper(node?.right)
    }

    private func rebalance(_ node: Node<T>) {
      // if the balance factor is -2,
        // rebalance the left side

        // if the left child has balance factor of 1
          // then rotate right around the right child
        // rotate left around the right child

      let balanceFactor = getBalanceFactor(node)
      if balanceFactor == -2 {
        let leftChildBalanceFactor = getBalanceFactor(node.left)
        if leftChildBalanceFactor == -1 {
          node.left = rotateLeft(node)
        }
        let newParent = rotateRight(node)
        if node === root {
          root = newParent
        }
      } else if balanceFactor == 2 {
        let rightChildBalanceFactor = getBalanceFactor(node.right)
        if rightChildBalanceFactor == -1 {
          node.right = rotateRight(node.right!)
        }
        let newParent = rotateLeft(node)
        if node === root {
          root = newParent
        }
      }
      // else the balanace factor is 2
        // rebalance the right side
        // if the right child has a balanace factor of -1
          // then rotate left around the left child
        // rotate right around the left child
    }
    
    func getNodeCount<T>(_ tree: BinarySearchTree<T>) -> Int {
      return 0
    }


    
    // public func getHeight() -> Int {
    //   return getHeightHelper(root, 0)
    // }

    public func getHeight() -> Int {
      return getHeightHelper(root)
    }

    // private func getHeightHelper(_ node: Node<T>?, _ height: Int) -> Int {
    //     // if node is nil then...
    //     // if the left and the right are nil then the height is 1
    //     // 1 + helper(node.left)
        
    //     if node == nil {
    //       return height
    //     }
        

    //     return max(
    //       getHeightHelper(node?.left, height + 1),
    //       getHeightHelper(node?.right, height + 1)
    //     )
    // }

    private func getHeightHelper(_ node: Node<T>?) -> Int {
      if node == nil {
        return 0
      }
      return 1 + max(
       getHeightHelper(node!.left), getHeightHelper(node!.right)
      )
    }

    // size (# of nodes)
    // insert
      // balance (heights of each branch are within n-1)
      // sort it (rotate as needed)
    // getRoot

    // depth_first_traverse (in order traversal)
    // bread_first_traverse
    
    public func printTree() -> String {
      var str = ""
      if let leftChild = root?.left?.val {
        str += "(\(leftChild)) <- "
      }
        str += "\(String(describing: root?.val))"
      if let rightChild = root?.right?.val {
        str += " -> (\(rightChild))"
      }
      return str
    }
    
    
    public func invertTree(_ root: Node<T>?) -> Node<T>? {
        guard let root = root else { return nil }
        
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        
        root.left = right
        root.right = left
        return root
    }
}

extension BinarySearchTree: CustomStringConvertible {
  public var description: String {
    var str = ""
    if let left = root?.left {
      str += "(\(left.val)) <- "
    }
    str += "\(String(describing: root?.val))"
    if let right = root?.right {
      str += " -> (\(right.val))"
    }
    return str
  }
    
//    var str = ""
//      if let left = leftNode {
//          str += "(\(left.description) <- "
//      }
//      str += "\(data)"
//      if let right = rightNode {
//        str += " -> (\(right.description))"
//      }
//      return str
//    }
}

let tree1 = BinarySearchTree<Int>()
tree1.getHeight() // 0
tree1.insert(1)
tree1.getHeight() // 1
tree1.insert(2)
tree1.getHeight() // 2
tree1.insert(3)

print(tree1.description) // 2
print(tree1.root!.left!.val) // 1
print(tree1.root!.right!.val) // 3

print(tree1.description)
// let expectation = """
//   2
//  / \
// 1   3
// """
// assert(b.toString() == expectation)

//    1
//     \
//      2
//       \
//        3


//    2  -2
//   /
//  1   1
//   \
//    3
