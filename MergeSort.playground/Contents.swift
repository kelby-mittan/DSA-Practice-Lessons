import UIKit

// merge sort
// worst, best and average runtime is O(n log n)
// uses divide and conquer
// splits the array in two using the middle index
// uses recursion until a base case count is 1
// then merges individual arrays back together while sorting

func mergeSort<T: Comparable>(_ arr: [T]) -> [T] {
    
    // base case count is greater than 1
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    
    let leftArr = mergeSort(Array(arr[..<middleIndex]))
    
    let rightArr = mergeSort(Array(arr[middleIndex..<arr.count]))
    
    
    return merge(leftArr, rightArr)
}

func merge<T: Comparable>(_ leftArr: [T], _ rightArr: [T]) -> [T] {
    
    var leftIndex = 0
    var rightIndex = 0
    
    var resultsArr = [T]()
    
    while leftIndex < leftArr.count && rightIndex < rightArr.count {
        let leftElement = leftArr[leftIndex]
        let rightElement = rightArr[rightIndex]
        
        // compare
        
        if leftElement < rightElement {
            resultsArr.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            resultsArr.append(rightElement)
            rightIndex += 1
        } else {
            resultsArr.append(leftElement)
            leftIndex += 1
            resultsArr.append(rightElement)
            rightIndex += 1
        }
    }
    
    // out here append elements remaining in left , right arrays
    
    if leftIndex < leftArr.count {
        resultsArr.append(contentsOf: leftArr[leftIndex...])
    }
    
    if rightIndex < rightArr.count {
        resultsArr.append(contentsOf: rightArr[rightIndex...])
    }
    
    return resultsArr
}

var list = [80,10,-9,0,-11,13,90,-8,1,-90,93,77,4,24,55,43,99,182,432,30,1,4,5]

print(mergeSort(list))

