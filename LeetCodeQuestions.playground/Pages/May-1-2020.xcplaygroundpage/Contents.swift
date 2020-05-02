//: [Previous](@previous)

import Foundation

/*
 525. Contiguous Array
 Medium
 
 Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.
 
 Example 1:
 Input: [0,1]
 Output: 2
 Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
 Example 2:
 Input: [0,1,0]
 Output: 2
 Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
 */

func findMaxLength(_ nums: [Int]) -> Int {
    var count = 0
    var maxLength = 0
    var freqDict = [Int: Int]() // [count: index]
    freqDict[0] = -1
    // if we have seen the count before we are looking at the contiguous subarray
    for (currentIndex, num) in nums.enumerated() {
        if num == 0 {
            count -= 1
        } else {
            count += 1
        }
        // keep track of seen counts and indices
        if let firstSeenIndex = freqDict[count] {
            maxLength = max(maxLength, currentIndex - firstSeenIndex)
        } else {
            freqDict[count] = currentIndex // first time we have seen this count
        }
    }
    return maxLength
}

findMaxLength([0,1,0,1,1,0,0,1,1,1,1,0,1,1,0,1,1,1,1,1,1,0])

/*
 20. Valid Parentheses
 Easy

 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.

 Example 1:

 Input: "()"
 Output: true
 Example 2:

 Input: "()[]{}"
 Output: true
 Example 3:

 Input: "(]"
 Output: false
 Example 4:

 Input: "([)]"
 Output: false
 Example 5:

 Input: "{[]}"
 Output: true
 */

func isValid(_ s: String) -> Bool {
    
    let dict:[Character: Character] = ["(": ")", "{": "}", "[": "]"]
    var result: [Character] = []
    for char in s {
        if let next = dict[char] {
            result.append(next)
        } else if result.popLast() == char {
            continue
        } else { return false }
    }
    
    return result.isEmpty
}

/*
 225. Implement Stack using Queues
 Easy

 Implement the following operations of a stack using queues.

 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 empty() -- Return whether the stack is empty.
 Example:

 MyStack stack = new MyStack();

 stack.push(1);
 stack.push(2);
 stack.top();   // returns 2
 stack.pop();   // returns 2
 stack.empty(); // returns false
 */

class MyStack {

    /** Initialize your data structure here. */
    init() {
        
    }
    
    var queue = [Int]()
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        queue.append(x)
        for _ in 0..<(queue.count - 1) {
            queue.append(queue.removeFirst())
        }
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        return queue.removeFirst()
    }
    
    /** Get the top element. */
    func top() -> Int {
        guard let top = queue.first else { return 0 }
        return top
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return queue.isEmpty
    }
}

