//: [Previous](@previous)

import Foundation

/*
 Heap
 2         level 0
 /    \
 8      21.    level 1
 / \    /  \
 10  16  30   36 level 2
 func getMin() -> {} => O(1)
 
 
 Binary Tree
 10
 / \
 32  18
 \
 2
 func getMax() {} => O(n)
 
 
 Binary Search Tree
 16
 / \
 8  20
 /
 4
 func getMax() {} => O(log n)
 
 
 inorder: 10, 8, 16, 2, 30, 21, 36
 level order: 2, 8, 21, 10, 16, 30, 36
 */

// Heap - is a tree data structure that is mainly used to create a min Heap or max Heap
//        a Heap is traditionally implemented using an array as opposed to a Binary Tree
//        that uses pointers to left and right children.
//        The (Heap Property) is satisfied when for example in a min Heap the root is smaller than
//        any of its children, in a max Heap the root is greater than any child nodes


// Objective: create a Heap and be able to retrieve any parent or left and right child nodes


/*
           2 (0)
          /    \
        8(1)         21 (2)
       /    \          /  \
     -6(3)  16(4)    30(5)   36(6)
     /
 10(7)
 */


struct Heap {
    // data structure for our Heap nodes is an array
    private var nodes: [Int] = [] //[2, 8, 21, 10, 16, 30, 36]
    
    private var orderingCriteria: (Int,Int) -> Bool
    
    public init(_ sort: @escaping (Int,Int) -> Bool) {
        self.orderingCriteria = sort // this is either greater than or less than
    }
    
    // get the parent index
    public func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    // get the left child index
    public func leftChildIndex(_ index: Int) -> Int {
        return 2 * index + 1
    }
    
    // get the right child index
    public func rightChildIndex(_ index: Int) -> Int {
        return 2 * index + 2
    }
    
    public func parent(_ index: Int) -> Int? {
        guard parentIndex(index) > 0 else { return nil }
        return nodes[parentIndex(index)] // return the parent index
    }
    
    public func leftChild(_ index: Int) -> Int? {
        guard leftChildIndex(index) < nodes.count else { return nil }
        return nodes[leftChildIndex(index)]
    }
    
    public func rightChild(_ index: Int) -> Int? {
        guard rightChildIndex(index) < nodes.count else { return nil }
        return nodes[rightChildIndex(index)]
    }
    
    // write a function called peek() to return the top value in the Heap
    func peek() -> Int? { // runtime => O(1)
        // guard !nodes.isEmpty else { return nil }
        // return nodes[0]
        return nodes.first // returns an optional
    }
    
    // insert
    public mutating func insert(_ item: Int) {
        nodes.append(item)
        shiftUp(nodes.count - 1)
    }
    
    // shift up
    public mutating func shiftUp(_ index: Int) {
        let child = nodes[index]
        var childIndex = index
        var parentIndex = self.parentIndex(index)
        
        while childIndex > 0 && orderingCriteria(child, nodes[parentIndex]) {
            // keep swapping
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(childIndex)
        }
        
        nodes[childIndex] = child
    }
    
    public mutating func removeTop() -> Int? {
      guard !nodes.isEmpty else { return nil }

      if nodes.count == 1 {
        return nodes.removeLast()
      }

      let value = nodes[0]

      nodes[0] = nodes.removeLast()
      print(nodes[0])
      shiftDown(from: 0, to: nodes.count)

      return value
    }
    
    private mutating func shiftDown(from index: Int, to endIndex: Int) {
      let leftChildIndex = self.leftChildIndex(index)
      let rightChildIndex = self.rightChildIndex(index)

      var currentIndex = index

      if leftChildIndex < endIndex && orderingCriteria(nodes[rightChildIndex],nodes[currentIndex]) {
        currentIndex = leftChildIndex
      }

        if rightChildIndex < endIndex && orderingCriteria(nodes[rightChildIndex],nodes[currentIndex]) {//nodes[rightChildIndex] < nodes[currentIndex] {
        currentIndex = rightChildIndex
      }

      if currentIndex == index { // no swapping needed
        return
      }

      nodes.swapAt(currentIndex, index)

      shiftDown(from: currentIndex, to: endIndex)
    }
    
}

class KthLargest {
  // decalare an instance of the Heap data structure here

    let k: Int
    var nums: [Int] = []
        
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for number in nums {
            self.add(number)
        }
    }
    
    func add(_ val: Int) -> Int {
        // insert the value into the sorted array by binary search method
        self.putInSortedPlace(val: val)
        
        // always keep the sorted array in k length
        if self.k < self.nums.count { self.nums.remove(at: 0) }
        
        return self.nums[0]
    }
    
    func putInSortedPlace(val: Int) {
        
        var left = 0
        var right = self.nums.count - 1
        var idx = 0
        
        while left <= right {
            let mid = (left + right)/2
            
            if self.nums[mid] == val {
                idx = mid
                break
            } else if self.nums[mid] < val {
                left = mid + 1
                idx = left
            } else {
                right = mid - 1
            }
        }
        
        self.nums.insert(val, at: idx)
    }
}

class KthLargestHeap {
    let k: Int
    var heap = Heap(>)
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            heap.insert(num)
            print(heap)
        }
    }
    
    func add(_ val: Int) {
        
    }
    
    func getVal() -> Int? {
        for _ in 0..<k-1 {
            print(heap.peek())
            heap.removeTop()
            print(heap)
        }
        return heap.peek()
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */

/*
         2
       /    \
      21     10
     / \    /  \
    30  36  16  15
 */

var minHeap = Heap(>)

minHeap.insert(2)
minHeap.insert(21)
minHeap.insert(16)
minHeap.insert(30)
minHeap.insert(36)
minHeap.insert(10)

print(KthLargestHeap(3, [2,35,1,17,29]).getVal())

print(minHeap.parentIndex(5)) // 2

print(minHeap.leftChildIndex(2)) // 5

print(minHeap.parentIndex(6)) // 2

print(minHeap.parent(3) ?? -999) // 8

print(minHeap.leftChild(6) ?? -999) // nil

print(minHeap.rightChild(6) ?? -999) // nil

print(minHeap.peek() ?? -999) // 2

//minHeap.insert(-6)

print(minHeap.peek() ?? -999)




print(minHeap)

// Preview
// +
// + is defines as (Int, Int) -> Int
// arr.reduce(0, +)
// Heap(>) max, descending
// Heap(<) min, ascending

// shift up

/*
            -6
            / \
           2   21
          /      \
 */
