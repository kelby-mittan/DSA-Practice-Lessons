
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
            var size = -1
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

print(getArea([[1,1,1,1],[1,1,1,0],[1,1,1,0]]))
