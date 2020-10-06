//: [Previous](@previous)

import Foundation

// functions and properties
// Stack is a generic
// Stack is an abstract data type: Stack, Hash Table...
// heap is an ADT that allows for constant lookup
// for a min or max value
/*
 min heap
   *
   * *
  * * *
 max heap
  * * *
  * *
   *
 array => heap
 O(nlogn) => O(1)
*/
// implement a Stack (using an array)
/*
 properties
 initializers
 functions
 */
struct Stack<T> { // immutable - can't be changed
 // data structure
 // private, public, internal => access controls / modifiers
 private var elements = [T]()
 public var peek: T? { // maybe there's no value
  return elements.last
 }
 // stored, computed, static
 public var isEmpty: Bool {
  return elements.isEmpty // computed property
 }
 public var count: Int {
  return elements.count
 }
 public mutating func push(_ element: T) {
  // about to (modify) the elements array
  elements.append(element)
 }
 // pop, peek, isEmpty, push, count
 @discardableResult
 public mutating func pop() -> T? {
  elements.popLast() // if empty returns nil
//  guard !isEmpty else {
//   return nil
//  }
//  return elements.removeLast()
 }
}
// test
var numbers = Stack<Int>()
numbers.push(10)
numbers.push(9)
numbers.push(45)
print(numbers.count) // 3
let removedValue = numbers.pop() // discard the result
print(removedValue ?? -999) // 45
// don't submit code with warnings, print statements
// SwiftLint is a third party library used to format your code and has a robust set of configurable tools for style guides

// implement a Stack (using a linked list)
// implement a stack using a linked list
// 1.
// create a node class that uses a double node
// 2.
// create a linked list
// at minimun implement the following
// properties and functions
// count, isEmpty, peek
// append(), removeLast()
// 3.
// implement a stack using a linked list

// implement a stack using a linked list
// 1.
// create a node class that uses a double node
// ADT
// review: memory management, ARC, weak, strong, unowned
// [newObject retain]; // 1
// [newObject release]; // 0
// reference counting: is the OS managing the reference contains in the lifetime of an application
// init() - create objects
// deint() - called automatically when an object is destroyed
//         - deint() won't get called if the object is in a retain cycle

class DLNode<T> {
  // node has at minimum a value and a next pointer (references)
  var value: T // no value exist
  var next: DLNode<T>? // by default var is a strong reference
  weak var previous: DLNode<T>?
  init(_ value: T) { // 8
    // ourValue = 8
    self.value = value // 8
  }
}

// node1 <-> node2 -> nil

// 2.
// create a linked list
// at minimun implement the following
// properties and functions
// count, isEmpty, peek
// append(), removeLast()
// extra: insert, replaceHead
// ADT
struct LinkedList<T> {
  
  // data structure
  private var head: DLNode<T>?
  private var tail: DLNode<T>?
  
  // could only get (retrieve) the value externally
  // can mutate the value internally
  private (set) public var count = 0
  
  public var isEmpty: Bool {
    return head == nil
  }
  
  // 1 -> 2 -> 3 -> nil
  public var peek: T? {
    return tail?.value
  }
  
}

// 3.
// implement a stack using a linked list
