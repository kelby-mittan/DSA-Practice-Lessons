//: [Previous](@previous)

import Foundation

// bubble sort
// sorting algorithm
// runtime: O(n^2) - quadratic
// space complexity: O(1) - constant - sorts in place
// sorts in place inout func

func bubbleSort(_ arr: inout [Int]) {
    
    for _ in 0..<arr.count { // O(n)
        for j in 1..<arr.count { //O(n)
            if arr[j] < arr[j - 1] {
                // swap
                // implement swap without using built in swap
                let temp = arr[j] // saved the value at arr[j] before overwriting
                arr[j] = arr[j - 1]
                arr[j - 1] = temp
            }
        }
    }
}

var list = [10,2,-8,4]
// 2,10,-8,4
// 2,-8,10,4
bubbleSort(&list)
