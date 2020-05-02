//: [Previous](@previous)

import Foundation

/*
 206. Reverse Linked List
 Easy
 
 Reverse a singly linked list.
 
 Example:
 
 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:
 
 A linked list can be reversed either iteratively or recursively. Could you implement both?
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func reverseList(_ head: ListNode?) -> ListNode? {
//    if head == nil {
//        return nil
//    }
//    var current = head
//    var previous: ListNode?
//    var next: ListNode?
//
//    while current != nil {
//        next = current?.next
//        current?.next = previous
//        previous = current
//        current = next
//    }
//    return previous
    guard let list = head else { return nil }
    guard list.next != nil else { return list }

    let rev = reverseList(list.next)

    list.next?.next = list
    list.next = nil
    return rev
}


