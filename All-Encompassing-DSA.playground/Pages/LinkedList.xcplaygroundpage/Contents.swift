//: [Previous](@previous)

import Foundation

//======================================================================
//                               LESSON
//======================================================================

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

//implementing CustomStringConvertible to customize description of a node
extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value) -> nil" // 12 -> nil
        }
        // if we have connected nodes
        return "\(value) -> \(next)"
    }
}

// instantiating node instances
let car12 = Node<Int>(12)
let car99 = Node<Int>(99)
let car37 = Node<Int>(37)
let car500 = Node<Int>(500)
let car44 = Node<Int>(44)

// link our nodes
car12.next = car99
car99.next = car37
car37.next = car500
car500.next = car44

print(car12)

extension Node {
    func printNode(node: Node) {
        print(node)
    }
}

car12.printNode(node: car12)

// Implementation of a LinkedList

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


extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "empty list"
        }
        return "\(head)"
    }
}

let fellows = LinkedList<String>()
fellows.append("Oscar")
fellows.append("Tanya")
fellows.append("David")

fellows.removeLast()
print(fellows)
fellows.append("Luba")
print(fellows)
print(fellows)

extension Node {
    public func reverse(list: Node?) -> Node? {
        
        if list == nil {
            return nil
        }
        var current = list
        var previous: Node?
        var next: Node?
        
        while current != nil {
            next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        return previous
    }
    
    public func recReverse(list: Node?) -> Node? {
        guard let list = list else { return nil }
        guard list.next != nil else { return list }
        
        let rev = recReverse(list: list.next)
        
        list.next?.next = list
        list.next = nil
        return rev
    }
    
    public func middleNode(node: Node?) -> Node? {
        
        var fastPart = node
        var slowPart = node
        
        while fastPart?.next != nil {
            fastPart = fastPart?.next?.next
            slowPart = slowPart?.next
        }
        return slowPart
    }
    
    public func nodeAtN(node: Node?, index: Int) -> Node? {
        
        var current = node
        var count = 0
        
        while current != nil {
            
            if count == index {
                break
            }
            current = current?.next
            count += 1
        }
        print(current!.value)
        return current
    }
    
}
let revList = car12.reverse(list: car12)
print(revList!)
//let recRevList = car12.recReverse(list: car12)
//print(recRevList!)
print(car12)
//print(car12.middleNode(node: car12)!)
//car12.nodeAtN(node: car12, index: 2)


//======================================================================
//                       Linked List from LeetCode
//======================================================================

class MyLinkedList {
    
    class Node {

        var value: Int
        var next: Node?
        weak var previous: Node?

        init(value: Int, next: Node? = nil) {
            self.value = value
            self.next = next
        }

        var isHead: Bool {
            return self.previous == nil
        }

        var isTail: Bool {
            return self.next == nil
        }

        var isNode: Bool {
            return self.previous != nil && self.next != nil
        }

    }
    
    var head: Node?
    var tail: Node?

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        var node = head
        
        for i in 0...index {
            if i == index {
                guard let nodeVal = node?.value else { return 0 }
                return nodeVal
            } else {
                node = node?.next
            }
        }
        
        return 0
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let newNode = Node(value: val, next: head)
        head = newNode
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        guard head != nil else {
            head = Node(value: val)
            return
        }
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(value: val)
    }
    
    func nodeAt(index: Int) -> Node? {
        var node = head
        
        for i in 0...index {
            if i == index {
                return node
            } else {
                node = node?.next
            }
        }
        
        return nil
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index <= 0 {
            addAtHead(val)
            return
        }
        guard let prevNode = nodeAt(index: index - 1) else {
            return
        }
        let newNode = Node(value: val, next: prevNode.next)
        prevNode.next = newNode
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        
    }
}

//======================================================================
//                       Swift Algorithm Club
//======================================================================

/*
 public final class LinkedList<T> {
 
 /// Linked List's Node Class Declaration
 public class LinkedListNode<T> {
 var value: T
 var next: LinkedListNode?
 weak var previous: LinkedListNode?
 
 public init(value: T) {
 self.value = value
 }
 }
 
 /// Typealiasing the node class to increase readability of code
 public typealias Node = LinkedListNode<T>
 
 
 /// The head of the Linked List
 private(set) var head: Node?
 
 /// Computed property to iterate through the linked list and return the last node in the list (if any)
 public var last: Node? {
 guard var node = head else {
 return nil
 }
 
 while let next = node.next {
 node = next
 }
 return node
 }
 
 /// Computed property to check if the linked list is empty
 public var isEmpty: Bool {
 return head == nil
 }
 
 /// Computed property to iterate through the linked list and return the total number of nodes
 public var count: Int {
 guard var node = head else {
 return 0
 }
 
 var count = 1
 while let next = node.next {
 node = next
 count += 1
 }
 return count
 }
 
 /// Default initializer
 public init() {}
 
 
 /// Subscript function to return the node at a specific index
 ///
 /// - Parameter index: Integer value of the requested value's index
 public subscript(index: Int) -> T {
 let node = self.node(at: index)
 return node.value
 }
 
 /// Function to return the node at a specific index. Crashes if index is out of bounds (0...self.count)
 ///
 /// - Parameter index: Integer value of the node's index to be returned
 /// - Returns: LinkedListNode
 public func node(at index: Int) -> Node {
 assert(head != nil, "List is empty")
 assert(index >= 0, "index must be greater or equal to 0")
 
 if index == 0 {
 return head!
 } else {
 var node = head!.next
 for _ in 1..<index {
 node = node?.next
 if node == nil {
 break
 }
 }
 
 assert(node != nil, "index is out of bounds.")
 return node!
 }
 }
 
 /// Append a value to the end of the list
 ///
 /// - Parameter value: The data value to be appended
 public func append(_ value: T) {
 let newNode = Node(value: value)
 append(newNode)
 }
 
 /// Append a copy of a LinkedListNode to the end of the list.
 ///
 /// - Parameter node: The node containing the value to be appended
 public func append(_ node: Node) {
 let newNode = node
 if let lastNode = last {
 newNode.previous = lastNode
 lastNode.next = newNode
 } else {
 head = newNode
 }
 }
 
 /// Append a copy of a LinkedList to the end of the list.
 ///
 /// - Parameter list: The list to be copied and appended.
 public func append(_ list: LinkedList) {
 var nodeToCopy = list.head
 while let node = nodeToCopy {
 append(node.value)
 nodeToCopy = node.next
 }
 }
 
 /// Insert a value at a specific index. Crashes if index is out of bounds (0...self.count)
 ///
 /// - Parameters:
 ///   - value: The data value to be inserted
 ///   - index: Integer value of the index to be insterted at
 public func insert(_ value: T, at index: Int) {
 let newNode = Node(value: value)
 insert(newNode, at: index)
 }
 
 /// Insert a copy of a node at a specific index. Crashes if index is out of bounds (0...self.count)
 ///
 /// - Parameters:
 ///   - node: The node containing the value to be inserted
 ///   - index: Integer value of the index to be inserted at
 public func insert(_ newNode: Node, at index: Int) {
 if index == 0 {
 newNode.next = head
 head?.previous = newNode
 head = newNode
 } else {
 let prev = node(at: index - 1)
 let next = prev.next
 newNode.previous = prev
 newNode.next = next
 next?.previous = newNode
 prev.next = newNode
 }
 }
 
 /// Insert a copy of a LinkedList at a specific index. Crashes if index is out of bounds (0...self.count)
 ///
 /// - Parameters:
 ///   - list: The LinkedList to be copied and inserted
 ///   - index: Integer value of the index to be inserted at
 public func insert(_ list: LinkedList, at index: Int) {
 guard !list.isEmpty else { return }
 
 if index == 0 {
 list.last?.next = head
 head = list.head
 } else {
 let prev = node(at: index - 1)
 let next = prev.next
 
 prev.next = list.head
 list.head?.previous = prev
 
 list.last?.next = next
 next?.previous = list.last
 }
 }
 
 /// Function to remove all nodes/value from the list
 public func removeAll() {
 head = nil
 }
 
 /// Function to remove a specific node.
 ///
 /// - Parameter node: The node to be deleted
 /// - Returns: The data value contained in the deleted node.
 @discardableResult public func remove(node: Node) -> T {
 let prev = node.previous
 let next = node.next
 
 if let prev = prev {
 prev.next = next
 } else {
 head = next
 }
 next?.previous = prev
 
 node.previous = nil
 node.next = nil
 return node.value
 }
 
 /// Function to remove the last node/value in the list. Crashes if the list is empty
 ///
 /// - Returns: The data value contained in the deleted node.
 @discardableResult public func removeLast() -> T {
 assert(!isEmpty)
 return remove(node: last!)
 }
 
 /// Function to remove a node/value at a specific index. Crashes if index is out of bounds (0...self.count)
 ///
 /// - Parameter index: Integer value of the index of the node to be removed
 /// - Returns: The data value contained in the deleted node
 @discardableResult public func remove(at index: Int) -> T {
 let node = self.node(at: index)
 return remove(node: node)
 }
 }
 
 //: End of the base class declarations & beginning of extensions' declarations:
 // MARK: - Extension to enable the standard conversion of a list to String
 extension LinkedList: CustomStringConvertible {
 public var description: String {
 var s = "["
 var node = head
 while let nd = node {
 s += "\(nd.value)"
 node = nd.next
 if node != nil { s += ", " }
 }
 return s + "]"
 }
 }
 
 // MARK: - Extension to add a 'reverse' function to the list
 extension LinkedList {
 public func reverse() {
 var node = head
 while let currentNode = node {
 node = currentNode.next
 swap(&currentNode.next, &currentNode.previous)
 head = currentNode
 }
 }
 }
 
 // MARK: - An extension with an implementation of 'map' & 'filter' functions
 extension LinkedList {
 public func map<U>(transform: (T) -> U) -> LinkedList<U> {
 let result = LinkedList<U>()
 var node = head
 while let nd = node {
 result.append(transform(nd.value))
 node = nd.next
 }
 return result
 }
 
 public func filter(predicate: (T) -> Bool) -> LinkedList<T> {
 let result = LinkedList<T>()
 var node = head
 while let nd = node {
 if predicate(nd.value) {
 result.append(nd.value)
 }
 node = nd.next
 }
 return result
 }
 }
 
 // MARK: - Extension to enable initialization from an Array
 extension LinkedList {
 convenience init(array: Array<T>) {
 self.init()
 
 array.forEach { append($0) }
 }
 }
 
 // MARK: - Extension to enable initialization from an Array Literal
 extension LinkedList: ExpressibleByArrayLiteral {
 public convenience init(arrayLiteral elements: T...) {
 self.init()
 
 elements.forEach { append($0) }
 }
 }
 
 // MARK: - Collection
 extension LinkedList: Collection {
 
 public typealias Index = LinkedListIndex<T>
 
 /// The position of the first element in a nonempty collection.
 ///
 /// If the collection is empty, `startIndex` is equal to `endIndex`.
 /// - Complexity: O(1)
 public var startIndex: Index {
 get {
 return LinkedListIndex<T>(node: head, tag: 0)
 }
 }
 
 /// The collection's "past the end" position---that is, the position one
 /// greater than the last valid subscript argument.
 /// - Complexity: O(n), where n is the number of elements in the list. This can be improved by keeping a reference
 ///   to the last node in the collection.
 public var endIndex: Index {
 get {
 if let h = self.head {
 return LinkedListIndex<T>(node: h, tag: count)
 } else {
 return LinkedListIndex<T>(node: nil, tag: startIndex.tag)
 }
 }
 }
 
 public subscript(position: Index) -> T {
 get {
 return position.node!.value
 }
 }
 
 public func index(after idx: Index) -> Index {
 return LinkedListIndex<T>(node: idx.node?.next, tag: idx.tag + 1)
 }
 }
 
 // MARK: - Collection Index
 /// Custom index type that contains a reference to the node at index 'tag'
 public struct LinkedListIndex<T>: Comparable {
 fileprivate let node: LinkedList<T>.LinkedListNode<T>?
 fileprivate let tag: Int
 
 public static func==<T>(lhs: LinkedListIndex<T>, rhs: LinkedListIndex<T>) -> Bool {
 return (lhs.tag == rhs.tag)
 }
 
 public static func< <T>(lhs: LinkedListIndex<T>, rhs: LinkedListIndex<T>) -> Bool {
 return (lhs.tag < rhs.tag)
 }
 }
 */

