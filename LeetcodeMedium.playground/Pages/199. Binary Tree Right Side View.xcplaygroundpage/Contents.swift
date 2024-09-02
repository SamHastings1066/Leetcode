public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// My first solution
//class Solution {
//    func rightSideView(_ root: TreeNode?) -> [Int] {
//        var levelCounts: [Int] = []
//        var ans: [Int] = []
//        var queue: [TreeNode?] = []
//        BFS(root, 0)
//        return ans
//        
//        func BFS(_ node: TreeNode?, _ level: Int) {
//            if let node {
//                if levelCounts.count <= level {
//                    levelCounts.append(1)
//                } else {
//                    levelCounts[level] += 1
//                }
//                queue.append(node)
//                let popped = queue.removeFirst()
//                levelCounts[level] -= 1
//                if levelCounts[level] == 0 {
//                    ans.append(popped!.val)
//                    levelCounts[level] = -10000
//                }
//                if let right = popped?.right {
//                    BFS(right, level + 1)
//                }
//                if let left = popped?.left {
//                    BFS(left, level + 1)
//                }
//            }
//        }
//    }
//}

// Two queues
//class Solution {
//    func rightSideView(_ root: TreeNode?) -> [Int] {
//        var rightSide = [Int]()
//        var currLevel = [TreeNode]()
//        
//        if let root { currLevel = [root] }
//        
//        while !currLevel.isEmpty {
//            var nextLevel = [TreeNode]()
//            rightSide.append(currLevel.last!.val)
//            for node in currLevel {
//                if let left = node.left { nextLevel.append(left)}
//                if let right = node.right { nextLevel.append(right)}
//            }
//            currLevel = nextLevel
//        }
//        return rightSide
//    }
//}
    
// reversed per-order traversal
class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var output = [Int]()
        reversedPreOrder(root, 0)
        return output
        
        
        func reversedPreOrder(_ node: TreeNode?, _ level: Int) {
            if node == nil { return }
            if level == output.count {
                output.append(node!.val)
            }
            reversedPreOrder(node?.right, level + 1)
            reversedPreOrder(node?.left, level + 1)
        }
    }
}
