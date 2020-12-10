//: [Previous](@previous)

import Foundation

//=======================================================================
//                        STACKS
//=======================================================================

struct Stack<T: Equatable>: Equatable {
    private var elements = [T]()
    
    static func ==(lhs: Stack, rhs: Stack) -> Bool {
        return lhs.elements == rhs.elements
    }
    
    public var peek: T? {
        return elements.last
    }
    
    public var count: Int {
        return elements.count
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    // add to the top of the stack (end)
    public mutating func push(_ value: T) {
        elements.append(value) // O(1)
        
    }
    
    public mutating func pushB(_ value: T) {
        elements.insert(value, at: 0) // O(1)
        // is the location
    }
    // remove from the top of the stack
    public mutating func pop() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeLast() // O(1)
    }
    
}

//=======================================================================
//                        QUEUES
//=======================================================================

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
        elements.append(item)
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return elements.removeFirst()
    }
    
    public mutating func pop() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeLast() // O(1)
    }
}

//=======================================================================
//                     LINKED LISTS
//=======================================================================

class Node<T: Equatable>: Equatable {
    
    var value: T
    var next: Node? // singly linked list
    weak var previous: Node? // Doubly Linked List
    
    // required func for equatable
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value && lhs.next == rhs.next
    }
    
    init(_ value: T) {
        self.value = value
    }
    
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value) -> nil" // 12 -> nil
        }
        // if we have connected nodes
        return "\(value) -> \(next)"
    }
}

class LinkedList<T: Equatable> {
    var head: Node<T>?
    var tail: Node<T>?
    
    // first computed property
    public var first: Node<T>? {
        return head
    }
    
    // last computed property
    public var last: Node<T>? {
        return tail
    }
    
    // isEmpty
    public var isEmpty: Bool {
        return head == nil
    }
    
    // append method - adds a node to the end of the list
    public func append(_ value: T) {
        let newNode = Node(value)
        
        guard let lastNode = tail else {
            //empty list
            head = newNode
            tail = head
            return
        }
        lastNode.next = newNode
        tail = newNode
    }
    
    // removeLast method - removes the last node from the end of the list
    public func removeLast() -> Node<T>? {
        
        if isEmpty {
            return nil
        }
        
        var removedNode: Node<T>?
        
        if head == tail {
            removedNode = head
            head = nil
            tail = nil
            return removedNode
        }
        var currentNode = head
        while currentNode?.next != tail  {
            currentNode = currentNode?.next
        }
        
        removedNode = tail
        
        tail = currentNode
        currentNode?.next = nil
        
        return tail
    }
    
    
}

func reverse<T>(_ list: LinkedList<T>) -> Node<T>? {
    
    var prevNode: Node<T>? = nil
    var currentNode = list.head
    var nextNode = list.head?.next
    
    while nextNode != nil {
        currentNode?.next = prevNode
        prevNode = currentNode
        currentNode = nextNode
        nextNode = currentNode?.next
    }
    currentNode?.next = prevNode
    return currentNode
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "empty list"
        }
        return "\(head)"
    }
}

//=======================================================================
//                      BINARY TREES
//=======================================================================

class BinaryTreeNode<S> {
    var value: S
    var leftChild: BinaryTreeNode? // this is a class
    var rightChild: BinaryTreeNode? // and its optional so it has a value of nil because its of type class BinaryTreeNode
    
    init(_ value: S){
        self.value = value
    }
}

extension BinaryTreeNode {
    // in order traversal
    // rules
    
    /*
     visit left child recursively
     visit node
     visit right child recursively
     */
    
    func inOrderTraversal(visit: (BinaryTreeNode) -> () ) {
        // this is a visit closure
        leftChild?.inOrderTraversal(visit: visit) // keep calling until there is nothing left on the left side then move on to right
        visit(self)
        rightChild?.inOrderTraversal(visit: visit)
        
    }
    
    //  closures captures values (stores them for use a call time)
    func preOrderTraversal(visit: (BinaryTreeNode) -> () ){
        visit(self)
        leftChild?.preOrderTraversal(visit: visit)
        rightChild?.preOrderTraversal(visit: visit)
    }
    
    
    func postOrderTraversal(visit: (BinaryTreeNode) -> () ){
        leftChild?.postOrderTraversal(visit: visit)
        rightChild?.postOrderTraversal(visit: visit)
        visit(self)
    }
    
}


func elementsSame(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    
    return []
}

let set1 = Set([1,2,3,4])
let set2 = Set([1,2,5,9])

let set3 = set1.intersection(set2)

print("Hi")
print(Array(set3))
