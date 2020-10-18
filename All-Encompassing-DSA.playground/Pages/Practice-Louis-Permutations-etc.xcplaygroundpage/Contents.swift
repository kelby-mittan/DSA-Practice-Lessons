//: [Previous](@previous)

import Foundation

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

  // BASE CASE
  if remaining.count == 0 {
    // AGGREGATION
    results.append(base)
    return
  }

  var s = remaining
  for i in 0..<remaining.count {
    let index = remaining.index(remaining.startIndex, offsetBy: i)
    let character = remaining[index]
    // INCREMENTAL STEP
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
}

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

func isPalindrome(str: String) -> Bool {

  let occDict = getOccurences(str: str)

  var oddOccurrences = 0

  for (_, val) in occDict {
    if val % 2 == 1 {
      oddOccurrences += 1
    }
  }

  return oddOccurrences <= 1

}

func getOccurences(str: String) -> [Character:Int] {
  var occDict: [Character:Int] = [:]

  for char in str {
    if char != " " {
      if occDict[char] == nil {
      occDict[char] = 1
    } else {
      occDict[char]! += 1
    }
    }
    
  }
    return occDict
}

assert(isPalindrome(str: "racecar"))
assert(isPalindrome(str: "notaracecar")==false)
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
  if n <= 0 {
    return 0
  }
  return numberOfHopsHelper(n)
}

func numberOfHopsHelper(_ n: Int) -> Int {
  var result = 0
  if n < 0 {
    result = 0
  } else if n == 0 {
    result = 1
  } else {
    result = numberOfHopsHelper(n - 1) + numberOfHopsHelper(n - 2) + numberOfHopsHelper(n - 3)
  }
  print("returning", result, "for", n)
  return result
}
