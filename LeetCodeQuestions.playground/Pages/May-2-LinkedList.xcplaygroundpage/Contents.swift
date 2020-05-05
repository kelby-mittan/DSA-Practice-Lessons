//: [Previous](@previous)

import Foundation

/*
 ===================================
 206. Reverse Linked List
 ===================================
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
    if head == nil {
        return nil
    }
    var current = head
    var previous: ListNode?
    var next: ListNode?

    while current != nil {
        next = current?.next
        current?.next = previous
        previous = current
        current = next
    }
    return previous
}

func reverseListRec(_ head: ListNode?) -> ListNode? {
    guard let list = head else { return nil }
    guard list.next != nil else { return list }

    let rev = reverseListRec(list.next)

    list.next?.next = list
    list.next = nil
    return rev
}


/*
 ================================
 234. Palindrome Linked List
 ================================
 Easy

 Given a singly linked list, determine if it is a palindrome.

 Example 1:

 Input: 1->2
 Output: false
 Example 2:

 Input: 1->2->2->1
 Output: true
 */

func isPalindrome(_ head: ListNode?) -> Bool {
    var fast: ListNode? = head
    var slow: ListNode? = head
    
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    if fast != nil {
        slow = slow?.next
    }
    slow = reverseList(slow)
    fast = head
    while slow != nil {
        if fast?.val != slow?.val {
            return false
        }
        fast = fast?.next
        slow = slow?.next
    }
    
    return true
}

