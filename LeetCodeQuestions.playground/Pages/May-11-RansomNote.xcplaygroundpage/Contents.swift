//: [Previous](@previous)

import Foundation

/*
 383. Ransom Note
 Easy

 Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.

 Each letter in the magazine string can only be used once in your ransom note.

  

 Example 1:

 Input: ransomNote = "a", magazine = "b"
 Output: false
 Example 2:

 Input: ransomNote = "aa", magazine = "ab"
 Output: false
 Example 3:

 Input: ransomNote = "aa", magazine = "aab"
 Output: true
 */

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    
    var magStr = magazine

    for char in ransomNote {
        if magStr.contains(char) {
            guard let index = magStr.firstIndex(of: char) else {return false}
            magStr.remove(at: index)
        } else {
            return false
        }
    }

    return true
    
//    var occDict = [Character:Int]()
//    var note = ransomNote
//
//    for char in magazine {
//        if occDict[char] == nil {
//            occDict[char] = 1
//        } else {
//            occDict[char]! += 1
//        }
//    }
//
//    while !note.isEmpty {
//        let letter = note.removeLast()
//        if occDict[letter] == nil {
//            return false
//        } else if occDict[letter]! > 0 {
//            occDict[letter]! -= 1
//        } else {
//            return false
//        }
//    }
//    return true
}

canConstruct("aa", "aab")

func canConstruct2(_ ransomNote: String, _ magazine: String) -> Bool {
    
    var magDict = [Character:Int]()
    var noteDict = [Character:Int]()
    
    for char in magazine {
        if magDict[char] == nil {
            magDict[char] = 1
        } else {
            magDict[char]! += 1
        }
    }
    
    for char in ransomNote {
        if noteDict[char] == nil {
            noteDict[char] = 1
        } else {
            noteDict[char]! += 1
        }
    }
    
    for (key,value) in noteDict {
        guard let magVal = magDict[key] else { return false }
        if value > magVal {
            return false
        }
    }
    return true
}

canConstruct2("aa", "aab")


/*
 1431. Kids With the Greatest Number of Candies
 Easy
 Given the array candies and the integer extraCandies, where candies[i] represents the number of candies that the ith kid has.

 For each kid check if there is a way to distribute extraCandies among the kids such that he or she can have the greatest number of candies among them. Notice that multiple kids can have the greatest number of candies.

  

 Example 1:

 Input: candies = [2,3,5,1,3], extraCandies = 3
 Output: [true,true,true,false,true]
 Explanation:
 Kid 1 has 2 candies and if he or she receives all extra candies (3) will have 5 candies --- the greatest number of candies among the kids.
 Kid 2 has 3 candies and if he or she receives at least 2 extra candies will have the greatest number of candies among the kids.
 Kid 3 has 5 candies and this is already the greatest number of candies among the kids.
 Kid 4 has 1 candy and even if he or she receives all extra candies will only have 4 candies.
 Kid 5 has 3 candies and if he or she receives at least 2 extra candies will have the greatest number of candies among the kids.
 Example 2:

 Input: candies = [4,2,1,1,2], extraCandies = 1
 Output: [true,false,false,false,false]
 Explanation: There is only 1 extra candy, therefore only kid 1 will have the greatest number of candies among the kids regardless of who takes the extra candy.
 Example 3:

 Input: candies = [12,1,12], extraCandies = 10
 Output: [true,false,true]
 */

func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    guard let max = candies.max() else { fatalError() }
    var candyArr = [Bool]()
    for candy in candies {
        if (candy+extraCandies) > max {
            candyArr.append(true)
        } else {
            candyArr.append(false)
        }
    }
    return candyArr
}

kidsWithCandies([4,2,1,1,2], 1)
