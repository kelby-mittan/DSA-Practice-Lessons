//: [Previous](@previous)

import Foundation

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
    var result = Set<String>()
    
    for email in emails {
        let components = email.components(separatedBy: "@")
        let components2 = components[0].components(separatedBy: "+")
        var local = components2[0]
        local = local.replacingOccurrences(of: ".", with: "")
        result.insert(local + "@" + components[1])
    }
    return result.count
}

numUniqueEmails(["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"])


/*
 1189. Maximum Number of Balloons
 Easy

 Given a string text, you want to use the characters of text to form as many instances of the word "balloon" as possible.

 You can use each character in text at most once. Return the maximum number of instances that can be formed.

  

 Example 1:
 Input: text = "nlaebolko"
 Output: 1
 
 Example 2:
 Input: text = "loonbalxballpoon"
 Output: 2
 
 Example 3:

 Input: text = "leetcode"
 Output: 0
 */

func maxNumberOfBalloons(_ text: String) -> Int {
    var dict = [Character:Int]()

    let balloon = "balloon"

    var min = Int.max

    for char in text {
        dict[char, default: 0] += 1
    }
    
    dict["l"] = (dict["l"] ?? 0) / 2
    dict["o"] = (dict["o"] ?? 0) / 2

    for letter in balloon {
        guard let count = dict[letter] else { return 0 }
        if count < min {
            min = count
        }
    }
    if min == Int.max {
        return 0
    } else {
       return min
    }
}

maxNumberOfBalloons("loonbalxballpoon")


/*
 409. Longest Palindrome
 Easy
 
 Given a string which consists of lowercase or uppercase letters, find the length of the longest palindromes that can be built with those letters.

 This is case sensitive, for example "Aa" is not considered a palindrome here.

 Note:
 Assume the length of given string will not exceed 1,010.

 Example:

 Input:
 "abccccdd"

 Output:
 7

 Explanation:
 One longest palindrome that can be built is "dccaccd", whose length is 7.
 */

func longestPalindrome(_ s: String) -> Int {
    if s.count <= 1 {
        return s.count
    }
    var countDict = [Character:Int]()
    var count = 0
    
    //Count a number of a specific character's occurance
    for c in s{
        countDict[c] = countDict[c, default: 0] + 1
    }
    
    //Check if we have a character that occured odd nubmer of times. If there is one, we subtract 1 and add 1 to count (since the subtracted character becomes center of palindrome)
    for key in countDict.keys{
        if countDict[key]! % 2 != 0{
            countDict[key]! = countDict[key]! - 1
            count += 1
            break
        }
    }
    
    //Do sum
    for key in countDict.keys{
        if countDict[key]! % 2 != 0 {
            //odd
            count += countDict[key]! - 1
        }else{
            //even
            count += countDict[key]!
        }
    }
    
    return count
}


/*
 20. Valid Parentheses
 Easy

 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.

 Example 1:

 Input: "()"
 Output: true
 Example 2:

 Input: "()[]{}"
 Output: true
 Example 3:

 Input: "(]"
 Output: false
 Example 4:

 Input: "([)]"
 Output: false
 Example 5:

 Input: "{[]}"
 Output: true
 */

func isValid(_ s: String) -> Bool {
    
    let dict: [Character:Character] = ["(": ")", "{": "}", "[": "]"]
    var result: [Character] = []
    for char in s {
        if let closed = dict[char] {
            result.append(closed)
            print("if \(result)")
        } else if result.last == char {
            result.removeLast()
            print("else if \(result)")
//            continue
        } else { return false }
    }
    
    return result.isEmpty
}

isValid("()([]){}{}")
