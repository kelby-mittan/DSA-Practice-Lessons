//: [Previous](@previous)

import Foundation

var buckets = Array(repeating: 0, count: 4)

let alexIndex = abs("Alex".hashValue % buckets.count)
let brendonIndex = abs("Brendon".hashValue % buckets.count)
let ahadIndex = abs("Ahad".hashValue % buckets.count)
let tanyaIndex = abs("Tanya".hashValue % buckets.count)

print("goes in \(alexIndex) index")
print("goes in \(brendonIndex) index")
print("goes in \(ahadIndex) index")
print("goes in \(tanyaIndex) index")

var dict = [String:Int]()

dict["Sweden"] = 1


// Implement Hash Table

struct HashTable <Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    
    private typealias Bucket = [Element]
    
    private var buckets: [Bucket]
    
    private (set) var count = 0
    
    init(capacity: Int) {
        buckets = Array<Bucket>(repeating: [], count: capacity)
    }
    
    // method to return index where key will be stored
    func index(forKey key: Key) -> Int {
        return abs(key.hashValue % buckets.count)
    }
    
    // method to search for value at given key
    func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }
    
    // method to update a value for a given key
    mutating func update(value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index][i].value = value
                return oldValue
            }
        }
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    // method to remove value at given key
    mutating func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for (i,element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        return nil
    }
    
    subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        } set {
            if let value = newValue {
                update(value: value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
}

var hashTable = HashTable<String, Int>(capacity: 4)

hashTable.update(value: 21, forKey: "Tiffany")
hashTable.update(value: 25, forKey: "Eric")

hashTable.count

print(hashTable)

let companiesToApply = ["Elevate","Wikipedia","Hulu","SoundCloud"]//[“Elevate”, “Wikipedia”, “Hulu”, “SoundCloud”]
// adding companies from the “companiesToApply” array to
// the jobSeachDict where the value is “Need to Apply”


