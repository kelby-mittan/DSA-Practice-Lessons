//: [Previous](@previous)

import Foundation

/*
 Given an array of integers, calculate the ratios of its elements that are positive, negative, and zero. Print the decimal value of each fraction on a new line with  places after the decimal.
 
 Print
 Print the ratios of positive, negative and zero values in the array. Each value should be printed on a separate line with  digits after the decimal. The function should not return a value.
 */

func plusMinus(arr: [Int]) -> Void {
    
    var negCount: Double = 0
    var posCount: Double = 0
    var zeroCount: Double = 0
    for num in arr {
        if num < 0 {
            negCount += 1
        } else if num > 0 {
            posCount += 1
        } else {
            zeroCount += 1
        }
    }
    
    print(String(format: "%.6f", posCount / Double(arr.count)))
    print(String(format: "%.6f", negCount / Double(arr.count)))
    print(String(format: "%.6f", zeroCount / Double(arr.count)))
}

plusMinus(arr: [1,1,0,-1,-1])

/*
 Given a square matrix, calculate the absolute difference between the sums of its diagonals.
 
 For example, the square matrix  is shown below:
 */

func diagonalDifference(arr: [[Int]]) -> Int {
    let arrLength =  arr.count-1
    var firstDiagonal = 0
    var secondDiagonal = 0
    
    for index in 0...arrLength {
        firstDiagonal   +=  arr[index][index]
        secondDiagonal +=  arr[index][arrLength-index]
    }
    
    let difference = abs(firstDiagonal - secondDiagonal)
    return difference
}

/*
 Staircase detail

 This is a staircase of size n:

    #
   ##
  ###
 ####
 Its base and height are both equal to . It is drawn using # symbols and spaces. The last line is not preceded by any spaces.

 Write a program that prints a staircase of size .

 Function Description

 Complete the staircase function in the editor below.

 staircase has the following parameter(s):

 int n: an integer
 Print

 Print a staircase as described above.
 */

func staircase(n: Int) -> Void {

    for i in 1...n {
        var spaceArr = [String]()
        for _ in 0..<n-i {
            spaceArr.append(" ")
        }
        for _ in 0..<i {
            spaceArr.append("#")
        }
        
        print(spaceArr.joined())
    }

}

staircase(n: 4)

/*
 N-gram
 input: "the cow jumped over the moon", n = 2
 output: ["the cow","cow jumped","jumped over","over the","the moon"
 */

func nGram(_ str: String, n: Int) -> [String:Int] {
    let strArr = str.components(separatedBy: " ")
    var resultArr = [String]()
    var resultDict = [String:Int]()
    
    for i in 0..<strArr.count {
        if i + n <= strArr.count {
            let numWords = strArr[i..<i+n].joined(separator: " ")
            resultArr.append(numWords)
        }
    }
    
    for phrase in resultArr {
        resultDict[phrase, default: 0] += 1
    }
    
    return resultDict
}

print(nGram("the cow jumped over the moon the moon", n: 2))

/*
 Alice and Bob each created one problem for HackerRank. A reviewer rates the two challenges, awarding points on a scale from 1 to 100 for three categories: problem clarity, originality, and difficulty.

 The rating for Alice's challenge is the triplet a = (a[0], a[1], a[2]), and the rating for Bob's challenge is the triplet b = (b[0], b[1], b[2]).

 The task is to find their comparison points by comparing a[0] with b[0], a[1] with b[1], and a[2] with b[2].

 If a[i] > b[i], then Alice is awarded 1 point.
 If a[i] < b[i], then Bob is awarded 1 point.
 If a[i] = b[i], then neither person receives a point.
 Comparison points is the total points a person earned.

 Given a and b, determine their respective comparison points.

 Example

 a = [1, 2, 3]
 b = [3, 2, 1]
 For elements *0*, Bob is awarded a point because a[0] .
 For the equal elements a[1] and b[1], no points are earned.
 Finally, for elements 2, a[2] > b[2] so Alice receives a point.
 The return array is [1, 1] with Alice's score first and Bob's second.

 Function Description

 Complete the function compareTriplets in the editor below.

 compareTriplets has the following parameter(s):

 int a[3]: Alice's challenge rating
 int b[3]: Bob's challenge rating
 Return

 int[2]: Alice's score is in the first position, and Bob's score is in the second.
 Input Format

 The first line contains 3 space-separated integers, a[0], a[1], and a[2], the respective values in triplet a.
 The second line contains 3 space-separated integers, b[0], b[1], and b[2], the respective values in triplet b.

 Constraints

 1 ≤ a[i] ≤ 100
 1 ≤ b[i] ≤ 100
 
 Sample Input 0
 5 6 7
 3 6 10
 
 Sample Output 0
 1 1
 */

func compareTriplets(a: [Int], b: [Int]) -> [Int] {

    var aCount = 0
    var bCount = 0
    
    for i in 0..<a.count {
        if a[i] == b[i] {
            continue
        } else if a[i] < b[i] {
            aCount += 1
        } else {
            bCount += 1
        }
    }
    
    return [bCount,aCount]
}

/*
 Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Then print the respective minimum and maximum values as a single line of two space-separated long integers.

 Example

 The minimum sum is  and the maximum sum is . The function prints

 16 24
 Function Description

 Complete the miniMaxSum function in the editor below.

 miniMaxSum has the following parameter(s):

 arr: an array of  integers
 Print

 Print two space-separated integers on one line: the minimum sum and the maximum sum of  of  elements.

 Input Format

 A single line of five space-separated integers.

 Constraints


 Output Format

 Print two space-separated long integers denoting the respective minimum and maximum values that can be calculated by summing exactly four of the five integers. (The output can be greater than a 32 bit integer.)

 Sample Input

 1 2 3 4 5
 Sample Output

 10 14
 */

func miniMaxSum(arr: [Int]) -> Void {

    var minSum = 0
    var maxSum = 0
    let sortArr = arr.sorted()
    for i in 0..<sortArr.count-1 {
        minSum += sortArr[i]
    }
    
    for i in 1..<sortArr.count {
        maxSum += sortArr[i]
    }
    
    print("\(minSum) \(maxSum)")
}

/*
 You are in charge of the cake for a child's birthday. You have decided the cake will have one candle for each year of their total age. They will only be able to blow out the tallest of the candles. Count how many candles are tallest.

 Example:
 The maximum height candles are  units high. There are  of them, so return .

 Function Description

 Complete the function birthdayCakeCandles in the editor below.

 birthdayCakeCandles has the following parameter(s):

 int candles[n]: the candle heights
 Returns

 int: the number of candles that are tallest
 Input Format

 The first line contains a single integer, , the size of .
 The second line contains  space-separated integers, where each integer  describes the height of .

 Constraints

 Sample Input 0
 4
 3 2 1 3
 
 Sample Output 0
 2
 */

func birthdayCakeCandles(candles: [Int]) -> Int {
    
    var maxHeight = 0
    var highArr: [Int] = []
    
    for num in candles {
        if num > maxHeight {
            maxHeight = num
        }
    }
    for num in candles {
        if num == maxHeight {
            highArr.append(num)
        }
    }
    return highArr.count
}

/*
 Given a time in -hour AM/PM format, convert it to military (24-hour) time.

 Note: - 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock.
 - 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock.

 Example


 Return '12:01:00'.


 Return '00:01:00'.

 Function Description

 Complete the timeConversion function in the editor below. It should return a new string representing the input time in 24 hour format.

 timeConversion has the following parameter(s):

 string s: a time in  hour format
 Returns

 string: the time in  hour format
 Input Format

 A single string  that represents a time in -hour clock format (i.e.:  or ).

 Constraints

 All input times are valid
 Sample Input 0

 07:05:45PM
 Sample Output 0

 19:05:45
 */

func timeConversion(s: String) -> String {
    var separatedArr = s.components(separatedBy: ":")
    var firstDigits = Int(separatedArr.first ?? "0") ?? 0
    if separatedArr[2].contains("P") && firstDigits < 12 {
        firstDigits += 12
    }
    if firstDigits < 12 {
        separatedArr[0] = "0" + String(firstDigits)
    } else if firstDigits > 12 {
        separatedArr[0] = String(firstDigits)
    } else if firstDigits == 12 && separatedArr[2].contains("A") {
        separatedArr[0] = "00"
    } else {
        separatedArr[0] = "12"
    }
    separatedArr[2].removeLast()
    separatedArr[2].removeLast()
    return separatedArr.joined(separator: ":")
}

timeConversion(s: "12:45:54AM")

/*
 HackerLand University has the following grading policy:

 Every student receives a  in the inclusive range from  to .
 Any  less than  is a failing grade.
 Sam is a professor at the university and likes to round each student's  according to these rules:

 If the difference between the  and the next multiple of  is less than , round  up to the next multiple of .
 If the value of  is less than , no rounding occurs as the result will still be a failing grade.
 Examples

  round to  (85 - 84 is less than 3)
  do not round (result is less than 40)
  do not round (60 - 57 is 3 or higher)
 Given the initial value of  for each of Sam's  students, write code to automate the rounding process.

 Function Description

 Complete the function gradingStudents in the editor below.

 gradingStudents has the following parameter(s):

 int grades[n]: the grades before rounding
 Returns

 int[n]: the grades after rounding as appropriate
 Input Format

 The first line contains a single integer, , the number of students.
 Each line  of the  subsequent lines contains a single integer, .

 Constraints

 Sample Input 0

 4
 73
 67
 38
 33
 Sample Output 0

 75
 67
 40
 33
 Explanation 0

 */

func gradingStudents(grades: [Int]) -> [Int] {

    var roundedGrades: [Int] = []
    
    for grade in grades {
        if grade < 38 {
            roundedGrades.append(grade)
            continue
        }
        if (grade+1) % 5 == 0 {
            roundedGrades.append(grade+1)
        } else if (grade+2) % 5 == 0 {
            roundedGrades.append(grade+2)
        } else {
            roundedGrades.append(grade)
        }
    }
    
    return roundedGrades
}

gradingStudents(grades: [73,67,38,33])

/*
 APPLES QUESTION.... Long explanation
 */

func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    var dumpApple: [Int] = []
    var dumpOrange: [Int] = []
    
    for val in apples {
        dumpApple.append(val+a)
    }
    
    for val in oranges {
        dumpOrange.append(val+b)
    }
    
    let countApple = dumpApple.filter {$0 >= s && $0 <= t}
    let countOrange = dumpOrange.filter {$0 >= s && $0 <= t}
    
    print(countApple.count)
    print(countOrange.count)
}
