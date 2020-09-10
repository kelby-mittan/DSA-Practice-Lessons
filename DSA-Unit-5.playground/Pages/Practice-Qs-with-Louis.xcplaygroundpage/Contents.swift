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
 - Input: {den, bent, dew, dents, dent, bet} { ben, bent, bents, bentss}
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

func getChain(_ arr: [String]) -> Int {
    var count = 0
    
    let sortedArr = arr.sorted { $0.count < $1.count }
        
    for i in 0 ..< sortedArr.count {
        
        if i == sortedArr.count {
            break
        }
        
        let word = sortedArr[i]

        let oneCountUpArr = sortedArr.filter { $0.count == word.count + 1 }
    
        for str in oneCountUpArr {
            let withoutLastChar = String(str[str.startIndex..<word.endIndex])
            if withoutLastChar == word {
                count += 1
                break
            }
        }
        
    }
    
    return count
}

getChain(["bev","den","add", "bent", "dew", "dents", "dent", "bet","denzas"])

