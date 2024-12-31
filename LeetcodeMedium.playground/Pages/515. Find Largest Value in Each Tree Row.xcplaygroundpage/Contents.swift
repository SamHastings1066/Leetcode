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

// My first solution
class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var ans = [Int]()
        var queue = [root]
        while !queue.isEmpty {
            let currLevelCount = queue.count
            var currMax = Int.min
            for _ in 0..<currLevelCount {
                let node = queue.removeFirst()
                if let node {
                    currMax = max(currMax, node.val)
                    if let left = node.left { queue.append(left) }
                    if let right = node.right { queue.append(right) }
                }
            }
            ans.append(currMax)
        }
        return ans
    }
}
