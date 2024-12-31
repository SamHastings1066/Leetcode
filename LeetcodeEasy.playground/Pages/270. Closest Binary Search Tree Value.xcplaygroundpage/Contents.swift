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

// First ans
//class Solution {
//    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
//        var ans = 0
//        var minDiff = Double.greatestFiniteMagnitude
//        dfs(root)
//        return ans
//
//        func dfs(_ root: TreeNode?) {
//            guard let root else { return }
//            let diff = abs(Double(root.val) - target)
//            if diff <= minDiff {
//                if diff == minDiff {
//                    ans = min(ans, root.val)
//                } else {
//                    minDiff = diff
//                    ans = root.val
//                }
//            }
//            dfs(root.left)
//            dfs(root.right)
//        }
//    }
//}

class Solution {
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        guard let root else { return Int.min}
        var closest = root.val
        var current: TreeNode? = root
        
        while current != nil {
            if abs(Double(current!.val) - target) < abs(Double(closest) - target) ||
            (abs(Double(current!.val) - target) == abs(Double(closest) - target) && current!.val < closest)
            {
                closest = current!.val
            }
            if Double(current!.val) < target {
                current = current?.right
            } else {
                current = current?.left
            }
        }
        return closest
    }
}
