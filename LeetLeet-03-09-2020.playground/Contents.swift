import UIKit

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
