//: [Previous](@previous)

import Foundation

struct Queue<T> {
  private var elements = [T?]()
  private var head = 0
  
  public var isEmpty: Bool {
    return count == 0
  }
  
  public var count: Int {
    // since we are moving head we need to account for its current position
    // e.g
    // [nil, nil, "Bob", "Allison", "Ed"]
    // [0,    1,   head,  2,          3]
    // array count is 5
    // head is at position 2
    // count = array count - head position
    // 5 - 2 = 3
    return elements.count - head
  }
  
  public var front: T? {
    guard !isEmpty else {
      return nil
    }
    return elements[head] // we get to the front by indexing with head's position
  }
  
  public mutating func enqueue(_ element: T) {
    elements.append(element)
  }
  
  public mutating func dequeue() -> T? {
    guard !isEmpty, let element = elements[head] else {
      return nil
    }
    elements[head] = nil // remove element from queue
    head += 1 // move head forward by 1

    // on occasion we will need to clean up unused positons in the array (house-cleaning)
    // here we will get a percentage of the head / array count
    let percentage = Double(head)/Double(elements.count)
    if elements.count > 20 && percentage > 0.25 {
      elements.removeFirst(head) // remove all elements up to and including the head index
      head = 0 // reset head
    }
    
    return element
  }
}

var queue = Queue<String>()
queue.enqueue("Josh")
queue.enqueue("Tim")
queue.enqueue("Bob")
queue.enqueue("Allison")
queue.enqueue("Ed")

queue.front // Josh

queue.dequeue() // Josh

queue.front // Tim

queue.dequeue() // Tim

queue.front // Bob

queue.count // 3

queue.dequeue()
queue.dequeue()
queue.dequeue()
queue.dequeue()

class Node<T: Equatable>: Equatable {
  var value: T
  var next: Node<T>?
  weak var previous: Node<T>? // doubly list, use of weak to prevent retain cycle
  init(_ value: T) {
    self.value = value
  }
  static func ==(lhs: Node, rhs: Node) -> Bool {
    return lhs.value == rhs.value && lhs.next == rhs.next
  }
}

struct LinkedList<T: Equatable> {
  // data structure
  private var head: Node<T>?
  private var tail: Node<T>?
  
  // private(set) prevents external changes
  // private(set) public var allows access but not modification outside the LinkedList
  private(set) public var count = 0
  
  public var isEmpty: Bool {
    return head == nil
  }
  
  public var back: T? {
    return tail?.value
  }
  
  public var front: T? {
    return head?.value
  }
  
  public mutating func append(_ element: T) {
    count += 1
    let newNode = Node(element)
    guard let lastNode = tail else {
      head = newNode
      tail = newNode
      return
    }
    lastNode.next = newNode
    newNode.previous = lastNode
    tail = newNode
  }
  
  @discardableResult
  public mutating func removeLast() -> T? {
    // 1
    // empty state
    guard let lastNode = tail else {
      return nil
    }
    count -= 1
    // 2
    // one element in the list
    if head == tail { // Node needs to conform to Equatable
      let removedValue = head?.value
      head = nil
      tail = nil
      return removedValue
    }
    
    // 3
    // more than one element in the list
    let removedValue = lastNode.value
    tail = lastNode.previous
    lastNode.previous = nil
    return removedValue
  }
  
  public mutating func removeFirst() -> T? {
    guard let first = head else {
      return nil
    }
    let removedValue = first.value
    head = head?.next
    count -= 1
    return removedValue
  }
}


var list = LinkedList<Int>()
list.append(1)
list.append(5)
list.append(0)

list.front // 1
list.back // 0

list.removeFirst() // 1

list.front // 5

list.count // 2

list.removeFirst() // 5
list.removeFirst() // 0

list.count // 0

list.removeFirst() // nil

list.front // nil
