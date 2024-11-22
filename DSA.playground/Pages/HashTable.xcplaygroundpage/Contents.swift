import Foundation

// Define a key-value pair structure
struct HashNode<Key: Hashable, Value> {
    let key: Key
    var value: Value
}

// Define the Hash Table
class HashTable<Key: Hashable, Value> {
    // Array of buckets, each bucket is an array of HashNode
    private var buckets: [[HashNode<Key, Value>]]
    private(set) var capacity: Int // Number of buckets
    private(set) var count = 0 // Number of elements
    private let loadFactorThreshold: Double = 0.75 // Threshold to resize

    init(capacity: Int) {
        self.capacity = max(1, capacity) // Ensure capacity is at least 1
        self.buckets = Array(repeating: [], count: capacity)
    }
    
    // Hash function to compute index
    private func hash(_ key: Key) -> Int {
        return abs(key.hashValue) % capacity
    }
    
    // Insert or update a value for a given key
    func insert(key: Key, value: Value) {
        let index = hash(key)
        for (i, node) in buckets[index].enumerated() {
            if node.key == key {
                // Key exists, update value
                buckets[index][i].value = value
                return
            }
        }
        // Key does not exist, insert a new node
        buckets[index].append(HashNode(key: key, value: value))
        count += 1
        
        // Check if resizing is needed
        if loadFactor() > loadFactorThreshold {
            resize()
        }
    }
    
    // Retrieve a value for a given key
    func get(key: Key) -> Value? {
        let index = hash(key)
        for node in buckets[index] {
            if node.key == key {
                return node.value
            }
        }
        return nil // Key not found
    }
    
    // Remove a value for a given key
    func remove(key: Key) -> Bool {
        let index = hash(key)
        for (i, node) in buckets[index].enumerated() {
            if node.key == key {
                // Key found, remove node
                buckets[index].remove(at: i)
                count -= 1
                return true
            }
        }
        return false // Key not found
    }
    
    // Calculate the current load factor
    private func loadFactor() -> Double {
        return Double(count) / Double(capacity)
    }
    
    // Resize the hash table when load factor exceeds the threshold
    private func resize() {
        let oldBuckets = buckets
        capacity *= 2 // Double the capacity
        buckets = Array(repeating: [], count: capacity)
        count = 0 // Reset count, we'll re-insert everything
        
        // Rehash all elements
        for bucket in oldBuckets {
            for node in bucket {
                insert(key: node.key, value: node.value)
            }
        }
    }
}

import XCTest

class HashTableTests: XCTestCase {
    func test_HashTable() {
        let hashTable = HashTable<String, String>(capacity: 2)

        // Insert elements
        hashTable.insert(key: "name", value: "Alice")
        hashTable.insert(key: "age", value: "25")
        hashTable.insert(key: "city", value: "New York") // Triggers resizing

        // Retrieve elements
        XCTAssertEqual(hashTable.get(key: "name"), "Alice")
        XCTAssertEqual(hashTable.get(key: "age"), "25")
        XCTAssertEqual(hashTable.get(key: "city"), "New York")

        // Check capacity after resizing
        XCTAssertEqual(hashTable.capacity, 4)
    }
}

HashTableTests.defaultTestSuite.run()
