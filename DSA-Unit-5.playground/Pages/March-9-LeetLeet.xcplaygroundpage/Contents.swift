//: [Previous](@previous)

import Foundation

func palindromeNum(_ num: Int) -> Bool {
    
    let numStr = String(num)
    
    let charArr = Array(numStr.reversed())
    let reversed = String(charArr)
    if reversed == numStr {
        return true
    } else {
        print(reversed)
        print(numStr)
        return false
    }
}


palindromeNum(121221)

func romanToInt(_ str: String) -> Int {
    var result = 0
    let dict: [Character : Int] =
        ["I" : 1, "V" : 5, "X" : 10, "L" : 50, "C" : 100, "D" : 500, "M" : 1000]

    var strArr = [Character]()

    for char in str {
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

romanToInt("XIX")


func findNumbers(_ nums: [Int]) -> Int {
    
    
    
    return 0
}
