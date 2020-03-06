import UIKit


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

func reversed<T>(q: Queue<T>) -> Queue<T> {
    return q
}

//5 Determine if two Queues are equal
func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    return false
}
