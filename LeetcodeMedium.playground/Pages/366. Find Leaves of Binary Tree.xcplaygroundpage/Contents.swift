
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


// First attempt
//class Solution {
//    func findLeaves(_ root: TreeNode?) -> [[Int]] {
//        
//        var ans = [[Int]]()
//        guard let root else { return ans }
//        var maxDepth = 0
//        func computeMaxDepth(_ node: TreeNode, depth: Int) {
//            maxDepth = max(depth, maxDepth)
//            if let left = node.left {
//                computeMaxDepth(left, depth: depth + 1)
//            }
//            if let right = node.right {
//                computeMaxDepth(right, depth: depth + 1)
//            }
//        }
//        computeMaxDepth(root, depth: 1)
//        ans = Array(repeating: [], count: maxDepth)
//        
//        func treeDepth( _ node: TreeNode) -> Int {
//            if node.left == nil && node.right == nil {
//                ans[0].append(node.val)
//                return 0
//            }
//            var leftDepth = 0
//            var rightDepth = 0
//            if let left = node.left {
//                leftDepth = treeDepth(left)
//            }
//            if let right = node.right {
//                rightDepth = treeDepth(right)
//            }
//            let depth = max(leftDepth, rightDepth) + 1
//            ans[depth].append(node.val)
//            return depth
//        }
//        treeDepth(root)
//        return ans
//    }
//}

// Same basic approach but increase ans size on the fly so only have to do one traversal
class Solution {
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        
        var ans = [[Int]]()
        
        func height(_ node: TreeNode?) -> Int {
            guard let node else {
                return -1
            }
            let currHeight = max( height(node.left), height(node.right) ) + 1
            if currHeight == ans.count { ans.append([]) }
            ans[currHeight].append(node.val)
            return currHeight
        }
        
        height(root)
        return ans
    }
}
