public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
      public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

// First attempt: The idea is to to a BFS; keep track of the currentLevelLength and the nextLevelLength. When current level length = 0, then you are at the end of the level so the next pointer sould be nil, otherwise, if there are any nodes left in the queue, the next pointer should point to the next node in the queue, and if there aren't any nodes left in the queue then you are at the end of the BFS so the next pointer for the current node should also be nil.
//class Solution {
//    func connect(_ root: Node?) -> Node? {
//        var currentLevelLength = 1
//        var nextLevelLength = 0
//        var queue = [root]
//        while !queue.isEmpty {
//            var curr = queue.removeFirst()
//            currentLevelLength -= 1
//            if let left = curr?.left {
//                queue.append(left)
//                nextLevelLength += 1
//            }
//            if let right = curr?.right {
//                queue.append(right)
//                nextLevelLength += 1
//            }
//            if currentLevelLength == 0 {
//                currentLevelLength = nextLevelLength
//                nextLevelLength = 0
//                curr?.next = nil
//            } else if let next = queue.first {
//                curr?.next = next
//            } else {
//                curr?.next = nil
//            }
//        }
//        return root
//    }
//}

// Pretty much the same, just using queue.count and an internal for loop
//class Solution {
//    func connect(_ root: Node?) -> Node? {
//        var queue = [root]
//        while !queue.isEmpty {
//            let size = queue.count
//            
//            for i in 0..<size {
//                var curr = queue.removeFirst()
//                if i < size - 1 {
//                    curr?.next = queue.first!
//                }
//                if let left = curr?.left {
//                    queue.append(left)
//                }
//                if let right = curr?.right {
//                    queue.append(right)
//                }
//            }
//            
//        }
//        return root
//    }
//}


// Linked list
class Solution {
    
    func process(_ child: Node?, _ prev: Node?, _ leftmost: Node?) -> (Node?, Node?) {
        var leftmost = leftmost, prev = prev
        if child != nil {
            if let prev {
                prev.next = child
            } else {
                leftmost = child
            }
            prev = child
        }
        return (prev, leftmost)
    }
    
    func connect(_ root: Node?) -> Node? {
        var leftmost = root
        while leftmost != nil {
            var curr = leftmost
            var prev: Node? = nil
            leftmost = nil
            while curr != nil {
                (prev, leftmost) = process(curr?.left, prev, leftmost)
                (prev, leftmost) = process(curr?.right, prev, leftmost)
                curr = curr?.next
            }
            
        }
        return root
    }
}
