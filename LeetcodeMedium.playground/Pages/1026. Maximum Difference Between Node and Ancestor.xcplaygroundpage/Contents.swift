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
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?, _ maxSoFar: Int, _ minSoFar: Int) -> Int {
            guard let node else { return maxSoFar - minSoFar }

            let newMax = max(node.val, maxSoFar)
            let newMin = min(node.val, minSoFar)

            return max(dfs(node.left, newMax, newMin), dfs(node.right, newMax, newMin))

        }
        guard let root else { return 0 }
        return dfs(root, root.val, root.val)
    }
}
