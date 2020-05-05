//: [Previous](@previous)

import Foundation

/*
 1160. Find Words That Can Be Formed by Characters
 Easy

 You are given an array of strings words and a string chars.

 A string is good if it can be formed by characters from chars (each character can only be used once).

 Return the sum of lengths of all good strings in words.

  

 Example 1:

 Input: words = ["cat","bt","hat","tree"], chars = "atach"
 Output: 6
 Explanation:
 The strings that can be formed are "cat" and "hat" so the answer is 3 + 3 = 6.
 Example 2:

 Input: words = ["hello","world","leetcode"], chars = "welldonehoneyr"
 Output: 10
 Explanation:
 The strings that can be formed are "hello" and "world" so the answer is 5 + 5 = 10.
 */


func countCharacters(_ words: [String], _ chars: String) -> Int {
    guard words.count <= 1000 else { return 0 }
    guard chars.count <= 100 else { return 0 }
    let str = chars
    let setChars = Set(chars)
    var charArr = [Character]()
    for word in words {
        let setWord = Set(word)
        if setWord.isSubset(of: setChars) {
            for char in word {
                if str.contains(char) {
                    charArr.append(char)
                }
            }
        }
    }
    return charArr.count
}

func countCharacters2(_ words: [String], _ chars: String) -> Int {
    var charsDict = [String: Int]()
    var sum = 0
    
    chars.forEach {
        charsDict[String($0)] = (charsDict[String($0)] ?? 0) + 1
    }
    
    Loop: for word in words {
        
        guard word.count <= chars.count else {
            continue
        }
        
        var charsDict = charsDict
        
        for letter in word {
            let letter = String(letter)
            if charsDict.keys.contains(letter) {
                charsDict[letter] = (charsDict[letter] ?? 0) - 1
                if charsDict[letter] == 0 {
                    charsDict[letter] = nil
                }
            } else {
                continue Loop
            }
        }
        
        sum += word.count
    }
    
    return sum
}
