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

//DFS
//class Solution {
//    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
//        var ans = [[Int]]()
//        DFS(root, 0)
//        return ans
//        
//        func DFS(_ node: TreeNode?, _ level: Int) {
//            if node == nil { return }
//            if ans.count == level {
//                ans.append([])
//            }
//            if level % 2 == 0 {
//                ans[level].append(node!.val)
//            } else {
//                ans[level].insert(node!.val, at: 0)
//            }
//            if let left = node?.left {
//                DFS(left, level + 1)
//            }
//            if let right = node?.right {
//                DFS(right, level + 1)
//            }
//        }
//    }
//}

//BFS iterative
class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return [] }
        var ans = [[Int]]()
        var level = 0
        var leftToRight = true
        var queue = [root!]
        
        while !queue.isEmpty {
            ans.append([])
            for _ in 0..<queue.count {
                var node = queue.removeFirst()
                if leftToRight {
                    ans[level].append(node.val)
                } else {
                    ans[level].insert(node.val, at: 0)
                }
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            leftToRight.toggle()
            level += 1
        }
        
        return ans
    }
}
