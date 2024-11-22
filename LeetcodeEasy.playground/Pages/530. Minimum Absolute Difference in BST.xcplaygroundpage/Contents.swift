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

// My solution
//class Solution {
//    func getMinimumDifference(_ root: TreeNode?) -> Int {
//        var array = [Int]()
//        DFS(root)
//        var ans = Int.max
//        for i in 0..<array.count-1 {
//            ans = min(ans, array[i+1]-array[i])
//        }
//        
//        return ans
//        
//        func DFS(_ root: TreeNode?) {
//            guard let root else { return }
//            DFS(root.left)
//            array.append(root.val)
//            DFS(root.right)
//        }
//    }
//    
//    
//}


//class Solution {
//    func getMinimumDifference(_ root: TreeNode?) -> Int {
//        var sorted = [Int]()
//        DFS(root)
//        var minDiff = Int.max
//        for i in 1..<sorted.count {
//            minDiff = min(minDiff, sorted[i] - sorted[i-1])
//        }
//        return minDiff
//        
//        func DFS(_ root: TreeNode?) {
//            if let left = root?.left { DFS(left) }
//            sorted.append(root!.val)
//            if let right = root?.right { DFS(right)}
//        }
//    }
//    
//}

// Without list
class Solution {
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var minDiff = Int.max
        var last: Int? = nil
        DFS(root!)
        return minDiff
        
        func DFS(_ root: TreeNode) {
            if let left = root.left { DFS(left) }
            if let last {
                minDiff = min(minDiff, root.val - last)
            }
            last = root.val
            if let right = root.right { DFS(right)}
        }
    }
    
}
