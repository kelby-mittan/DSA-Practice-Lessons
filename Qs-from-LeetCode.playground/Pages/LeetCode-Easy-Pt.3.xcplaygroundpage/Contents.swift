
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

//==================================================================================

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

repeatedNTimes([5,1,5,2,5,3,5,4])

//==================================================================================

/*
 1450. Number of Students Doing Homework at a Given Time
 Easy

 Given two integer arrays startTime and endTime and given an integer queryTime.

 The ith student started doing their homework at the time startTime[i] and finished it at time endTime[i].

 Return the number of students doing their homework at time queryTime. More formally, return the number of students where queryTime lays in the interval [startTime[i], endTime[i]] inclusive.

 Example 1:

 Input: startTime = [1,2,3], endTime = [3,2,7], queryTime = 4
 Output: 1
 Explanation: We have 3 students where:
 The first student started doing homework at time 1 and finished at time 3 and wasn't doing anything at time 4.
 The second student started doing homework at time 2 and finished at time 2 and also wasn't doing anything at time 4.
 The third student started doing homework at time 3 and finished at time 7 and was the only student doing homework at time 4.
 Example 2:

 Input: startTime = [4], endTime = [4], queryTime = 4
 Output: 1
 Explanation: The only student was doing their homework at the queryTime.
 Example 3:

 Input: startTime = [4], endTime = [4], queryTime = 5
 Output: 0
 Example 4:

 Input: startTime = [1,1,1,1], endTime = [1,3,2,4], queryTime = 7
 Output: 0
 Example 5:

 Input: startTime = [9,8,7,6,5,4,3,2,1], endTime = [10,10,10,10,10,10,10,10,10], queryTime = 5
 Output: 5
 */

func busyStudent(_ startTime: [Int], _ endTime: [Int], _ queryTime: Int) -> Int {
    var numStudents = 0
    var i = startTime.count - 1

    while i >= 0 {
        if endTime[i] >= queryTime && startTime[i] <= queryTime {
            numStudents += 1
        }
        i -= 1
    }
    return numStudents
}

//==================================================================================

/*
 905. Sort Array By Parity
 Easy

 Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.

 You may return any answer array that satisfies this condition.

 Example 1:

 Input: [3,1,2,4]
 Output: [2,4,3,1]
 The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
 */

func sortArrayByParity(_ A: [Int]) -> [Int] {
    var result = [Int]()

    for i in 0..<A.count {
        if A[i] % 2 == 0 {
            result.insert(A[i], at: 0)
        } else {
            result.append(A[i])
        }
    }

    return result

}

sortArrayByParity([3,1,2,4])

//====================================================================================

/*
 1299. Replace Elements with Greatest Element on Right Side
 Easy

 Given an array arr, replace every element in that array with the greatest element among the elements to its right, and replace the last element with -1.

 After doing so, return the array.

  

 Example 1:

 Input: arr = [17,18,5,4,6,1]
 Output: [18,6,6,6,1,-1]
 */

func replaceElements(_ arr: [Int]) -> [Int] {
    var resultArray = [Int]()
    resultArray = arr
    var highestFromRight = resultArray[resultArray.count - 1]
    resultArray[resultArray.count - 1] = -1

    for i in (0..<resultArray.count - 1).reversed(){
        let temp = resultArray[i]
        resultArray[i] = highestFromRight

        if highestFromRight < temp{
            highestFromRight = temp
        }
    }
    return resultArray
}

//=====================================================================================

/*
 929. Unique Email Addresses
 Easy

 Every email consists of a local name and a domain name, separated by the @ sign.

 For example, in alice@leetcode.com, alice is the local name, and leetcode.com is the domain name.

 Besides lowercase letters, these emails may contain '.'s or '+'s.

 If you add periods ('.') between some characters in the local name part of an email address, mail sent there will be forwarded to the same address without dots in the local name.  For example, "alice.z@leetcode.com" and "alicez@leetcode.com" forward to the same email address.  (Note that this rule does not apply for domain names.)

 If you add a plus ('+') in the local name, everything after the first plus sign will be ignored. This allows certain emails to be filtered, for example m.y+name@email.com will be forwarded to my@email.com.  (Again, this rule does not apply for domain names.)

 It is possible to use both of these rules at the same time.

 Given a list of emails, we send one email to each address in the list.  How many different addresses actually receive mails?

 Example 1:

 Input: ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
 Output: 2
 Explanation: "testemail@leetcode.com" and "testemail@lee.tcode.com" actually receive mails
 */

func numUniqueEmails(_ emails: [String]) -> Int {
    var emailArray = [String]()
    for e in emails {
        let eArray = Array(e)
        var local = ""
        for i in 0..<eArray.count {
            if eArray[i] == "." {
               continue
            }
            else if eArray[i] == "@" {
                local += String(eArray[i..<eArray.count])
                break
            }
            else if eArray[i] == "+" {
                var j = i
                while eArray[j] != "@" {
                    j += 1
                }
                local += String(eArray[j..<eArray.count])
                break
            }
            local += String(eArray[i])
        }
        emailArray.append(local)
    }
    return Set(emailArray).count
}

numUniqueEmails(["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"])
