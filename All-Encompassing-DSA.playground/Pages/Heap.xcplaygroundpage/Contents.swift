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
 10(3)  16(4)    30(5)   36(6)
 */


struct Heap {
    // data structure for our Heap nodes is an array
    private var nodes = [2, 8, 21, 10, 16, 30, 36]
    
    private var orderingCriteria: (Int,Int) -> Bool
    
    public init(_ sort: @escaping (Int,Int) -> Bool) {
        self.orderingCriteria = sort
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

      shiftDown(from: 0, to: nodes.count)

      return value
    }
    
    private mutating func shiftDown(from index: Int, to endIndex: Int) {
      let leftChildIndex = self.leftChildIndex(index)
      let rightChildIndex = self.rightChildIndex(index)

      var currentIndex = index

      if leftChildIndex < endIndex && nodes[leftChildIndex] < nodes[currentIndex] {
        currentIndex = leftChildIndex
      }

      if rightChildIndex < endIndex && nodes[rightChildIndex] < nodes[currentIndex] {
        currentIndex = rightChildIndex
      }

      if currentIndex == index { // no swapping needed
        return
      }

      nodes.swapAt(currentIndex, index)

      shiftDown(from: currentIndex, to: endIndex)
    }
    
}

/*
 2
 /    \
 8      21
 / \    /  \
 10  16  30   36
 */

var minHeap = Heap(<)

print(minHeap.parentIndex(5)) // 2

print(minHeap.leftChildIndex(2)) // 5

print(minHeap.parentIndex(6)) // 2

print(minHeap.parent(3) ?? -999) // 8

print(minHeap.leftChild(6) ?? -999) // nil

print(minHeap.rightChild(6) ?? -999) // nil

print(minHeap.peek() ?? -999) // 2

minHeap.insert(-6)

print(minHeap.peek() ?? -999)

// Preview
// +
// + is defines as (Int, Int) -> Int
// arr.reduce(0, +)
// Heap(>) max, descending
// Heap(<) min, ascending

// shift up

