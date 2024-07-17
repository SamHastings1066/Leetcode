public class Node: Hashable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.val == rhs.val
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
    
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

//class Solution {
//    func copyRandomList(_ head: Node?) -> Node? {
//        guard head != nil else { return nil }
//        var current = head
//        
//        var randomArray = [Int?]()
//        while current != nil {
//            randomArray.append( current!.random?.val)
//            current = current!.next
//        }
//        
//        current = head
//        var nodeStack = [(Node, Int?)]()
//        let headCopy = Node(current!.val)
//        var currentCopy = headCopy
//        nodeStack.append((headCopy, current!.random?.val ))
//        
//        current = current?.next
//        while current != nil {
//            let newCopy = Node(current!.val)
//            currentCopy.next = newCopy
//            currentCopy = newCopy
//            nodeStack.append((newCopy, current!.random?.val))
//            current = current?.next
//        }
//        
//        for (currentNode, random) in nodeStack {
//            if let random {
//                let randomIdx = randomArray.firstIndex(where: {$0 == random})
//                currentNode.random = nodeStack[randomIdx!].0
//            }
//        }
//        
//        
//        
//        
//        return headCopy
//    }
//}


//class Solution {
//    func copyRandomList(_ head: Node?) -> Node? {
//        guard head != nil else { return nil }
//        
//        var current = head
//        var nodeDict = [Int: Int]()
//        var idx = 0
//        
//        // First pass: create the mapping from original node values to their indices
//        while current != nil {
//            nodeDict[current!.val] = idx
//            current = current?.next
//            idx += 1
//        }
//        
//        current = head
//        var nodeStack = [Node]()
//        let headCopy = Node(current!.val)
//        var currentCopy: Node? = headCopy
//        nodeStack.append(headCopy)
//        
//        // Second pass: create the new list without setting random pointers
//        current = current?.next
//        while current != nil {
//            let newCopy = Node(current!.val)
//            currentCopy?.next = newCopy
//            currentCopy = newCopy
//            nodeStack.append(newCopy)
//            current = current?.next
//        }
//        
//        current = head
//        currentCopy = headCopy
//        idx = 0
//        
//        // Third pass: set the random pointers in the copied list
//        while current != nil {
//            if let randomNode = current?.random {
//                if let randomIndex = nodeDict[randomNode.val] {
//                    currentCopy?.random = nodeStack[randomIndex]
//                }
//            }
//            current = current?.next
//            currentCopy = currentCopy?.next
//            idx += 1
//        }
//        
//        return headCopy
//    }
//}


//class Solution {
//    
//    var visited: [Node: Node] = [:]
//    
//    func copyRandomList(_ head: Node?) -> Node? {
//        guard head != nil else {return nil}
//        guard visited[head!] == nil else {
//            return visited[head!]
//        }
//    
//        visited[head!] = Node(head!.val)
//            
//        visited[head!]?.next = copyRandomList(head?.next)
//        visited[head!]?.random = copyRandomList(head?.random)
//        return visited[head!]
//   
//    }
//}


//
class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard head != nil else {return head}
        var pointer = head
        while pointer != nil {
            let newNode = Node(pointer!.val)
            newNode.next = pointer!.next
            pointer?.next = newNode
            pointer = newNode.next
        }
        pointer = head
        while pointer != nil {
            pointer!.next?.random = pointer?.random?.next
            pointer = pointer!.next?.next
        }
       
        var oldListPointer = head
        var newListPointer = head?.next
        var newHead = head?.next
        while oldListPointer != nil {
            oldListPointer?.next = newListPointer?.next
            newListPointer?.next = newListPointer?.next == nil ? nil : newListPointer?.next?.next
            oldListPointer = oldListPointer?.next
            newListPointer = newListPointer?.next
            
        }
        return newHead
    }
}
