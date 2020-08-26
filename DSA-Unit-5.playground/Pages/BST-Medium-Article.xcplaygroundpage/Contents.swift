
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
