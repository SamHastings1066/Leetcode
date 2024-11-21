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
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var array = [Int]()
        DFS(root)
        var ans = Int.max
        for i in 0..<array.count-1 {
            ans = min(ans, array[i+1]-array[i])
        }
        
        return ans
        
        func DFS(_ root: TreeNode?) {
            guard let root else { return }
            DFS(root.left)
            array.append(root.val)
            DFS(root.right)
        }
    }
    
    
}
