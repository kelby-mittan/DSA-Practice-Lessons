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
            let nWords = strArr[i..<i+n].joined(separator: " ")
            resultArr.append(nWords)
        }
    }
    
    for phrase in resultArr {
        resultDict[phrase, default: 0] += 1
    }
    
    return resultDict
}

print(nGram("the cow jumped over the moon the moon", n: 2))
