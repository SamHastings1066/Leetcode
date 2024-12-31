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

// BFS: Time - O(n); Space - O(n)
class Solution {
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        var queue = [root]
        var ans = 0
        while !queue.isEmpty {
            ans = 0
            let rowCount = queue.count
            for _ in 0..<rowCount {
                let node = queue.removeFirst()
                ans += node?.val ?? 0
                if let left = node?.left { queue.append(left) }
                if let right = node?.right { queue.append(right) }
            }
        }
        return ans
    }
}
