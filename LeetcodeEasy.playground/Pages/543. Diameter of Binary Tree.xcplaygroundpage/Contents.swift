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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var ans = 0
        func findDepth(_ node: TreeNode?) -> Int {
            guard let node else { return 0 }
            let leftDepth = findDepth(node.left)
            let rightDepth = findDepth(node.right)
            let diam = leftDepth + rightDepth
            ans = max(ans, diam)
            return 1 + max(leftDepth, rightDepth)
        }
        findDepth(root)
        return ans
    }
}
