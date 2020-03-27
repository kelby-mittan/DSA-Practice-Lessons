//: [Previous](@previous)

import Foundation

// PALINDROME
func palindrome(_ str: String) -> Bool {

    var puncless = str
    
    for char in puncless {
        if char.isPunctuation {
            puncless.removeAll(where: { $0 == char })
        }
    }
    puncless = puncless.replacingOccurrences(of: " ", with: "")
    
    let charArr = Array(puncless.reversed())
    let reversed = String(charArr).replacingOccurrences(of: " ", with: "").lowercased()
    if reversed.lowercased() == puncless.lowercased() {
        return true
    } else {
        print(reversed.lowercased())
        print(puncless.lowercased())
        return false
    }
    
}

palindrome("Madam I'm Adam")

// PANGRAM

func isPangram(_ str: String) -> Bool {
    
    var puncless = str
    for char in puncless {
        if char.isPunctuation {
            puncless.removeAll(where: { $0 == char })
        }
    }
    puncless = puncless.replacingOccurrences(of: " ", with: "")
    let set = Set(puncless.lowercased())
    if set.count == 26 {
        return true
    } else {
        print(puncless.lowercased())
        return false
    }
    
}

isPangram("The quick brown fox jumps over the lazy dog")


// REVERSE W/O using .reverse

func getReverse(_ str: String) -> String {
    var reversed = str
    var reverseArray = [Character]()
    while reversed.count != 0 {
        reverseArray.append(reversed.last ?? " ")
        reversed.removeLast()
    }
    let rev = String(reverseArray)
    return rev
}

getReverse("Hello world!")


// DiagonalSum

func diagonalSum(_ matrix: [[Int]]) -> Int {
    
    guard let arr1 = matrix.first else { return 0 }
    let arr2 = matrix[1]
    guard let arr3 = matrix.last else { return 0 }
    
    var sum = 0
    
    sum = arr1.first! + arr1.last! + (arr2[1] * 2) + arr3.first! + arr3.last!
    
    return sum
}

diagonalSum([[1,2,9],[8,2,3],[4,5,6]])

// First Five Even Sum

func getFirstFiveEvenSum(_ arr: [Int]) -> Int {
    var evenArr = [Int]()
    for num in arr {
        if num % 2 == 0 && evenArr.count < 5 {
            evenArr.append(num)
        }
    }
    var sum = 0
    if evenArr.count == 5 {
        for num in evenArr {
            sum += num
        }
    }
    return sum
}
getFirstFiveEvenSum([3,7,-3,2,9,4,8,10,3,9,4,9,8,6,-2])

// Recursive Factorial

func getFactorialRecursively(_ int: Int) -> Int {
    if int == 0 {
        return 1
    }
    return int * (getFactorialRecursively(int - 1))
}

getFactorialRecursively(4)

// Second Largest

func secondLargest(_ arr: [Int]) -> Int {
    
    var largeNum = Int.min
    var secondLargest = Int.min
    
    for num in arr {
        if num > largeNum {
            secondLargest = largeNum
            largeNum = num
        }
    }
    
    return secondLargest
}
secondLargest([1, 4, -2, -9, 2, 5, -1, 10, 4])


// Remove Duplicates

func removeDuplicates(_ arr: [Int]) -> [Int] {
    var uniqueArr = [Int]()
    
    for num in arr {
        if !uniqueArr.contains(num) {
            uniqueArr.append(num)
        }
    }
    return uniqueArr
}

removeDuplicates([1, 2, 9, 1, 8, 2, 4, 8, 5, 6, 9, 2])


// cornerless sum of matrix

func cornerlessSum(_ matrix: [[Int]]) -> Int {
    
    var mutMatrix2 = matrix
    mutMatrix2.removeFirst()
    mutMatrix2.removeLast()
    
    for var arr in matrix {
        if arr == matrix.first || arr == matrix.last {
            arr.removeFirst()
            arr.removeLast()
            mutMatrix2.append(arr)
        }
    }
    print(mutMatrix2)
    var sum = 0
    
    for arr in mutMatrix2 {
        sum += arr.reduce(0, +)
    }
    return sum
}

cornerlessSum([[1,3,9,2],[3,2,0,3],[2,8,1,4]])

//Use filter to create an array called numbersEndingIn5 that contains all the
//numbers ending in 5 and then print it.
//

func numbersEndingIn5(_ arr: [Int]) -> [Int] {
    
    var mutArr = arr
    
    mutArr = mutArr.filter { $0 % 5 == 0 && $0 % 10 != 0 }
    print(mutArr)
    return mutArr
}
numbersEndingIn5([1, 3, 5, 85, 15, 11, 90, 5, 56, 45, 12, 75])


//Find the sum of the squares of all the odd numbers from numbers and then print it.
//
//var numbers = [1, 2, 3, 4, 5, 6]

//a. Write code that removes all the odd numbers from the array.
//b. Write code that squares all the numbers in the array.
//c. Write code that finds the sum of the array.
//d. Now use map, filter and reduce to solve this problem.

func getOddsSquaredSum(_ arr: [Int]) -> Int {
    var mutArr = arr
    mutArr = mutArr.filter { $0 % 2 == 1 }
    print(mutArr)
    mutArr = mutArr.map { $0 * $0 }
    print(mutArr)
    return mutArr.reduce(0, +)
}

getOddsSquaredSum([1, 2, 3, 4, 5, 6])


// hey how are you you doing how how

func removeVowels(_ str: String) -> String {
    
    var vowelLessArr = [Character]()
    let vowels: [Character] = ["a","e","i","o","u","y"]
//    var strArr = Array(str)
    for char in str {
        if !vowels.contains(char) {
            vowelLessArr.append(char)
        }
    }
    
    
    return String(vowelLessArr)
}

removeVowels("hey how are you you doing how how")

func firstRepeatingWord(_ str: String) -> String {
    
    var puncless = str
    var doubleWord = ""
    for char in puncless {
        if char.isPunctuation {
            puncless.removeAll { $0 == char }
        }
    }
    puncless = puncless.lowercased()
    let punclessArr = puncless.components(separatedBy: " ")
    
    var wordSeen = [String]()
    var wordSeenTwice = [String]()

    for word in punclessArr {
        if wordSeen.contains(word) {
            wordSeenTwice.append(word)

        }
        wordSeen.append(word)
    }
    
    for word in punclessArr {
        if wordSeenTwice.contains(word) {
            doubleWord = word
            break
        }
    }
    
    print(wordSeenTwice)
    
    
    return doubleWord
}

firstRepeatingWord("hey!! how? are you you doing how how")

func shiftZeros(_ arr: [Int]) -> ([Int], Int) {
    
    var count = 0
    var shiftZeroArr = [Int]()
    
    
    for num in arr {
        
        if num != 0 {
            count += 1
            shiftZeroArr.insert(num, at: 0)
        } else {
                shiftZeroArr.insert(num, at: shiftZeroArr.count)

        }
    }
    
    return (shiftZeroArr, count)
}

shiftZeros([3,0,2,0,0,1,0,4])

print(shiftZeros([3,0,2,0,0,1,0,4]))
