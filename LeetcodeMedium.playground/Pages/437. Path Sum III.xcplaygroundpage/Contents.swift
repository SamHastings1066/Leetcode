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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        var prefixSumCount = [0: 1] // Dictionary to store prefix sums
        var ans = 0
        
        func dfs(_ node: TreeNode?, _ currentSum: Int) {
            guard let node else { return }
            
            // Update current cumulative sum
            let currentSum = currentSum + node.val
            
            // Check if there exists a prefix sum that makes the current path sum to targetSum
            let complement = currentSum - targetSum
            if let count = prefixSumCount[complement] {
                ans += count
            }
            
            // Add current sum to the prefix sum count
            prefixSumCount[currentSum, default: 0] += 1
            
            // Recurse into children
            dfs(node.left, currentSum)
            dfs(node.right, currentSum)
            
            // Backtrack: Remove the current sum from the dictionary to prevent affecting other paths
            prefixSumCount[currentSum]! -= 1
        }
        
        dfs(root, 0)
        return ans
    }
}
