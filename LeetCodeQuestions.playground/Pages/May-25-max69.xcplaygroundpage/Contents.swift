//: [Previous](@previous)

import Foundation

/*
 1323. Maximum 69 Number
 Easy

 Given a positive integer num consisting only of digits 6 and 9.

 Return the maximum number you can get by changing at most one digit (6 becomes 9, and 9 becomes 6).

  

 Example 1:

 Input: num = 9669
 Output: 9969
 Explanation:
 Changing the first digit results in 6669.
 Changing the second digit results in 9969.
 Changing the third digit results in 9699.
 Changing the fourth digit results in 9666.
 The maximum number is 9969.
 Example 2:

 Input: num = 9996
 Output: 9999
 Explanation: Changing the last digit 6 to 9 results in the maximum number.
 Example 3:

 Input: num = 9999
 Output: 9999
 Explanation: It is better not to apply any change.
 */

func maximum69Number (_ num: Int) -> Int {
    
    var numArr = Array(String(num))
    
    for (i,n) in numArr.enumerated() {
        if n == "6" {
            numArr[i] = "9"
            break
        }
    }
    
    return Int(String(numArr))!
}

maximum69Number(9669)

/*
 804. Unique Morse Code Words
 Easy

 International Morse Code defines a standard encoding where each letter is mapped to a series of dots and dashes, as follows: "a" maps to ".-", "b" maps to "-...", "c" maps to "-.-.", and so on.

 For convenience, the full table for the 26 letters of the English alphabet is given below:

 [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
 Now, given a list of words, each word can be written as a concatenation of the Morse code of each letter. For example, "cba" can be written as "-.-..--...", (which is the concatenation "-.-." + "-..." + ".-"). We'll call such a concatenation, the transformation of a word.

 Return the number of different transformations among all words we have.

 Example:
 Input: words = ["gin", "zen", "gig", "msg"]
 Output: 2
 Explanation:
 The transformation of each word is:
 "gin" -> "--...-."
 "zen" -> "--...-."
 "gig" -> "--...--."
 "msg" -> "--...--."

 There are 2 different transformations, "--...-." and "--...--.".
 */

func uniqueMorseRepresentations(_ words: [String]) -> Int {

    let morseArr = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    let alph = Array("abcdefghijklmnopqrstuvwxyz")

    var dict = [Character:String]()

    for i in 0..<alph.count {
        dict[alph[i]] = morseArr[i]
    }
    
    var morseResult = [String]()
    
    for word in words {
        var str = String()
        for char in word {
            str += dict[char]!
        }
        morseResult.append(str)
    }

    return Set(morseResult).count
}

uniqueMorseRepresentations(["gin", "zen", "gig", "msg"])

/*
 961. N-Repeated Element in Size 2N Array
 Easy

 In a array A of size 2N, there are N+1 unique elements, and exactly one of these elements is repeated N times.

 Return the element repeated N times.

  

 Example 1:

 Input: [1,2,3,3]
 Output: 3
 Example 2:

 Input: [2,1,2,5,3,2]
 Output: 2
 Example 3:

 Input: [5,1,5,2,5,3,5,4]
 Output: 5
 */

func repeatedNTimes(_ A: [Int]) -> Int {
    
    var dict = [Int:Int]()
    
    for n in A {
        dict[n,default: 0] += 1
    }
    for (key,val) in dict where val == A.count/2 {
            return key
    }
    return 0
}

repeatedNTimes([2,1,2,5,3,2])
