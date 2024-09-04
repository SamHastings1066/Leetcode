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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var valsArray = [Int]()
        DFS(root)
        return valsArray[k-1]
        
        func DFS(_ node: TreeNode?) {
            if node == nil { return }
            DFS(node?.left)
            valsArray.append(node!.val)
            DFS(node?.right)
        }
    }
}
