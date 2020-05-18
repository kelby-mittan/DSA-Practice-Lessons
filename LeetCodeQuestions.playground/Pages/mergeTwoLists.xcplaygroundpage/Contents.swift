//: [Previous](@previous)

import Foundation

/*
 21. Merge Two Sorted Lists
 Easy
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 
 Example:
 
 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
 */



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//    var list1 = l1
//    var list2 = l2
//
//    let head = ListNode(0)
//    var current = head
//
//    while let val1 = list1?.val, let val2 = list2?.val {
//        if val1 > val2 {
//            current.next = list2
//            list2 = list2?.next
//        } else {
//            current.next = list1
//            list1 = list1?.next
//        }
//        current = current.next!
//    }
//    if l1 == nil {
//        current.next = l2
//    } else {
//        current.next = l1
//    }
//
//    return head.next
    guard let l1 = l1 else { return l2 }
    guard let l2 = l2 else { return l1 }
    
    if l1.val < l2.val {
        l1.next = mergeTwoLists(l1.next, l2)
        return l1
    } else {
        l2.next = mergeTwoLists(l1, l2.next)
        return l2
    }
}

var list1 = ListNode(1)
list1.next = ListNode(2)
list1.next?.next = ListNode(4)

var list2 = ListNode(1)
list2.next = ListNode(3)
list2.next?.next = ListNode(4)

mergeTwoLists(list1, list2)


func hasCycle(_ head: ListNode?) -> Bool {
    guard let head = head, let next = head.next else {
        return false
    }
    var slow: ListNode? = head //start:head; speed: 1
    var fast: ListNode? = next //start:next; speed: 2
    while slow !== fast {
        if slow == nil || fast == nil {
            return false
        }
        slow = slow?.next
        fast = fast?.next?.next
    }
    return true
}
