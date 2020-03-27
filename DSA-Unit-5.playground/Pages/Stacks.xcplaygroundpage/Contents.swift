//: [Previous](@previous)

import Foundation

struct Stack<T: Equatable>: Equatable {
    private var elements = [T]()
    
    static func ==(lhs: Stack, rhs: Stack) -> Bool {
        return lhs.elements == rhs.elements
    }
    
    public var peek: T? {
        return elements.last
    }
    
    public var count: Int {
        return elements.count
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    // add to the top of the stack (end)
    public mutating func push(_ value: T) {
        elements.append(value) // O(1)
        
    }
    
    public mutating func pushB(_ value: T) {
        elements.insert(value, at: 0) // O(1)
        // is the location
    }
    // remove from the top of the stack
    public mutating func pop() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeLast() // O(1)
    }
    
}

var stack = Stack<Int>()
stack.push(5)
stack.push(9)
stack.push(17)
stack.push(30)

var otherStack = Stack<Int>()
otherStack.push(15)
otherStack.push(120)
otherStack.push(2)

//Problem One:
//Find the largest integer in a Stack of Ints
func largest(stack: Stack<Int>) -> Int {
    var stackCopy = stack
    guard !stackCopy.isEmpty else { return 0 }
    
    var max = Int.min
    
    while !stackCopy.isEmpty {
        
        guard let stackPop = stackCopy.pop() else { return 0 }
        
        if stackPop > max {
            max = stackPop
        }
    }
    return max
}

assert(largest(stack: stack) == 30, "should be equal to 30")
assert(largest(stack: otherStack) == 120, "should be equal to 120")



//Problem Two:
//Find the sum of a Stack of Ints
func sum(stack: Stack<Int>) -> Int {
    var copy  = stack
    
    guard !copy.isEmpty else { return 0 }
    
    var sum = 0
    
    while !copy.isEmpty {
        guard let stackPop = copy.pop() else {
            return 0
        }
        
        sum += stackPop
    }
    return sum
}

assert(sum(stack: stack) == 61, "should be equal to 61")
assert(sum(stack: otherStack) == 137, "should be equal to 137")


//Problem Three:
//Reverse a Stack without using an Array
//Sample input:
/*
 4
 2
 9
 3
 */

//Sample output:
/*
 3
 9
 2
 4
 */

func reverse<T: Comparable>(stack: Stack<T>) -> Stack<T> {
    
    var copy = stack
    var endStack = Stack<T>()
    
    while !copy.isEmpty {
        guard let stackPop = copy.pop() else { return endStack
        }
        endStack.push(stackPop)
    }
    return endStack
}

var originalStack = Stack<Int>()
originalStack.push(4)
originalStack.push(2)
originalStack.push(9)
originalStack.push(3)

var reversedStack = Stack<Int>()
reversedStack.push(3)
reversedStack.push(9)
reversedStack.push(2)
reversedStack.push(4)

assert(reverse(stack: originalStack) == reversedStack, "should be equal to reversedStack")



//Problem Four:
//Write a function that pushes a new element to the bottom of a Stack...
func pushBottom<T: Comparable>(stack: Stack<T>, newElement: T) -> Stack<T> {
    
    var newS = Stack<T>()
    
    let copy  = stack
    
    var reStack = reverse(stack: copy)
    
    newS.push(newElement)
    
    while !reStack.isEmpty {
        guard let newE = reStack.pop() else { return Stack<T>() }
         
        newS.push(newE)
    }
    
    return newS
}

var stackWithoutNewElement = Stack<Int>()
stackWithoutNewElement.push(10)
stackWithoutNewElement.push(3)
stackWithoutNewElement.push(7)
stackWithoutNewElement.push(-8)

var stackWithNewElement = Stack<Int>()
stackWithNewElement.push(17)
stackWithNewElement.push(10)
stackWithNewElement.push(3)
stackWithNewElement.push(7)
stackWithNewElement.push(-8)

assert(pushBottom(stack: stackWithoutNewElement, newElement: 17) == stackWithNewElement, "should be equal stack with new element")



let charMap: [Character:Character] = [
    "}": "{",
    ")": "(",
    "]": "["
]

func isValid(_ s: String) -> Bool {
    var stack = [Character]()
    for char in s {
        let c = charMap[char]
        if c == nil {
            stack.append(char)
        } else {
            if stack.popLast() != c {
                return false
            }
        }
    }
    return stack.count == 0
}

isValid("()(){}[]")
