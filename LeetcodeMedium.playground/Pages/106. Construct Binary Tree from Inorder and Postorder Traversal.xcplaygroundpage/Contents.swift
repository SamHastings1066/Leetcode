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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var inorderValueIndex = [Int:Int]()
        for (idx, val) in inorder.enumerated() {
            inorderValueIndex[val] = idx
        }
        var postorderIndex = postorder.count-1
        let root = arrayToTree(0, postorder.count - 1)
        
        func arrayToTree(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right { return nil }
            let rootVal = postorder[postorderIndex]
            var root = TreeNode(rootVal)
            postorderIndex -= 1
            root.right = arrayToTree(inorderValueIndex[rootVal]! + 1, right)
            root.left = arrayToTree(left, inorderValueIndex[rootVal]! - 1)
            return root
            
        }
        return root
    }
}

var inorder = [9,3,15,20,7]
var postorder = [9,15,7,20,3]

print(Solution().buildTree(inorder, postorder)?.val)
