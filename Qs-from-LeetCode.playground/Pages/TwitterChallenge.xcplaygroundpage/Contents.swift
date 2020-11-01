
import Foundation


/*
 Consider an array of n ticket prices, tickets. A number m is defined by the size of some subsequence, s, of tickets where each element covers an ubroken range of intergers. That is to say if you were to sort the elements in s, the absolute difference between j and j + 1 would either be 0 or 1. Determine the maximum length of a subsequence in a tickets array.
 */

func maxTix(tix: [Int]) -> Int {
    let sortedTix = tix.sorted()
    var max = 0
    var maxArr = [Int]()
    
    for (i,val) in sortedTix.enumerated() {
        if i > 0 {
            if val == sortedTix[i-1] || val == sortedTix[i-1]+1 {
                max += 1
            } else {
                max = 0
            }
        }
        maxArr.append(max)
    }
    print(maxArr)
    return (maxArr.max() ?? 0) + 1
}

maxTix(tix: [8,5,4,8,4,4,10,11,12,11,13,14,13])

/*
 area of a matrix
 */

func getArea(_ grid: [[Int]]) -> Int {
    
    var maxSize = 0
    for i in 0..<grid.count {
        for j in 0..<grid.count {
            var size = 0
            if grid[i][j] == 1 {
                
                while areaHelper(i, j, size, size, grid) {
                    size += 1
                }
                if size > maxSize {
                    maxSize = size
                }
            }
            
        }
    }
    if maxSize > 0 {
        maxSize -= 1
    }
    return maxSize
}

func areaHelper(_ x: Int, _ y: Int, _ width: Int, _ height: Int, _ grid: [[Int]]) -> Bool {
    
    
    for i in x..<width+x {
        for j in y..<height+y {
            if i >= grid.count || j >= grid.count {
                return false
            }
            if grid[i][j] == 0 {
                return false
            }
        }
    }
    return true
}

print(getArea([[1,1,1,],[1,1,0],[1,1,1,]]))

func areaOfMatrix(_ grid: [[Int]]) -> Int {
    var rowDict: [Int:Int] = [:]
    var collumnDict: [Int:Int] = [:]
    
    for (i,arr) in grid.enumerated() {
        for (j,num) in arr.enumerated() {
            if num == 1 {
                
            }
        }
    }
    return 0
}

func divisible(s: String, t: String) -> Int {
  var count1 = 0
  var count2 = 0
  var newStr = ""
  var dict = [[Character: Int]()]
  var newArr = [String]()
  if s != t {
    for i in s {
      count1 += 1
      for (index, j) in t.enumerated() {
//        count2 += 1
//        newStr = newStr + "\(j)"
//        print("newStr: \(newStr)")
        if j == i {
//          print("i: \(i) j: \(j)")
//          newStr = newStr + "\(j)"
//          print("newStr: \(newStr)")
        }
    }
    }
//    if newArr[0] == newStr {
//      return newStr.count
//    }
    print("count1 : \(count1)")
    print("count2 : \(count2)")
    if count2 * 2 == count1 || count2 == count1 {
      return count2
    }
  } else {
    return t.count
  }
  return -1
}

func div(_ s: String, _ t: String) -> Int {
    
    let arrS = Array(s)
    let arrT = Array(t)
    var count = 0
    for (i, letter) in arrS.enumerated() {
        if arrT.first == letter {
            if arrT.count - i >= arrT.count {
                if arrS[i..<arrT.count] == arrT[0..<arrT.count] {
                    count += 1
                }
            }
        }
    }
    return count
}

var arr = Array("abc")

let newArr = arr[1...arr.count-1]

div("rbrbarbrba", "rbrb")

