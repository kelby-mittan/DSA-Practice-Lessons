//: [Previous](@previous)

import Foundation

/*
 
 Given a set of words, determine the longest chain of words
 in that set that can be made out of those words with the
 following properties:
 - Each word in the chain is one letter longer than the previous word
 - Each word in the chain differs from the previous word only by its last letter
 
 Constraint Examples:
 - den -> dent-> dents is valid (meets all constraints)
 - den -> dew is not valid (same length)
 - den -> cent is not valid (differs by 1’st char [‘d’ != ‘c’])
 
 I/O Example:
 - Input: {den, bent, dew, dents, dent, bet}
 - Result: 3 ({den, dent, dents})
 
 */

// print("Welcome to the interview!")

// sorting the array of strings by characters
// 1. evaluate the string with the least # of char
// 2. finding the next string that has one more character
// 3. compare first each letter in the count of the prior word letters and if they're equal to the prior word add a count of 1
// 4.  keep track of that value until all comparisons have been exhausted

// {den, bent, dew, dents, dent, bet}

// den, dew, bet, bent, dent, dents

// ["abe", "abcd", "abc"].sort()
// ["abc", "abcd", "abe"]

// fdt abcg fdtz abcgx -> abcg abcgx fdt fdtz


class Node<T: Equatable> {
    let value: T
    var children: [Node<T>] = []
    
    init(value: T) {
        self.value = value
    }
    
    func addChildren(value: T) -> Node<T> {
        
        if let index = children.firstIndex(where: { (node) -> Bool in
            node.value == value
        }) {
            return children[index]
        } else {
            let newNode = Node(value: value)
            children.append(newNode)
            return newNode
        }
    }
}



struct Tree<T:Equatable>{
    var root: Node<T>?
    
    init() {}
    
    
}


// 1: iterating through each word in the input and adding the nodes
// 2: Traverse the tree while counting the number of times running into an end node.



func getChainWithTree(_ arr: [String]) -> Int {
    
    guard !arr.isEmpty else { return 0 }
    guard arr.count != 1 else { return 1 }
    
    var tree = Tree<String>()
    tree.root = Node(value: "")
    
    for word in arr {
        
        var currentNode = tree.root!
        
        for char in word {
            
//            if getHeight(currentNode) == word.count {
                currentNode = currentNode.addChildren(value: String(char))
//            }
            print(String(char))
            //            print(currentNode.children)
        }
        
        currentNode.addChildren(value: "end")
    }
    
    return chainCounter(tree.root!, count: 0)
}

func getHeight<T>(_ node: Node<T>?) -> Int {
  guard let node = node else {
    return 0
  }

  var heights: [Int] = []
  for child in node.children {
    heights.append(getHeight(child))
  }
  return 1 + (heights.max() ?? 0)
}

func chainCounter(_ node: Node<String>, count: Int) -> Int {
    //    var newNode = node
    var chainCount = count
    
    print("val: \(node.value)")
    if node.children.contains(where: { (node) -> Bool in
        node.value == "end"
    }) {
        chainCount += 1
        print(node.value)
        print(chainCount)
    }
    
    var childChainCounts = [Int]()
    
    for child in node.children {
        childChainCounts.append(chainCounter(child, count: chainCount))
    }
    print(childChainCounts.count)
    
//    for (i,int) in childChainCounts.sorted().enumerated() {
//        if i > 0 {
//            if int > childChainCounts[i-1] + 1 {
//                childChainCounts = Array(childChainCounts[0..<i])
//            }
//        }
//        
//    }
    return childChainCounts.max() ?? chainCount
}


getChainWithTree(["den", "dent", "dents", "abc", "abcd", "abcde", "dentsy", "dentsyop"])


func getChain(_ arr: [String]) -> Int {
    
    guard !arr.isEmpty else { return 0 }
    
    
    var maxChainCount = 1
    
    let sortedArr = arr.sorted { $0.count < $1.count }
    
    for i in 0 ..< sortedArr.count - 1 {
        
        var count = 1
        
        let word = sortedArr[i]
        
        let oneCountUpArr = sortedArr.filter { $0.count == word.count + 1 }
        
        for str in oneCountUpArr {
            let withoutLastChar = String(str[str.startIndex..<word.endIndex])
            if withoutLastChar == word {
                count += 1
                
                if count >= maxChainCount {
                    maxChainCount = count
                }
                break
            }
            
        }
        
    }
    
    return maxChainCount
}

getChain(["den","add", "bent", "dew", "dents", "dent", "bet","denzas"])

getChain(["den", "dent", "dents", "abc", "abcd", "abcde", "dentsy"])

// den abc dent abcd



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
