//: [Previous](@previous)

import Foundation

class BinarySearchTree {
    
    // MARK: - Properties
    
    var value: Int
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    var parent: BinarySearchTree?
    
    var isLeaf: Bool {
        return right == nil && left == nil
    }
    
    var isLeft: Bool {
        return value < parent!.value
    }
    
    var isRight: Bool {
        return value > parent!.value
    }
    
    var hasRight: Bool {
        return right != nil
    }
    
    var hasLeft: Bool {
        return left != nil
    }
    
    var hasOneChild: Bool {
        return hasRight || hasLeft
    }
    
    var hasTwoChildren: Bool {
        return hasRight && hasLeft
    }
    
    // MARK: - Init
    
    init(value: Int) {
        self.value = value
    }
}

// MARK: - Insert Value
extension BinarySearchTree {
    
    func insert(value: Int) {
        insert(value: value, parent: self)
    }
    
    func insert(values: [Int]) {
        values.forEach { (value) in
            insert(value: value)
        }
    }
    
    private func insert(value: Int, parent: BinarySearchTree?) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
}

// MARK: - Search
extension BinarySearchTree {
    
    func searchAndReturnTree(forValue value: Int) -> BinarySearchTree? {
        if value == self.value {
            return self
        }
        
        if value < self.value {
            guard let left = left else { return nil }
            return left.searchAndReturnTree(forValue: value)
        } else {
            guard let right = right else { return nil }
            return right.searchAndReturnTree(forValue: value)
        }
    }
    
    func search(forValue value: Int) -> Bool {
        if value == self.value {
            return true
        }
        
        if value < self.value {
            guard let left = left else { return false }
            return left.search(forValue: value)
        } else {
            guard let right = right else { return false }
            return right.search(forValue: value)
        }
    }
}

// MARK: - Min/Max/Height
extension BinarySearchTree {
    
    func minimum() -> BinarySearchTree {
        var node = self
        
        while node.left != nil {
            node = node.left!
        }
        return node
    }
    
    func maximum() -> BinarySearchTree {
        var node = self
        
        while node.right != nil {
            node = node.right!
        }
        return node
    }
    
    func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    func depth(ofValue value: Int) -> Int {
        var depth = 0
        
        guard var tree = searchAndReturnTree(forValue: value) else { return depth }
        
        while let parent = tree.parent {
            tree = parent
            depth += 1
        }
        
        return depth
    }
}

// MARK: - Delete
extension BinarySearchTree {
    
    func remove(value: Int) {
        guard let tree = searchAndReturnTree(forValue: value) else { return }
        
        if tree.hasTwoChildren {
            tree.removeNodeWithTwoChildren(tree: tree)
            return
        }
        
        if tree.hasOneChild {
            tree.removeNodeWithOneChild(tree: tree)
            return
        }
        
        if tree.isLeaf {
            tree.removeLeaf(tree: tree)
            return
        }
    }
    
    private func removeLeaf(tree: BinarySearchTree) {
        if tree.isLeft {
            tree.parent?.left = nil
        } else {
            tree.parent?.right = nil
        }
    }
    
    private func removeNodeWithOneChild(tree: BinarySearchTree) {
        if tree.isLeft {
            if tree.hasLeft {
                tree.parent?.left = tree.left
            } else {
                tree.parent?.left = tree.right
            }
        }
        if tree.isRight {
            if tree.hasLeft {
                tree.parent?.right = tree.left
            } else {
                tree.parent?.right = tree.right
            }
        }
    }
    
    private func removeNodeWithTwoChildren(tree: BinarySearchTree) {
        guard let replacementTree = searchAndReturnTree(forValue: (tree.right?.minimum().value)!) else { return }
        replaceNode(withTree: replacementTree, parentTree: tree)
    }
    
    private func replaceNode(withTree tree: BinarySearchTree, parentTree: BinarySearchTree) {
        if parentTree.isLeft {
            if tree.parent?.value == parentTree.value {
                parentTree.parent?.left = tree
                tree.left = parentTree.left
            } else {
                tree.parent?.left = nil
                tree.right = parentTree.right
                tree.left = parentTree.left
                parentTree.parent?.left = tree
            }
        } else {
            if tree.parent?.value == parentTree.value {
                parentTree.parent?.right = tree
                tree.left = parentTree.left
            } else {
                tree.parent?.left = nil
                tree.right = parentTree.right
                tree.left = parentTree.left
                parentTree.parent?.right = tree
            }
        }
    }
}

// MARK: - Traversal
extension BinarySearchTree {
    
    // left -> root -> right
    func inOrderTraversal() -> [Int] {
        var resultArray = [Int]()
        
        if let left = left {
            resultArray += left.inOrderTraversal()
        }
        
        resultArray.append(self.value)
        
        if let right = right {
            resultArray += right.inOrderTraversal()
        }
        return resultArray
    }
    
    // root -> left -> right
    func preOrderTraversal() -> [Int] {
        var resultArray = [self.value]
        
        if let left = left {
            resultArray += left.preOrderTraversal()
        }
        
        if let right = right {
            resultArray += right.preOrderTraversal()
        }
        
        return resultArray
    }
    
    // left -> right -> root
    func postOrderTraversal() -> [Int] {
        var resultArray = [Int]()
        
        if let left = left {
            resultArray += left.postOrderTraversal()
        }
        
        if let right = right {
            resultArray += right.postOrderTraversal()
        }
        
        resultArray.append(value)
        
        return resultArray
    }
}


// MARK: - Description
extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        var text = ""
        
        if let left = left {
            text += "("
            text += left.description
            text += ") <- "
        }
        
        text += "\(value)"
        
        if let right = right {
            text += " -> ("
            text += right.description
            text += ")"
        }
        return text
    }
}

let values = [2,1,3,12,9,21,19,25]

let tree = BinarySearchTree(value: 7)
tree.insert(value: 2)
tree.insert(value: 1)
tree.insert(value: 4)
tree.insert(value: 3)
tree.insert(value: 5)
tree.insert(value: 10)
tree.insert(value: 9)
tree.insert(value: 12)
tree.insert(value: 11)
tree.insert(value: 13)

tree.remove(value: 4)
print(tree.description)
