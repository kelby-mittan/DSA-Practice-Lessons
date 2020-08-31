
import Foundation

// Medium - https://medium.com/nickelfox/binary-search-tree-in-swift-9158aadbe6a3

class TreeNode<T> {
    
    var data: T
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    
    init(data: T,
         leftNode: TreeNode? = nil,
         rightNode: TreeNode? = nil) {
        self.data = data
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

class BinaryTree<T: Comparable & CustomStringConvertible> {
    
    private var rootNode: TreeNode<T>?
    
    func insert(element: T) {
        let node = TreeNode(data: element)
        if let rootNode = self.rootNode {
            self.insertHelper(rootNode, node)
        } else {
            self.rootNode = node
        }
    }
    
    // RECURSIVE FUNCTION
    private func insertHelper(_ rootNode: TreeNode<T>, _ node: TreeNode<T>) {
        if rootNode.data > node.data {
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
        print("\(node!.data)", terminator: " ")
        inorder(node?.rightNode)
    }
    
    // NLR : NODE LEFT RIGHT
    private func preorder(_ node: TreeNode<T>?) {
        guard let _ = node else { return }
        print("\(node!.data)", terminator: " ")
        preorder(node?.leftNode)
        preorder(node?.rightNode)
    }
    
    // LRN :  LEFT RIGHT NODE
    private func postorder(_ node: TreeNode<T>?) {
        guard let _ = node else { return }
        postorder(node?.leftNode)
        postorder(node?.rightNode)
        print("\(node!.data)", terminator: " ")
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
        if element == node.data { return true }
        if element < node.data {
            return searchHelper(node.leftNode, element)
        } else {
            return searchHelper(node.rightNode, element)
        }
        
//        return rootNode.data == element
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


/**
  * Balanced Binary Search Tree
  */
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
}

let tree1 = BinarySearchTree<Int>()
tree1.getHeight() // 0
tree1.insert(1)
tree1.getHeight() // 1
tree1.insert(2)
tree1.getHeight() // 2
tree1.insert(3)

print(tree1.root!.val) // 2
print(tree1.root!.left!.val) // 1
print(tree1.root!.right!.val) // 3
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
