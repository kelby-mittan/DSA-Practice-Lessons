//: [Previous](@previous)

import Foundation

/*
 Big O(n²) Sorting Algorithms
 
 - Bubble Sort
    - Works by comparing adjacent values and moving the element with the higher value to the end of the collection.
    - The name comes from the fact that the highest value is said to "bubble up" to the end of the collection.
 
    - [1,25,13,42,19,-1008]
    - First we'll compare the elements in index 0 and index 1.
        - Is 1 less than 25? Yes, confirmed by both Kelby and Jaheed, so you know it's right. Because it is, no swap occurs.
    - Next we'll compare the elements in index 1 and index 2.
        - Is 25 less than 13? No. So we have to swap the element in index 1 and the element in index 2.
        - [1,13,25,42,19,-1008]
    - Next we'll compare the elements in index 2 and index 3.
        - Is 25 less than 42? Yes. No swap occurs.
    - Next we'll compare the elements in index 3 and index 4.
        - Is 42 less than 19? No. So we have to swap the element in index 3 with the element in index 4.
        - [1,13,25,19,42,-1008]
    - Finally, we'll compare the elements in index 4 and index 5.
        - Is 42 less than -1008? No. So we have to swap the element in index 4 with the element in index 5.
        - [1,13,25,19,-1008,42]
    
    - How do we know when to stop?
        - We stop once we have completely passed through the entire collection, and we have not swapped once. This indicates that the collection is already sorted.
​
 
 - Insertion Sort
    - You break the collection into two parts. You assume that one part is sorted, and the other part needs to be sorted.
 
    - [1 | 25,13,42,19,-1008,4]
    - We will initally assume that the sorted portion of our array is composed of the first element. Everything else makes up the unsorted portion.
    - We will introduce the first element in our unsorted array into the our sorted array, which gives us [1,25|13,42,19,-1008,4]
        - Before we introduce another element from the unsorted portion of the array, we need to be certain that the newly introduced element is in the place where it belongs.
        - We will compare the new element to the element that preceeds it in the sorted portion of the array. In this case, we compare 1 and 25.
        - 1, 25 is sorted, so no shifting occurs.
    - Next we'll introduce a new element from the unsorted portion of the array, into the sorted portion of the array. [1,25,13 | 42,19,-1008,4]
        - Before we introduce another element, we need to be certain that all of the elements in the sorted portion of the array are in the place where they belong.
        - We compare the newly introduce element to the element that preceeds it. In this case 13 and 25.
        - Is 25 less than 13? I would have to say no. So we need to shift it to the left. Which simply means swapping the new element with the element that preceeds it. [1,13,25 | 42,19,-1008,4]
        - Is 1 less than 13? Uh-huh. Shifting is complete, we can proceed to introduce a new element into the sorted portion of our array.
    - Next we'll introduce 42.
        - We will check that the new element is in the place where it belongs.
        - Is 25 less than 42? Is it. Because it is, no shifting occurs. Everything is right where it belongs.
    - We can now introduce 19 into the sorted portion of our array. [1,13,25,42,19 | -1008, 4]
        - We will check that the new element is in the place where it belongs.
        - Is 42 less than 19? I would have to say no. We need to shift it over one position, which means swapping it with the preceeding element. [1,13,25,19,42]
        - Is 25 less than 19? That's a no for me. We need to continue shifting it over to the left. [1,13,19,25,42 | -1008,4]
        - Is 13 less than 19? You are damn right it is. We are done shifting.
    - We can now introduce -1008 into the sorted portion of our array. [1,13,19,25,42,-1008 | 4]
        - Is 42 less than -1008? Negativo. Shift. [1,13,19,25,-1008,42 | 4]
        - Is 25 less than -1008? Wrong. Shift [1,13,19,-1008,25,42 | 4]
        - Is 19 less than -1008? Who are you kidding? You schmuck. Shift. [1,13,-1008,19,25,42 | 4]
        - Is 13 less than -1008? Not where I am from. Shift. [1,-1008,13,19,25,42 | 4]
        - Is 1 less than -1008? Not round these parts. Shift. [-1008,1,13,19,25,42 | 4]
    - We can introduce the last element into the sorted portion of our array. [-1008,1,13,19,25,42,4]
        - Is 42 less than 4? I vote no. Shift. [-1008,1,13,19,25,4,42]
        - Is 25 less than 4? Negativo. Shift. [-1008,1,13,19,4,25,42]
        - Is 19 less than 4? Nope. Shift. [-1008,1,13,4,19,25,42]
        - Is 13 less than 4? Hell naw. Shift. [-1008,1,4,13,19,25,42]
        - Is 1 less than 4? Affirmative. No Shift.
    - We are done.
 
 - Selection Sort
    - "It selects stuff" - Jaheed Haynes 2020
    - We search for the nth smallest element in the collection, and then swap that element into the proper position.
    
    - [1,25,13,42,19,-1008,4]
    - We want to find the index of the smallest element in the collection. We'll begin be assuming that 0th index contains the smallest element.
    - We'll iterate through the array and attempt to find a smaller element.
        - Is 25 less than 1? No. We keep 0 as the index of the smallest element.
        - Is 13 less than 1? No. We keep 0 as the index of the smallest element.
        - Is 42 less than 1? Buzzer noise. We keep 0 as the index of the smallest element.
        - Is 19 less then 1? Eight ball says no. We keep 0 as the index of the smallest element.
        - Is -1008 less than 1? What is yes? So we allow our smallestIndex variable, which we definitely created above, to equal the index of -1008 (5).
        - Is 4 less than -1008? No. We keep 5 as the index of the smallest element.
    - Now that we have looked at all of the elements in the collection, we can swap the element at index 0 with the element at position smallestIndex.
        - [-1008,25,14,42,19,1,4]
 
    - How do we know when to stop?
        - Simple answer, we don't. We always keep going, never stopping, ever, for anything, at all.
        - Because of this, average, best, and worst runtime for this algorithm is O(n²).
        
 */

var testInput = [1,25,13,42,19,-1008,4]
var worstCaseInput = [42,25,19,13,4,1,-1008]

func bubbleSort<T: Comparable>(_ arr: inout [T]) -> [T] {
    guard arr.count >= 2 else { return arr }

    var swapHappened = false
    
    for i in (1..<arr.count).reversed() { // Represents index of array. 5...1
        swapHappened = false
        
        for j in 0..<i {
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
                swapHappened = true
            }
        }
        
        if !swapHappened {
            return arr
        }
    }
    
    return arr
}

// print(bubbleSort(&testInput))
// print(bubbleSort(&worstCaseInput))


//var testInput = [1,25,13,42,19,-1008,4]
//var worstCaseInput = [42,25,19,13,4,1,-1008]

func selectionSort<T: Comparable>(_ arr: inout [T]) -> [T] {
    guard arr.count >= 2 else { return arr }
    
    var smallestIndex = 0
    
    for i in 0..<arr.count {
        smallestIndex = i
        
        for j in i+1..<arr.count {
            if arr[j] < arr[smallestIndex] {
                smallestIndex = j
            }
        }
        
        if smallestIndex != i {
            arr.swapAt(smallestIndex, i)
        }
        
    }
    
    return arr
}

// print(selectionSort(&testInput))

//var testInput = [1,25,13,42,19,-1008,4]
//var worstCaseInput = [42,25,19,13,4,1,-1008]
func insertionSort<T: Comparable>(_ arr: inout [T]) -> [T] {
    guard arr.count >= 2 else { return arr }
    
    for i in 1..<arr.count {
        
        for j in (1...i).reversed() {
            if arr[j] < arr[j-1] {
                arr.swapAt(j, j-1)
            } else {
                break
            }
        }
        
    }
    
    return arr
}

// print(insertionSort(&testInput))
