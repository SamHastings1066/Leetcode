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

// Simple O(n)
//class Solution {
//    func countNodes(_ root: TreeNode?) -> Int {
//        if let root {
//            return 1 + countNodes(root.left) + countNodes(root.right)
//        } else {
//            return 0
//        }
//    }
//}

// O(d^2)
class Solution {
    func treeDepth(_ root: TreeNode) -> Int {
        var d = 0, root = root
        while root.left != nil {
            d += 1
            root = root.left!
        }
        return d
    }
    
    func exists(_ idx: Int, _ d: Int, _ root: TreeNode?) -> Bool {
        var left = 0
        var right = (1 << d) - 1
        var root = root
        for _ in 0..<d {
            let pivot = left + (right-left)/2
            if idx <= pivot {
                right = pivot
                root = root?.left
            } else {
                left = pivot + 1
                root = root?.right
            }
        }
        return root != nil
    }
    
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let d = treeDepth(root!)
        if d == 0 { return 1}
        
        var left = 1, right = (1 << d) - 1
        while left <= right {
            let idx = left + (right-left)/2
            if exists(idx, d, root) {
                left = idx + 1
            } else {
                right = idx - 1
            }
        }
        return (1<<d) - 1 + left
        
    }
}
