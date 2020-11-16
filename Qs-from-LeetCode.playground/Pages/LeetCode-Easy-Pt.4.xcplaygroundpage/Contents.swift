//: [Previous](@previous)

import Foundation

/*
 977. Squares of a Sorted Array
 Easy

 Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.

 Example 1:

 Input: [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Example 2:

 Input: [-7,-3,2,3,11]
 Output: [4,9,9,49,121]
 */

func sortedSquares(_ A: [Int]) -> [Int] {
    var n = 0
    var m = A.count - 1
    var index = A.count - 1
    var array = A
    while n <= m {
        let n2 = A[n] * A[n]
        let m2 = A[m] * A[m]
        if n2 <= m2 {
            array[index] = m2
            m -= 1
            index -= 1
        } else {
            array[index] = n2
            n += 1
            index -= 1
        }
    }
    return array
}

sortedSquares([-7,-3,2,3,11])

//================================================================================

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

//=================================================================================

/*
 122. Best Time to Buy and Sell Stock II
 Easy

 Say you have an array prices for which the ith element is the price of a given stock on day i.

 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).

 Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

 Example 1:

 Input: [7,1,5,3,6,4]
 Output: 7
 Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
              Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 Example 2:

 Input: [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
              Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
              engaging multiple transactions at the same time. You must sell before buying again.
 Example 3:

 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 */

func maxProfit(_ prices: [Int]) -> Int {
    if prices.count == 0 {
        return 0
    }
    var profit = 0
    
    for i in 1..<prices.count {
        if prices[i] > prices[i-1] {
            profit += prices[i] - prices[i-1]
        }
    }
    
    return profit
}

maxProfit([7,6,4,3,1])

//================================================================================

/*
 13. Roman to Integer
 Easy

 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given a roman numeral, convert it to an integer.

 Example 1:

 Input: s = "III"
 Output: 3
 Example 2:

 Input: s = "IV"
 Output: 4
 Example 3:

 Input: s = "IX"
 Output: 9
 Example 4:

 Input: s = "LVIII"
 Output: 58
 Explanation: L = 50, V= 5, III = 3.
 Example 5:

 Input: s = "MCMXCIV"
 Output: 1994
 Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
 */

func romanToInt(_ s: String) -> Int {
        var result = 0
    let dict: [Character : Int] =
        ["I" : 1, "V" : 5, "X" : 10, "L" : 50, "C" : 100, "D" : 500, "M" : 1000]

    var strArr = [Character]()

    for char in s {
        strArr.append(char)
    }
    
    var prev = 0

    for i in 0..<strArr.count {
        
        if prev >= dict[strArr[i]]! {
            result += dict[strArr[i]]!
        } else {
            result = result - (2 * prev) + dict[strArr[i]]!
        }
        prev = dict[strArr[i]]!
        
    }
    return result
}

romanToInt("LVIII")

//================================================================================

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
    var occDict: [Character: Int] = [:]
    var sum = 0

    for ch in chars {
        occDict[ch, default: 0] += 1
    }

    for word in words {
        var tempDict = occDict
        var validCount = 0

        for ch in word {
            if tempDict[ch, default: 0] > 0 {
                tempDict[ch, default: 0] -= 1
                validCount += 1
            }
        }

        if validCount == word.count {
            sum += word.count
        }
    }

    return sum
}

countCharacters(["cat","bt","hat","tree"], "atach")
