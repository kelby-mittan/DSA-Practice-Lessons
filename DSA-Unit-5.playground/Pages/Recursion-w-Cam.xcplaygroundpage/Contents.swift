//: [Previous](@previous)

import Foundation

/*
 Recursion
 
 - The function calls itself.
 - The idea behind recursion is that some problems can be solved by solving smaller versions of the same problem.
    - Example -> Binary Search:
        - Splitting an ordered array into two parts.
        - Input: [1,2,3,4,5,6,7,8,9,10], target: 7, output: 6
        - Because we known the array is sorted, we can start from the middle.
            - [6,7,8,9,10]
            - [7]
 
 - How does it work?
    1. We need a base case
        - Some smallest possible version of the problem that we know the answer to.
    2. We need to progress toward our base case
        - If we are not progressing toward a base case, then we fall into infinite recursion.
 
 - Most problems that can be solved recursively, can also be solved iteratively (with a loop). Whether you use a loop or recursion is up to you, but in some cases one solution is better than the other. Like the fibonacci sequence.
 
 - There is something called mutual recursion. The is that there are two different functions that recursively call one another.
 
 - Recursive Mindset
    - The idea is that the bigger problem cannot be solved without first knowing the solution to a smaller version of the problem. This continues until the smallest problem (the base case) has been solved.
 */

func cheers(_ num: Int) {
    // Base case
    guard num > 1 else {
        print("Hooray!")
        return
    }
    
    print("Hip, ", terminator: "")
    cheers(num - 1) // Progression
}

// Cheers(3) cannot complete without knowing the value of Cheers(2), and Cheers(2) cannot complete without knowing the value of Cheers(1).

// cheers(3)

/*
 - Fibonacci has an expensive recursive solution, but we can save it!
 Memoization
    - We keep track of the solution for redudant or expensive recursive calls.
 Dynamic Programming
    - The combination of Memoization and recursion.
 */

var fibs: [Int:Int] = [:]
func fibonacci(_ n: Int) -> Int {
    // If we have seen the value before, return the value.
    if let fibValue = fibs[n] {
        return fibValue
    }
    
    guard n > 0 else { return 0 } // base case
    guard n > 2 else { return 1 } // base case
    
    let fibonacciValue = fibonacci( n - 1 ) + fibonacci( n - 2 ) // Progression
    fibs[n] = fibonacciValue
    return fibonacciValue
}

fibonacci(15)

/*
 fibonacci(0) = 0
 fibonacci(1) = 1
 fibonacci(2) = 1
 fibonacci(5) = fibonacci(4) + fibonacci(3)
 fibonacci(4) = fibonacci(3) + fibonacci(2)
 fibonacci(3) = fibonacci(2) + fibonacci(1)
 
 fibonacci(5) = (fibonacci(2) + fibonacci(1)) + fibonacci(2)) + (fibonacci(2) + fibonacci(1))
 */

// 5! = 5 * 4 * 3 * 2 * 1
func factorial(_ num: Int) -> Int {
    guard num > 1 else { return 1 } // base case
    
    return num * factorial(num - 1) // Progressing toward a base case
}

// print(factorial(5))
// factorial(5) = 5 * factorial(4) -> Pause
// factorial(4) = 5 * 4 * factorial(3) -> Pause
// factorial(3) = 5 * 4 * 3 * factorial(2) -> Pause
// factorial(2) = 5 * 4 * 3 * 2 * factorial(1) -> Pause
// factorial(1) = 1

// Returns the index of the value, if it exists.
// Returns -1 if it doesn't.
func binarySearch(_ arr: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int {
    
    // Base Case
    guard start < end else {
        return -1
    }
    
    let middleIndex = (start + end) / 2
    // Three cases
    // 1. The number we are looking for is less than the middle index.
    // 2. The number we are looking for is greater than the middle index.
    // 3. The number we are looking for is equal to the middle index.
    
    if target < arr[middleIndex] {
        return binarySearch(arr, start, middleIndex, target) // End moves toward start
    } else if target > arr[middleIndex] {
        return binarySearch(arr, middleIndex + 1, end, target) // Start moves toward end
    } else {
        return middleIndex
    }
    
}

 print(binarySearch([1,2,3,4,5,6,7,8,9,10], 0, 9, 7))

/*
 
 First call: binarySearch([1,2,3,4,5,6,7,8,9,10], 0, 9, 7)
 Second call: binarySearch([6,7,8,9,10], 5, 9, 7)
 Third call: binarySearch([6,7,8], 5, 7, 7) -> return middleIndex = 6
 
 */

class Node<T> {
    
    public var value: T
    public var next: Node?
    
    init(_ value: T){
        self.value = value
        self.next = nil
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let nextNode = self.next else {
            return "\(value) → nil"
        }
        
        return "\(self.value) → " + String(describing: nextNode)
    }
    
}

let rootNode = Node<String>("Luba")
let firstNode = Node<String>("Maitree")
let secondNode = Node<String>("Brendon")
let thirdNode = Node<String>("Yulia")
let fourthNode = Node<String>("Cameron")

rootNode.next = firstNode
firstNode.next = secondNode
secondNode.next = thirdNode
thirdNode.next = fourthNode

print(rootNode)

func reverseList<T>(_ node: Node<T>?) -> Node<T>? {
    // Base case
    guard let _ = node?.next else {
        return node
    }

    // Progression toward base case
    let returnNode = reverseList(node?.next)

    node?.next?.next = node
    node?.next = nil

    return returnNode
}

print(reverseList(rootNode)!)

/*
 Luba.next != nil Pause
 Maitree.next != nil Pause
 Brendon.next != nil Pause
 Yulia.next != nil Pause
 Cameron.next == nil return Cameron
 
 Resume Yulia.next.next (== Cameron.next) = Yulia, Yulia.next = nil return Cameron
 Resume Brendon.next.next (== Yulia.next) = Brendon, Brendon.next = nil, return Cameron
 Resume Maitree.next.next (== Brendon.next) = Maitree, Maitree.next = nil,
 return Cameron
 Resume Luba.next.next (== Maitree.next) = Luba, Luba.next = nil, return Cameron
 */


func findA(_ str: String) -> Bool {
    
    
    return false
}
