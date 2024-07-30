
class LRUCache {
    
    /// Class to define nodes in a doubly linked list.
    class Node {
        var prev: Node?
        var next: Node?
        var key: Int
        var val: Int
        
        init(_ key: Int, _ val: Int) {
            self.key = key
            self.val = val
        }
        
    }
    
    var head = Node(-1,-1)
    var tail = Node(-2,-2)
    var capacity: Int
    var dict: [Int: Node] = [:]

    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    /// Adds `node` to the tail of the linked list
    func add(_ node: Node) {
        let previousEnd = tail.prev
        previousEnd?.next = node
        node.prev = previousEnd
        node.next = tail
        tail.prev = node
    }
    
    /// Removes node from the linked list
    func remove(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            remove(node)
            add(node)
            return node.val
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let oldNode = dict[key] {
            remove(oldNode)
        }
        let newNode = Node(key, value)
        dict[key] = newNode
        add(newNode)
        
        if dict.count > capacity {
            let nodeToDelete = head.next!
            remove(nodeToDelete)
            dict[nodeToDelete.key] = nil
        }
    }
}

var lRUCache =  LRUCache(2);
lRUCache.put(1, 1); // cache is {1=1}
print(lRUCache.head.next!.val)
lRUCache.put(2, 2); // cache is {1=1, 2=2}
print(lRUCache.head.next!.val)
lRUCache.get(1);    // return 1
print(lRUCache.head.next!.val)
lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
print(lRUCache.head.next!.val)
print(lRUCache.dict)
lRUCache.get(2);    // returns -1 (not found)
lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
lRUCache.get(1);    // return -1 (not found)
lRUCache.get(3);    // return 3
lRUCache.get(4);    // return 4

