// Definition for a binary tree node.
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inorderValueIndex = [Int:Int]()
        for (idx, val) in inorder.enumerated() {
            inorderValueIndex[val] = idx
        }
        var preorderIndex = 0
        let root = arrayToTree(0, preorder.count - 1)
        
        func arrayToTree(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right { return nil }
            let rootVal = preorder[preorderIndex]
            var root = TreeNode(rootVal)
            preorderIndex += 1
            root.left = arrayToTree(left, inorderValueIndex[rootVal]! - 1)
            root.right = arrayToTree(inorderValueIndex[rootVal]! + 1, right)
            return root
            
        }
        return root
    }
}
