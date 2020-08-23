import UIKit


func isUnique(_ str: String) -> Bool {
    var string = str

    
    
    for (i, char) in string.enumerated() {
        var letter = char
        
        for (i2, char2) in string.enumerated() {
            if i != i2 && char == char2  {
                return false
            }
        }
        
    }
//    var occDict: [Character: Int] = [:]
//
//    for char in string {
//        if occDict[char] == nil {
//            occDict[char] = 1
//        } else {
////            occDict[char]! += 1
//            return false
//        }
//    }

    return true
    
    
}


// write a function that given a string returns a list of all its unique permutations
// input: "abc"
// output: ["abc, "acb", "bac", "bca", "cab", "cba"]

//1.
func makePermutations(str: String) -> [String] {
  var results: [String] = []
  makePermutationsHelper(base: "", remaining: str, results: &results)
  print("the results are", results)
  return results
}

func makePermutationsHelper(base: String, remaining: String, results: inout [String]) {

  if remaining.count == 0 {
    results.append(base)
    return
  }

  var s = remaining
  for i in 0..<remaining.count {
    let index = remaining.index(remaining.startIndex, offsetBy: i)
    let character = remaining[index]
    // all of the character except the one at index
    let nextIndex = remaining.index(remaining.startIndex, offsetBy: i+1)
    let newRemaining = String(remaining[..<index] + remaining[nextIndex...])
    // var character = String(s.first())
    // "hey".dropFirst() => "ey", "hey"
    // "hey".removeFirst() => "h", "ey"
    let newBase = base + String(character)
    print(newBase)
    print(s)
    makePermutationsHelper(base: newBase, remaining: newRemaining, results: &results)
  }

  
  
  // for char in str {

  // }
}

assert(makePermutations(str: "a") == ["a"])
assert(makePermutations(str: "ab") == ["ab", "ba"])

// Given a string, write a function to check if it is a permutation of a palindrome
// a palindrome is a word or phrase that is the same forwards and backwards
// a permutation is a rearrangemenet of letters
// the palindrome does not need to be limited to just dictionary words

// example
// input: "tact coa"
// output: True, (permutations: "taco cat", "atco cta", etc.)

// steps
// 1. count the num of occurences for each char
// 2. if they're all even then a permutation can be made
// 3. as long as there's only one char that has an odd num of occurences return True

// func isPalindrome(str: String) -> Bool {

//   let occDict = getOccurences(str: str)

//   var oddOccurrences = 0

//   for (_, val) in occDict {
//     if val % 2 == 1 {
//       oddOccurrences += 1
//     }
//   }

//   return oddOccurrences <= 1

// }

// func getOccurences(str: String) -> [Character:Int] {
//   var occDict: [Character:Int] = [:]

//   for char in str {
//     if char != " " {
//       if occDict[char] == nil {
//       occDict[char] = 1
//     } else {
//       occDict[char]! += 1
//     }
//     }
    
//   }
// }

// assert(isPalindrome(str: "racecar"))
// assert(isPalindrome(str: "notaracecar")==false)
// assert(isPalindrome(str: "tact coa"))

print("success!")


//a child is running up a staircase with n steps
// can hop either 1, 2 or 3 steps at a time.

// implement a method to count how many possible ways the child can run up the stairs

// building blocks of recursion:
// 1. base case
// 2. iterative step
// 3. aggregation

// base case - when there's 1 step, there's only 1 combo
// iterative step - which size step size chosen
// aggregation - count/sum of all possible paths

// 1. 2
// [1,1] [2]

func numberOfHops(_ n: Int) -> Int {
  if (n <= 0) {
    return 0
  }
  return numberOfHopsHelper(n)
}

func numberOfHopsHelper(_ n: Int) -> Int {
  var result = 0;
  if n < 0{
    result = 0
  } else if n == 0 {
    result = 1
  } else {
    result = numberOfHopsHelper(n - 1) + numberOfHopsHelper(n - 2) + numberOfHopsHelper(n - 3)
  }
  print("returning", result, "for", n)
  return result
}



// assert(numberOfHops(2) == 2)
// assert(numberOfHops(0) == 0)
// print("Success!")
// 2 -> 1 -> 0 # one possible
//        -> -1 # not possible!
//        -> -2 # not possible!
//   -> 0 # one possible combo
//   -> -1 # not possible, not different!


class MyStack<T> {
  private class StackNode<T> {
    var data: T
    var nextBeneath: StackNode<T>?
    init(_ item: T) {
      data = item
      nextBeneath = nil
    }
  }

  init() {
    topNode = nil;
  }

  private var topNode: StackNode<T>?

  // pop
  // push
  // peek
  // isEmpty
  func pop() -> T? {
    // guard topNode != nil else { return T}
    
    return topNode?.data
  }

  func push(_ item: T) -> () {
    let new = StackNode(item)
    new.nextBeneath = topNode
    topNode = new
  }

  func peek() -> T? {
    // guard if topnode is nil
    return topNode?.data
  }

  func isEmpty() -> Bool {
    return topNode == nil
  }
}

let myStack = MyStack<String>()
myStack.push("hey")
myStack.push("what up")
print(myStack.peek()!) // ?
print(myStack.pop()!)// ?
print(myStack.peek()!)
