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
