//: [Previous](@previous)

import Foundation

class MyLinkedList {
    
    class LinkedListNode {
        let value: Int
        var next: LinkedListNode?
        init(value: Int, next: LinkedListNode? = nil) {
            self.value = value
            self.next = next
        }
    }
    
    var head: LinkedListNode?
    
    init() {
        head = nil
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        guard let node = node(at: index) else {
            return -1
        }
        return node.value
    }
    
    private func node(at: Int) -> LinkedListNode? {
        guard at > -1, var node = head else {
            return nil
        }
        guard at > 0 else {
            return head
        }
        for _ in 1...at {
            guard let nextNode = node.next else {
                return nil
            }
            node = nextNode
        }
        return node
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let newNode = LinkedListNode(value: val, next: head)
        head = newNode
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        guard head != nil else {
            head = LinkedListNode(value: val)
            return
        }
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = LinkedListNode(value: val)
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index <= 0 {
            addAtHead(val)
            return
        }
        guard let prevNode = node(at: index - 1) else {
            return
        }
        let newNode = LinkedListNode(value: val, next: prevNode.next)
        prevNode.next = newNode
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if index == 0, head != nil {
            head = head?.next
            return
        }
        guard let prevNode = node(at: index - 1) else {
            return
        }
        prevNode.next = prevNode.next?.next
    }
}

extension MyLinkedList: CustomStringConvertible {
    // 2
    public var description: String {
        // 3
        var text = "["
        var node = head
        // 4
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        // 5
        return text + "]"
    }
}

/*
 203. Remove Linked List Elements
 Easy
 
 Remove all elements from a linked list of integers that have value val.
 
 Example:
 
 Input:  1->2->6->3->4->5->6, val = 6
 Output: 1->2->3->4->5
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    
    let fakeHead = ListNode(-1)
    fakeHead.next = head
    var prev = fakeHead
    while let current = prev.next {
        if current.val == val {
            prev.next = current.next
        } else {
            prev = current
        }
    }
    return fakeHead.next
}


/*
 876. Middle of the Linked List
 Easy
 
 Given a non-empty, singly linked list with head node head, return a middle node of linked list.
 
 If there are two middle nodes, return the second middle node.
 
 
 
 Example 1:
 
 Input: [1,2,3,4,5]
 Output: Node 3 from this list (Serialization: [3,4,5])
 The returned node has value 3.  (The judge's serialization of this node is [3,4,5]).
 Note that we returned a ListNode object ans, such that:
 ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, and ans.next.next.next = NULL.
 Example 2:
 
 Input: [1,2,3,4,5,6]
 Output: Node 4 from this list (Serialization: [4,5,6])
 Since the list has two middle nodes with values 3 and 4, we return the second one.
 */

func middleNode(_ head: ListNode?) -> ListNode? {
    var count = 0
    var midNode = head
    
    while midNode != nil {
        count += 1
        midNode = midNode?.next
    }
    midNode = head
    
    var midVal = count/2
    
    while midVal != 0 {
        midVal -= 1
        midNode = midNode?.next
    }
    
    return midNode
}

/*
 237. Delete Node in a Linked List
 Easy

 Write a function to delete a node (except the tail) in a singly linked list, given only access to that node.

 Given linked list -- head = [4,5,1,9], which looks like following:

 Example 1:

 Input: head = [4,5,1,9], node = 5
 Output: [4,1,9]
 Explanation: You are given the second node with value 5, the linked list should become 4 -> 1 -> 9 after calling your function.
 Example 2:

 Input: head = [4,5,1,9], node = 1
 Output: [4,5,9]
 Explanation: You are given the third node with value 1, the linked list should become 4 -> 5 -> 9 after calling your function.
 */

func deleteNode(_ node: ListNode?) {
    guard let nextNode = node?.next else { return }
        
    node?.val = nextNode.val
    node?.next = nextNode.next
}
