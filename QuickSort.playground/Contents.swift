import UIKit

// Quick Sort implementation using Lomuto's Partitioning algorithm
// Quick Sort uses a pivot in our example we use the last element as the pivot
// Using this pivot we split the array to the left of the pivot and to the right of the pivot
// example 10,-9,0,-11,(pivot is 13),80
// Quick Sort uses the divide and conquer approach to solve the sorting algorithm , divide and conquer is splitting the problem in half on every iteration (or recursive call)
// runtime O(n log n)

func sortArray(_ nums: [Int]) -> [Int] {
    var varArr = nums
    quicksortLomuto(&varArr, low: 0, high: varArr.count - 1)
    return varArr
}

func lomutoPartition(_ arr: inout [Int], low: Int, high: Int) -> Int {
    
    let pivot = arr[high]
    var i = low
    
    // iterate through the array using j variable as our marker
    
    for j in low..<high {
        if arr[j] <= pivot {
            // swap and increment i
            arr.swapAt(i, j)
            i += 1
        }
    }
    arr.swapAt(i, high)
    return i
}

func quicksortLomuto(_ arr: inout [Int], low: Int, high: Int) {
    if low < high {
        
        // get a new pivot
        let pivot = lomutoPartition(&arr, low: low, high: high)
        
        // recursive calls
        // left array
        quicksortLomuto(&arr, low: low, high: pivot - 1)
        
        // right array
        quicksortLomuto(&arr, low: pivot + 1, high: high)
    }
}

var list = [80,10,-9,0,-11,13,90,-8,1,-90,93,77,4,24,55,43,99,182,432,30,1,4,5]

quicksortLomuto(&list, low: 0, high: list.count - 1)

print(list)


// bubblesort - worst algorithm

func bubblesort(_ arr: inout [Int]) {
    for _ in 0..<arr.count {
        for j in 1..<arr.count {
            if arr[j] < arr[j - 1] {
                arr.swapAt(j, j - 1)
            }
        }
    }
}
var bubbleList = [80,10,-9,0,-11,13,90,-8,1,-90,93,77,4,24,55,43,99,182,432,30,1,4,5]
bubblesort(&bubbleList)
