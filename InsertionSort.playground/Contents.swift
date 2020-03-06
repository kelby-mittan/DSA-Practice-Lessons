import UIKit

// sorting algorithms: slower: O(n^2) faster: O(n log n)

// insertion sort
// runtime: O(n^2)
// space: O(1)
// slightly more performant than bubble sort
// given a partially sorted and small sized array could be a good choice sorting algorithm
// swift's sorting algortithm (hybrid algorithm) is n log n, uses insertion sort on small, partially sorted arrays

func insertionSort(_ arr: inout [Int]) {
    
    guard arr.count >= 2 else { return }
    
    for current in 1..<arr.count {
        for j in (1...current).reversed() {
            if arr[j] < arr[j - 1] {
                arr.swapAt(j, j - 1)
            } else {
                break
            }
        }
    }
}

var list = [4,5,9,-2]

insertionSort(&list)
