import UIKit

class Node {
    
    var value: String
    var next: Node?
    weak var previous: Node?
    
    init(value: String, next: Node? = nil) {
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

class LinkedList {
    
    fileprivate var head: Node?
    private var tail: Node?
    
    var count: Int {
        var node = head
        var c = 0
        
        while node != nil {
            c += 1
            node = node?.next
        }
        return c
    }
    
    func append(value: String) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            tailNode.next = newNode
            newNode.previous = tail
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    func search(value: String) -> Node? {
        var node = head
        
        while node != nil {
            if node?.value == value {
                return node
            } else {
                node = node?.next
            }
        }
        return nil
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
    
    func insert(value: String, index: Int) {
        
        let newNode = Node(value: value)
        
        if let found = nodeAt(index: index) {
            if found.isHead {
                head = newNode
                newNode.next = found
            }
            if found.isTail {
                found.next = newNode
                tail = newNode
                tail?.next = nil
            } else {
                let previous = found.previous
                
                previous?.next = newNode
                newNode.next = found
            }
        } else {
            print("Index out of range")
        }
    }
    
    func remove(value: String) {
        
        if let found = search(value: value) {
            
            if found.isHead {
                head = found.next
            } else if found.isTail {
                tail = found.previous
                tail?.next = nil
            } else {
                found.previous?.next = found.next
            }
        }
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        var text = ""
        var node = head
        
        while node != nil {
            text += (node?.value)!
            node = node?.next
            
            if node != nil {
                text += " -> "
            }
        }
        return text + ""
    }
}

let list = LinkedList()

list.append(value: "A")
list.append(value: "B")
list.append(value: "C")
list.append(value: "D")

//list.remove(value: "B")

print(list)













































//
//import UIKit
//
//class Node {
//
//    var value: String
//    var next: Node?
//    weak var previous: Node?
//
//    init(value: String) {
//        self.value = value
//    }
//
//    var isHead: Bool {
//        return self.previous == nil
//    }
//
//    var isTail: Bool {
//        return self.next == nil
//    }
//
//    var isNode: Bool {
//        return self.previous != nil && self.next != nil
//    }
//}
//
//class LinkedList {
//    fileprivate var head: Node?
//    private var tail: Node?
//
//    func append(value: String) {
//        let newNode = Node(value: value)
//
//        if let tailNode = tail {
//            tailNode.next = newNode
//            newNode.previous = tail
//        } else {
//            head = newNode
//        }
//        tail = newNode
//    }
//
//    func search(value: String) -> Node? {
//
//        var node = head
//
//        while node != nil {
//            if node?.value == value {
//                return node
//            } else {
//                node = node?.next
//            }
//        }
//
//        return nil
//    }
//
//    func removeNode(value: String) {
//
//        if let found = search(value: value) {
//            if found.isHead {
//                head = found.next
//                head?.previous = nil
//            }
//
//            if found.isTail {
//                tail = found.previous
//                tail?.next = nil
//            }
//
//            if found.isNode {
//                found.previous?.next = found.next
//                found.next?.previous = found.previous
//            }
//        }
//    }
//
//    func reverseList() -> [String] {
//
//        var node = tail
//        var reverseArray = [String]()
//
//        while node != nil {
//            reverseArray.append((node?.value)!)
//            node = node?.previous
//        }
//
//        return reverseArray
//
//    }
//}
//
//extension LinkedList: CustomStringConvertible {
//    var description: String {
//        var node = head
//        var text = "["
//
//        while node != nil {
//            text += (node?.value)!
//            node = node?.next
//
//            if node != nil {
//                text += ","
//            }
//        }
//        return text + "]"
//    }
//}
//
//let list = LinkedList()
//
//list.append(value: "A")
//list.append(value: "B")
//list.append(value: "C")
//list.append(value: "D")
//
//
//
//
//










































//class Node<T> {
//    var value: T
//    var next: Node?
//    weak var previous: Node?
//
//    init(value: T) {
//        self.value = value
//    }
//}
//
//class LinkedList {
//    fileprivate var head: Node<Any>?
//    private var tail: Node<Any>?
//
//    var last: Node<Any>? {
//        if tail != nil {
//            return tail
//        }
//        return nil
//    }
//
//    var first: Node<Any>? {
//        if head != nil {
//            return head
//        }
//        return nil
//    }
//    var count: Int {
//        var node = head
//        var c = 0
//
//        while node != nil {
//            c += 1
//            node = node?.next
//        }
//        return c
//    }
//
//    func append(value: Any) {
//
//        let newNode = Node(value: value)
//
//        if let tailNode = tail {
//            newNode.previous = tail
//            tailNode.next = newNode
//        } else {
//            head = newNode
//        }
//        tail = newNode
//    }
//
//    func search(value: Any) -> Node<Any>? {
//
//        var node = head
//
//        while node != nil {
//            if node?.value == value as! _OptionalNilComparisonType {
//                return node
//            } else {
//                node = node?.next
//            }
//        }
//        return nil
//    }
//
//    func nodeAt(index: Int) -> Node<Any>? {
//
//            var node = head
//
//            for i in 0...index  {
//                if i == index {
//                    return (node)
//                } else {
//                    node = node?.next
//                }
//            }
//        return nil
//    }
//
//    func removeNode(value: String) {
//        if let found = search(value: value) {
//
//            if found.previous == nil {
//                head = found.next
//                head?.previous = nil
//            }
//            if found.next == nil {
//                print("Found Tail")
//                tail = found.previous
//                tail?.next = nil
//            }
//
//            if found.next != nil && found.previous != nil {
//                found.previous?.next = found.next
//            }
//        }
//    }
//
//    func removeNodeAt(value: Int) {
//        if let found = nodeAt(index: value) {
//            if found.previous == nil {
//                head = found.next
//                head?.previous = nil
//            }
//            if found.next == nil {
//                tail = found.previous
//                tail?.next = nil
//            }
//            if found.next != nil && found.previous != nil {
//                found.previous?.next = found.next
//            }
//        }
//    }
//
//    public func reverse() {
//        var node = head
//        while let currentNode = node {
//            node = currentNode.next
//            swap(&currentNode.next, &currentNode.previous)
//            head = currentNode
//        }
//    }
//
//    func clearList() {
//        head = nil
//        tail = nil
//    }
//}
//
//extension LinkedList: CustomStringConvertible {
//    var description: String {
//        var text = "["
//        var node = head
//
//        while node != nil {
//            text += "\(node!.value)"
//            node = node?.next
//
//            if node != nil {
//                text += ", "
//            }
//        }
//        return text + "]"
//    }
//}
//
//let list = LinkedList()
//list.append(value: "Labrador")
//list.append(value: "Pitbull")
//list.append(value: "German Shepherd")
//list.append(value: "Bull Dog")
//
//print(list)
//
//list.reverse()
//
//print(list)


