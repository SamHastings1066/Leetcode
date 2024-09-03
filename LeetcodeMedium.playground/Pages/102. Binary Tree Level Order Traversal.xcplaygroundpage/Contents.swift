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

// My solution
//class Solution {
//    func levelOrder(_ root: TreeNode?) -> [[Int]] {
//        var output = [[Int]]()
//        DFS(root, 0)
//        return output
//        
//        func DFS(_ node: TreeNode?, _ level: Int) {
//            if node == nil { return }
//            if output.count == level {
//                output.append([node!.val])
//            } else {
//                output[level].append(node!.val)
//            }
//            DFS(node?.left, level + 1)
//            DFS(node?.right, level + 1)
//        }
//    }
//}


// Iterative
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return [] }
        var ans = [[Int]]()
        var level = 0
        var queue = [root!]
        while !queue.isEmpty {
            ans.append([])
            for _ in 0..<queue.count {
                var node = queue.removeFirst()
                ans[level].append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            level += 1
        }
        return ans
    }
}
