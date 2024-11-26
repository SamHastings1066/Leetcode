
class Node<Value> {
    let value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next else { return "\(value)" }
        return "\(value) -> " + String(describing: next) + " "
    }
}


let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1)

class LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    init(){}
    
    var isEmpty: Bool { head == nil }
    
    func push(value: Value) {
        head = Node(value: value, next: head)
        if tail == nil { tail = head }
    }
    
    func append(value: Value) {
        guard !isEmpty else {
            push(value: value)
            return
        }
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    func node(at index: Int) -> Node<Value>? {
        var currNode = head
        var currIndex = 0
        
        while currNode != nil && currIndex < index {
            currNode = currNode?.next
            currIndex += 1
        }
        
        return currNode
    }
    
    @discardableResult
    func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        node.next = Node(value: value, next: node.next)
        if node === tail {
            tail = node.next
        }
        return node.next!
    }
    
    func pop() -> Node<Value>? {
        defer {
            head = head?.next
            // Check if the original list was a single node i.e. the new head is nil
            if isEmpty {
                tail = nil
            }
        }
        return head
    }
    
    func removeLast() -> Node<Value>? {
        guard !isEmpty else { return nil }
        guard head?.next != nil else { return pop() }
        
        var prev = head
        var curr = head
        
        while let next = curr?.next {
            prev = curr
            curr = next
        }
        tail = prev
        tail?.next = nil
        return curr
    }
    
    func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard !isEmpty else  { return "Empty list"}
        return String(describing: head)
    }
}

var list = LinkedList<Int>()
list.push(value: 3)
list.push(value: 2)
list.push(value: 1)
print(list)

var list2 = LinkedList<Int>()
list2.append(value: 1)
list2.append(value: 2)
list2.append(value: 3)
print(list2)

var list3 = LinkedList<Int>()
list3.push(value: 3)
list3.push(value: 2)
list3.push(value: 1)
  
print("Before removing at particular index: \(list)")
let index = 1
let node = list3.node(at: index - 1)!
let removedValue = list3.remove(after: node)

print("After removing at index \(index): \(list3)")
print("Removed value: " + String(describing: removedValue))
