//: [Previous](@previous)

import Foundation

// implement a Stack using an Array

struct Stack<T> {
  // data structure
  private var elements = [T]()
  
  public var isEmpty: Bool {
    return true
  }
  
  public var count: Int {
    return elements.count
  }
  
  public var top: T? { // or peek
    return elements.last
  }
  
  public mutating func push(_ element: T) {
    elements.append(element)
  }
  
  @discardableResult
  public mutating func pop() -> T? {
    elements.popLast()
  }
}

var stackArr = Stack<String>()
stackArr.push("Big O Notation")
stackArr.push("String")
stackArr.push("Array")
stackArr.push("Dictionary")

print(stackArr.count) // 4

stackArr.pop()

print(stackArr) // ["Big O Notation", "String", "Array"]

stackArr.pop()
stackArr.pop()
stackArr.pop()

print(stackArr.isEmpty) // true

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
  
  public var peek: T? {
    return tail?.value
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
}

var list = LinkedList<Int>()

list.append(1)
list.append(2)
list.append(3)

print(list.count) // 3

list.removeLast()
list.removeLast()

print(list.count) // 1

print(list.peek ?? -1) // 1

// Implement Stack with LinkedList

struct LLStack<T: Equatable> {
  // data structure
  private var elements = LinkedList<T>()
  
  public var count: Int {
    return elements.count
  }
  
  public var isEmpty: Bool {
    return elements.isEmpty
  }
  
  public var peek: T? {
    return elements.peek
  }
  
  public mutating func push(_ element: T) {
    elements.append(element)
  }
  
  @discardableResult
  public mutating func pop() -> T? {
    return elements.removeLast()
  }
}

var navigationStack = LLStack<String>()

navigationStack.push("viewController1")
navigationStack.push("viewController2")
navigationStack.push("viewController3")

navigationStack.pop()

print(navigationStack.peek ?? "no vc's")

print(navigationStack.isEmpty) // false

print(navigationStack.count) // 2

navigationStack.pop()
navigationStack.pop()

print(navigationStack.isEmpty) // true

//=============================================================================
//                      LeetCode Stack Q's
//=============================================================================

/*
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 getMin() -- Retrieve the minimum element in the stack.
  

 Example 1:

 Input
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]

 Output
 [null,null,null,null,-3,null,0,-2]

 Explanation
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin(); // return -3
 minStack.pop();
 minStack.top();    // return 0
 minStack.getMin(); // return -2
 */

class MinStack {
    
    init() {}
    
    var elementArr = [Int]()
    var minArr = [Int]()
    
    func push(_ x: Int) {
        elementArr.append(x)
        if minArr.count == 0 {
            minArr.append(x)
        } else {
            if let minNumber = minArr.last, let lastNum = elementArr.last {
                if lastNum <= minNumber {
                    minArr.append(lastNum)
                }
            }
        }
    }
    
    func pop() -> Int {
        guard !elementArr.isEmpty else {
            return 0
        }
        let removedNum = elementArr.popLast()
        if let numRemoved = removedNum, let min1 = minArr.last {
            if numRemoved == min1 {
                minArr.removeLast()
            }
        }
        return removedNum ?? 1000
    }
    
    func top() -> Int {
        guard !elementArr.isEmpty else {
            return 0
        }
        return elementArr.last ?? 1000
    }
    
    func getMin() -> Int {
        return minArr.last ?? 1000
    }
}

//=============================================================================
/*
 20. Valid Parentheses
 Easy

 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
  

 Example 1:

 Input: s = "()"
 Output: true
 Example 2:

 Input: s = "()[]{}"
 Output: true
 Example 3:

 Input: s = "(]"
 Output: false
 Example 4:

 Input: s = "([)]"
 Output: false
 Example 5:

 Input: s = "{[]}"
 Output: true
 */

func isValid(_ s: String) -> Bool {
        
    let dict = ["(": ")", "{": "}", "[": "]"]
    var result = [String]()
    for char in s {
        if let next = dict[String(char)] {
            result.append(next)
        } else if result.popLast() == String(char) {
            continue
        } else { return false }
    }

    return result.isEmpty
}

//=============================================================================
/*
 844. Backspace String Compare
 Easy

 Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

 Note that after backspacing an empty text, the text will continue empty.

 Example 1:

 Input: S = "ab#c", T = "ad#c"
 Output: true
 Explanation: Both S and T become "ac".
 Example 2:

 Input: S = "ab##", T = "c#d#"
 Output: true
 Explanation: Both S and T become "".
 Example 3:

 Input: S = "a##c", T = "#a#c"
 Output: true
 Explanation: Both S and T become "c".
 Example 4:

 Input: S = "a#c", T = "b"
 Output: false
 Explanation: S becomes "c" while T becomes "b".
 */

func backspaceCompare(_ S: String, _ T: String) -> Bool {
    var s = [Character]()
    var t = [Character]()

    for letter in S {
        if letter == "#" && s.count > 0 {
            s.removeLast()
        } else if letter != "#"{
            s.append(letter)
        }
    }

    for letter in T {
        if letter == "#" && t.count > 0 {
            t.removeLast()
        } else if letter != "#"{
            t.append(letter)
        }
    }

    return s == t
}

//=============================================================================

/*
 1021. Remove Outermost Parentheses
 Easy

 A valid parentheses string is either empty (""), "(" + A + ")", or A + B, where A and B are valid parentheses strings, and + represents string concatenation.  For example, "", "()", "(())()", and "(()(()))" are all valid parentheses strings.

 A valid parentheses string S is primitive if it is nonempty, and there does not exist a way to split it into S = A+B, with A and B nonempty valid parentheses strings.

 Given a valid parentheses string S, consider its primitive decomposition: S = P_1 + P_2 + ... + P_k, where P_i are primitive valid parentheses strings.

 Return S after removing the outermost parentheses of every primitive string in the primitive decomposition of S.

  

 Example 1:

 Input: "(()())(())"
 Output: "()()()"
 Explanation:
 The input string is "(()())(())", with primitive decomposition "(()())" + "(())".
 After removing outer parentheses of each part, this is "()()" + "()" = "()()()".
 Example 2:

 Input: "(()())(())(()(()))"
 Output: "()()()()(())"
 Explanation:
 The input string is "(()())(())(()(()))", with primitive decomposition "(()())" + "(())" + "(()(()))".
 After removing outer parentheses of each part, this is "()()" + "()" + "()(())" = "()()()()(())".
 Example 3:

 Input: "()()"
 Output: ""
 Explanation:
 The input string is "()()", with primitive decomposition "()" + "()".
 After removing outer parentheses of each part, this is "" + "" = "".
 */

func removeOuterParentheses(_ S: String) -> String {
    var result = ""
    var counter = 0
    for s in S {
        if s == "(" {
           if counter > 0 {
              result.append(s)
           }
           counter += 1
        } else if s == ")" {
           counter -= 1
           if counter > 0 {
               result.append(s)
           }
        }
    }
    return result
}

//=============================================================================

/*
 1441. Build an Array With Stack Operations
 Easy
 
 Given an array target and an integer n. In each iteration, you will read a number from  list = {1,2,3..., n}.

 Build the target array using the following operations:

 Push: Read a new element from the beginning list, and push it in the array.
 Pop: delete the last element of the array.
 If the target array is already built, stop reading more elements.
 You are guaranteed that the target array is strictly increasing, only containing numbers between 1 to n inclusive.

 Return the operations to build the target array.

 You are guaranteed that the answer is unique.

 Example 1:

 Input: target = [1,3], n = 3
 Output: ["Push","Push","Pop","Push"]
 Explanation:
 Read number 1 and automatically push in the array -> [1]
 Read number 2 and automatically push in the array then Pop it -> [1]
 Read number 3 and automatically push in the array -> [1,3]
 Example 2:

 Input: target = [1,2,3], n = 3
 Output: ["Push","Push","Push"]
 Example 3:

 Input: target = [1,2], n = 4
 Output: ["Push","Push"]
 Explanation: You only need to read the first 2 numbers and stop.
 Example 4:

 Input: target = [2,3,4], n = 4
 Output: ["Push","Pop","Push","Push","Push"]
 */

func buildArray(_ target: [Int], _ n: Int) -> [String] {
    var n = n
    var count = 1
    var res = [String]()
    for num in target {
        while num != count {
            res.append("Push")
            res.append("Pop")
            count += 1
        }
        res.append("Push")
        count += 1
    }
    return res
}
