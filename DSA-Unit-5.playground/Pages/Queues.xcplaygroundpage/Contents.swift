//: [Previous](@previous)

import Foundation

struct Queue<T> {
    
    private var elements = [T]()
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public var peek: T? {
        return elements.first
    }
    
    public mutating func enqueue(_ item: T) {
        elements.append(item)
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return elements.removeFirst()
    }
    
    public mutating func pop() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeLast() // O(1)
    }
}

var queue = Queue<String>()
queue.enqueue("Mel")
queue.enqueue("Kelby")
queue.enqueue("Oscar")

print("\(queue.peek ?? "") is at the front of the line")

queue.dequeue()

print("Fellows left: \(queue)")

queue.enqueue("Eric")
print("there are \(queue.count) fellows on line")

var queueCopy = queue

while let value = queueCopy.dequeue() {
    print("fellow: \(value)")
}

print("there are \(queueCopy.count) fellows left in queueCopy")



func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    var qCopy = q
    guard var smallest = qCopy.peek else { return nil }
    //    var smallest = qCopy.dequeue()
    while let value = qCopy.dequeue() {
        if value <= smallest {
            smallest = value
        }
    }
    return smallest
    
}

var queueInt = Queue<Int>()

queueInt.enqueue(2)
queueInt.enqueue(5)
queueInt.enqueue(10)
queueInt.enqueue(20)

//smallestElement(in: queueInt)


//2. Find the sum of a queue of Ints
func sum(of q: Queue<Int>) -> Int {
    
    var qCopy = q
//    guard var sum = qCopy.peek else { return 0 }
    var sum = 0
    
    while let value = qCopy.dequeue() {
        sum += value
    }
    return sum
}

sum(of: queueInt)
//3. Find out whether or not a queue is in sorted order from smallest to biggest
/*
 True example:   (Back) 9 - 6 - 2 - 1 (Front)
 False example   (Back) 4 - 19 - 1 - 20 (Front)
 False example   (Back) 4 - 19 - 134 - 200 (Front)
 */

func isSorted<T: Comparable>(q: Queue<T>) -> Bool {
    
    var qCopy = q
    var isOrdered = false
    guard var order = qCopy.peek else { return false }
    while let value = qCopy.dequeue() {
        if order <= value {
            isOrdered = true
            order = value
            print(value)
            print(order)
        } else {
            print("\(value) else")
        
            print("\(order) else")
            order = value
            isOrdered = false
            break
        }
    }
    return isOrdered
}

isSorted(q: queueInt)

//4. Given a Queue as input, return a reversed queue. (Hint: A stack can be helpful here)
/*
 Sample Input:   (Back) 9 - 16 - 2 - 31 (Front)
 Sample Output:  (Back) 31 - 2 - 16 - 9 (Front)
 */

//struct Stack<T: Equatable>: Equatable {
//    private var elements = [T]()
//
//    static func ==(lhs: Stack, rhs: Stack) -> Bool {
//        return lhs.elements == rhs.elements
//    }
//
//    public var peek: T? {
//        return elements.last
//    }
//
//    public var count: Int {
//        return elements.count
//    }
//
//    public var isEmpty: Bool {
//        return elements.isEmpty
//    }
//
//    // add to the top of the stack (end)
//    public mutating func push(_ value: T) {
//        elements.append(value) // O(1)
//
//    }
//
//    // remove from the top of the stack
//    public mutating func pop() -> T? {
//        guard !elements.isEmpty else {
//            return nil
//        }
//        return elements.removeLast() // O(1)
//    }
//
//}

func reversed<T: Equatable>(q: Queue<T>) -> Queue<T> {
    var qCopy = q
    var qResult = Queue<T>()
//    var qStack = Stack<T>()
    while !qCopy.isEmpty {
        guard let popped = qCopy.pop() else {
            return qResult
        }
        qResult.enqueue(popped)
    }
    print(qResult)
    return qResult
}

var queueB4 = Queue<Int>()

queueB4.enqueue(9)
queueB4.enqueue(16)
queueB4.enqueue(2)
queueB4.enqueue(31)
reversed(q: queueB4)

//5 Determine if two Queues are equal
func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    var qOneV = qOne
    var qTwoV = qTwo
    guard qOne.count == qTwo.count else { return false }
    var isEqual = Bool()
    while !qOneV.isEmpty && !qTwoV.isEmpty {
        guard let qOneDQ = qOneV.dequeue() else { return false }
        guard let qTwoDQ = qTwoV.dequeue() else { return false }
        if qOneDQ == qTwoDQ {
            isEqual = true
        } else {
            isEqual = false
            break
        }
    }
    return isEqual
}

var queue1 = Queue<Int>()
queue1.enqueue(9)
queue1.enqueue(16)
queue1.enqueue(2)
queue1.enqueue(31)

var queue2 = Queue<Int>()
queue2.enqueue(9)
queue2.enqueue(16)
queue2.enqueue(2)
queue2.enqueue(31)

areEqual(qOne: queue1, qTwo: queue2)
