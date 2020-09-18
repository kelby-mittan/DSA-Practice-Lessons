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

func getChainWithTree(_ arr: [String]) -> Int {
    
    guard !arr.isEmpty else { return 0 }
    guard arr.count != 1 else { return 1 }
    
    var tree = Tree<String>()
    tree.root = Node(value: "")
    
    let sortedArr = arr.sorted { $0.count < $1.count }
    
    for (i,word) in sortedArr.enumerated() {
        
        var currentNode = tree.root!
        
        for char in word {
            
            print("Height: \(getHeight(currentNode))")
            
            if i > 0 {
                if word.count == sortedArr[i-1].count + 1 {
                    currentNode = currentNode.addChildren(value: String(char))
                }
            }
            
            print("this nodes children: \(currentNode.children.count )")
            
            print(String(char))
            
        }
        
            
        currentNode.addChildren(value: "end")
        
    }
    
    
    
    return chainCounter(tree.root!, count: 0)
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
    print(childChainCounts)
    
//    var newArr = [Int]()
    
//    for (i,int) in childChainCounts.sorted().enumerated() {
//        if i > 0 {
//            if int == childChainCounts[i-1] + 1 {
////                childChainCounts = Array(childChainCounts[0..<i])
//                newArr.append(int)
//            }
//        }
//
//    }
    
    return childChainCounts.max() ?? chainCount
}


getChainWithTree(["den", "dent", "dents", "abc", "abcd", "abcde", "dentsy", "dentsyopp"])


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




