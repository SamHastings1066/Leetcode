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
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var ans = 0
        dfs(root)
        return ans

        func dfs(_ node: TreeNode?) {
            guard let node else { return }
            if node.val >= low && node.val <= high { ans += node.val }
            if node.val < high {
                dfs(node.right)
            }
            if node.val > low {
                dfs(node.left)
            }
        }
    }
}
