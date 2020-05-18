//: [Previous](@previous)

import Foundation

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
