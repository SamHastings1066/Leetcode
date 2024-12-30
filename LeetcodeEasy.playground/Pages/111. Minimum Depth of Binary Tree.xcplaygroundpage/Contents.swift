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

class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        
        if root.left == nil {
            return 1 + minDepth(root.right)
        }
        
        if root.right == nil {
            return 1 + minDepth(root.left)
        }
        
        return 1 + min (minDepth(root.left), minDepth(root.right))
    }
}
