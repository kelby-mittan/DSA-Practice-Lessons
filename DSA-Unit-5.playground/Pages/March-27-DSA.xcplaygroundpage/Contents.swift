//: [Previous](@previous)

import Foundation

// questions
/*
 
 big o notation
 string
 recursion
 linked list
 
 */


//=================================================================================
//                Questions: Big O Notation
//=================================================================================

// problem 1: what is the runtime
func exampleOne(arr: [String]) {
  for _ in 0..<1_000_000 { // O(1)
    print("Many printings!")
  }
}



// problem 2: what is the runtime
func exampleTwo(arr: [String]) {
  for string in arr { // O(n)
    print(string)
  }
}


// problem 3: what is the runtime
func exampleThree(arr: [String]) {
  for stringOne in arr { // O(n^2)
    for stringTwo in arr {
      print("Player One: \(stringOne), Player Two: \(stringTwo)")
    }
  }
}


// problem 4: what is the runtime
func exampleFour(arr: [String]) {
  guard arr.count > 0 else {
    return
  }
  print(arr[0]) // O(1)
}


// problem 5: what is the runtime
func exampleFive(arr: [Int]) -> Int { // O(n^2)
  var counter = 0
  for num in arr { // O(n)
    if arr.contains(num+1) { // O(n)
      counter += 1
    }
  }
  return counter
}



// problem 6: what is the runtime
func exampleSix(string str: String, withCharacter c: Character) -> Bool {
  for char in str { // O(n)
    if char == c {
      return true
    }
  }
  return false
}


// problem 7: what is the runtime
func example7(arr: [Int]) {
  for num in arr { // O(n)
    print(num)
  }
  for _ in arr { // O(n^2)
    for num in arr {
      print(num)
    }
  }
  for num in arr { // O(n)
    print(num)
  }
}


// problem 8: what is the runtime
func secondSmallest(myArr: [Int]) -> Int? {
  guard myArr.count > 1 else {
    return nil
  }
  var min = myArr[0]
  var minIndex = 0
  for (index, num) in myArr.enumerated() { // O(n)
    if num < min {
      min = num
      minIndex = index
    }
  }
  var secondMin = (myArr[0] != min ? myArr[0] : myArr[1])
  for (index, num) in myArr.enumerated() { // O(n)
    if num < secondMin && index != minIndex {
      secondMin = num
    }
  }
  print(min, minIndex, secondMin)
  return secondMin
}



//=================================================================================
//                          Questions: String
//=================================================================================
// problem 1 // palindrome, pangram, anagram
/*
Palindrome.
Given a string str, write a functin that will return
true if is a palindrome and false if it is not?
If you recall, a palindrome is defined as "a word,
phrase, or sequence that reads the same backward as
forward". For now, assume that we will not have input
strings that contain special characters or spaces, so
the following examples hold:
Example 1:
​
Input:
let str = "thisisnotapalindrome"
​
Output: false
​
Example 2:
​
Input:
let str = "racecar"
​
Output: true
*/
let str1 = "racecar"
let str2 = "thisisnotapalindrome"
func palindrome(_ str: String) -> Bool {
    let word = str.lowercased()
    
    let arr = Array(word)
    var letterArr = [Character]()
    for letter in word.reversed() {
        letterArr.append(letter)
    }
    
    if letterArr == arr {
        return true
    } else {
        return false
    }
}

palindrome(str1)
palindrome(str2)

//=================================================================================
//                          Questions: Recursion
//=================================================================================

// problem 1
/*
 Multiply two given Ints.  Do not use for/while loops or the * operator.
​
 Sample Input: 5 * 6
​
 Sample Output: 30
*/


func mult(x: Int, y: Int) -> Int {
    if x == 0 || y == 0 {
        return 0
    }

    if x == 1 {
        return y
    } else if y == 1 {
        return x
    }

    return mult(x: x-1, y: y) + y
}

mult(x: 3, y: 3)
// problem 2 // hint: you can use function arguments to hold variable states
/*
 Find the sum of all the even numbers in an array
​
 Sample Input: [3,6,1,3,2, 10]
​
 Sample Output: 18
*/
func evensSum(arr: [Int], index: Int) -> Int {
    
    if index <= 0 {
        return 0
    }
    let decIndex = index - 1
    
    if arr[decIndex] % 2 == 0 {
        print(arr[decIndex])
        return evensSum(arr: arr, index: decIndex) + arr[decIndex]
    } else {
        return evensSum(arr: arr, index: decIndex)
    }
    
}
let theArr = [3,6,1,3,2,10]
evensSum(arr: theArr, index: theArr.count)

// problem 3
// https://www.hackerrank.com/challenges/30-recursion/problem


//=================================================================================
//                          Questions: Linked List
//=================================================================================

class LLNode {
  var value: Int
  var next: LLNode?
  init(_ value: Int) {
    self.value = value
  }
}

let node1 = LLNode(24)
let node2 = LLNode(2)
let node9 = LLNode(9)
let node4 = LLNode(4)
let node5 = LLNode(30)

node1.next = node2
node2.next = node9
node9.next = node4
node4.next = node5
// problem 1
// Using the Linked List above, write a function that finds the largest number in a Linked List of Ints.
// output: 9

func largestNum(list: LLNode) -> Int {
    
    
    // lowest possible number computer can make...
    var currentNode = list
    var max = currentNode.value
    var next: LLNode
    while currentNode.next != nil {
        next = currentNode.next!
        
        // 1 - 2 - 9 - 4 - 20
        
        
          //  max = currentNode
        if next.value > max {
            max = next.value
        }
        currentNode = currentNode.next!
    }
    return max
}

largestNum(list: node1)


// problem 2
// https://leetcode.com/problems/reverse-linked-list/

//=================================================================================
//                          Solutions: Big O Notation
//=================================================================================

/*
 problem 1: O(1) - constant time
 problem 2: O(n) - linear time
 problem 3: O(n ^ 2) - quadratic time
 problem 4: O(1) - constant time
 problem 5: O(n ^ 2) - quadratic time
 problem 6: O(n) - linear time
 problem 7: O(n ^ 2) - quadratic time
 problem 8: O(n) - linear time
*/
