// Definition for a binary tree node.
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

// First attempt: Time - O(n), Space - O(n) worst case

//class Solution {
//    func goodNodes(_ root: TreeNode?) -> Int {
//        guard let root else { return 0 }
//
//        return numGoodNodes(root, root.val)
//
//        func numGoodNodes(_ node: TreeNode?, _ maxOnCurrentPath: Int) -> Int {
//            guard let node else { return 0 }
//            let currentGood = maxOnCurrentPath <= node.val ? 1 : 0
//
//            let maxOnCurrentPath = max(maxOnCurrentPath, node.val)
//            let goodNodesToLeft = numGoodNodes(node.left, maxOnCurrentPath)
//            let goodNodesToRight = numGoodNodes(node.right, maxOnCurrentPath)
//            
//            return currentGood + goodNodesToLeft + goodNodesToRight
//            
//        }
//    }
//}

// Iterative: Time - O(n), Space - O(n) worst case

class Solution {
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var ans = 0
        var stack = [(root, root.val)]

        while !stack.isEmpty {
            let (node, maxOnCurrentPath) = stack.removeLast()
            if node.val >= maxOnCurrentPath { ans += 1 }
            if let left = node.left {
                stack.append((left, max(maxOnCurrentPath, left.val)))
            }
            if let right = node.right {
                stack.append((right, max(maxOnCurrentPath, right.val)))
            }
        }
        return ans
    }
}
