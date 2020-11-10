
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

print(uniqueMorseRepresentations(["gin", "zen", "gig", "msg"]))

//==================================================================================

/*
 1021. Remove Outermost Parentheses
 Easy

 A valid parentheses string is either empty (""), "(" + A + ")", or A + B, where A and B are valid parentheses strings, and + represents string concatenation.  For example, "", "()", "(())()", and "(()(()))" are all valid parentheses strings.

 A valid parentheses string S is primitive if it is nonempty, and there does not exist a way to split it into S = A+B, with A and B nonempty valid parentheses strings.

 Given a valid parentheses string S, consider its primitive decomposition: S = P_1 + P_2 + ... + P_k, where P_i are primitive valid parentheses strings.

 Return S after removing the outermost parentheses of every primitive string in the primitive decomposition of S.

 Example 1:

 Input: "(()())(())"
 Output: "()()()"
 Explanation:
 The input string is "(()())(())", with primitive decomposition "(()())" + "(())".
 After removing outer parentheses of each part, this is "()()" + "()" = "()()()".
 Example 2:

 Input: "(()())(())(()(()))"
 Output: "()()()()(())"
 Explanation:
 The input string is "(()())(())(()(()))", with primitive decomposition "(()())" + "(())" + "(()(()))".
 After removing outer parentheses of each part, this is "()()" + "()" + "()(())" = "()()()()(())".
 Example 3:

 Input: "()()"
 Output: ""
 Explanation:
 The input string is "()()", with primitive decomposition "()" + "()".
 After removing outer parentheses of each part, this is "" + "" = "".
 */

func removeOuterParentheses(_ S: String) -> String {
    var result = ""
    var counter = 0
    for s in S {
        if s == "(" {
           if counter > 0 {
              result.append(s)
           }
           counter += 1
        } else if s == ")" {
           counter -= 1
           if counter > 0 {
               result.append(s)
           }
        }
    }
    return result
}

removeOuterParentheses("(()())(())(()(()))")
