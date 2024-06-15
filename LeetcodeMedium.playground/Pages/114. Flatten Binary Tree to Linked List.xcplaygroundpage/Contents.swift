
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

// Recursive, O(n) space
//class Solution {
//    func flatten(_ root: TreeNode?) {
//        flattenTree(root)
//    }
//    
//    func flattenTree(_ root: TreeNode?) -> TreeNode? {
//        if let root {
//            
//            if root.left == nil && root.right == nil {
//                return root
//            }
//            
//            var leftTail = flattenTree(root.left)
//            var rightTail = flattenTree(root.right)
//            
//            if let left = root.left {
//                leftTail?.right = root.right
//                root.right = left
//                root.left = nil
//            }
//            return rightTail ?? leftTail
//        }
//        return nil
//    }
//}

// Iterative, O(1) space
class Solution {
    func flatten(_ root: TreeNode?) {
        if root == nil { return }
        
        var node = root
        while node != nil {
            if node?.left != nil {
                var rightmost = node?.left
                while rightmost?.right != nil {
                    rightmost = rightmost?.right
                }
                rightmost?.right = node?.right
                node?.right = node?.left
                node?.left = nil
            } else {
                node = node?.right
            }
        }
        
    }
    
    
}
