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

replaceElements([17,18,5,4,6,1])

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

/*
 1122. Relative Sort Array
 Easy

 Given two arrays arr1 and arr2, the elements of arr2 are distinct, and all elements in arr2 are also in arr1.

 Sort the elements of arr1 such that the relative ordering of items in arr1 are the same as in arr2.  Elements that don't appear in arr2 should be placed at the end of arr1 in ascending order.

  

 Example 1:

 Input: arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
 Output: [2,2,2,1,4,3,3,9,6,7,19]
 */


func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    guard arr2.count != 0 else { return arr1 }
    
    // bond num and its counts in num1
    var dict = [Int: Int]()
    var result = [Int]()
    
    // store num and its counts info in dict
    for num in arr1 {
//        dict[num] = (dict[num] ?? 0) + 1
        dict[num,default: 0] += 1
    }
    // add relative array in arr1
    for num in arr2 {
        result += Array(repeating: num, count: dict[num] ?? 0)
        dict[num] = nil  // delete matched num in dict
    }
    // sort rest keys
    let keys = dict.keys.sorted()
    
    // add rest number with sorted order
    for restNum in keys {
        result += Array(repeating: restNum, count: dict[restNum] ?? 0)
    }
    return result
}

relativeSortArray([2,3,1,3,2,4,6,7,9,2,19], [2,1,4,3,9,6])
