
import Foundation

/*
 1281. Subtract the Product and Sum of Digits of an Integer
 Easy

 Given an integer number n, return the difference between the product of its digits and the sum of its digits.
  

 Example 1:

 Input: n = 234
 Output: 15
 Explanation:
 Product of digits = 2 * 3 * 4 = 24
 Sum of digits = 2 + 3 + 4 = 9
 Result = 24 - 9 = 15
 Example 2:

 Input: n = 4421
 Output: 21
 Explanation:
 Product of digits = 4 * 4 * 2 * 1 = 32
 Sum of digits = 4 + 4 + 2 + 1 = 11
 Result = 32 - 11 = 21
 */

func subtractProductAndSum(_ n: Int) -> Int {
    
    let numArr = Array(String(n))
    var prod = 1
    var sum = 0
    for num in numArr {
        prod *= Int(String(num)) ?? 0
        sum += Int(String(num)) ?? 0
    }
    return prod - sum
}

//==================================================================================

/*
 804. Unique Morse Code Words
 Easy

 International Morse Code defines a standard encoding where each letter is mapped to a series of dots and dashes, as follows: "a" maps to ".-", "b" maps to "-...", "c" maps to "-.-.", and so on.

 For convenience, the full table for the 26 letters of the English alphabet is given below:

 [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
 Now, given a list of words, each word can be written as a concatenation of the Morse code of each letter. For example, "cab" can be written as "-.-..--...", (which is the concatenation "-.-." + ".-" + "-..."). We'll call such a concatenation, the transformation of a word.

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
