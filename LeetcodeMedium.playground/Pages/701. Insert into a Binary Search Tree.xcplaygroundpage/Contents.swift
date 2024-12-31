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

// Recursive
//class Solution {
//    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
//        guard let root else { return TreeNode(val) }
//        if val < root.val {
//            root.left = insertIntoBST(root.left, val)
//        } else {
//            root.right = insertIntoBST(root.right, val)
//        }
//        return root
//    }
//}

// Iterative
class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var node = root
        while node != nil {
            if val > node!.val {
                if node!.right == nil {
                    node!.right = TreeNode(val)
                    return root
                } else {
                    node = node!.right
                }
            } else {
                if node!.left == nil {
                    node!.left = TreeNode(val)
                    return root
                } else {
                    node = node!.left
                }
            }
        }
        return TreeNode(val)
    }
}
