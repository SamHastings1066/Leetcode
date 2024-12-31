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
//class Solution {
//    func isValidBST(_ root: TreeNode?) -> Bool {
//        var ans = true
//        check(root, nil, nil)
//        return ans
//        
//        func check(_ node: TreeNode?, _ low: Int?, _ high: Int?) {
//            if node == nil { return }
//            if let low {
//                if node!.val <= low {
//                    ans = false
//                    return
//                }
//            }
//            if let high {
//                if node!.val >= high {
//                    ans = false
//                    return
//                }
//            }
//            check(node?.left, low, node!.val)
//            check(node?.right, node!.val, high)
//        }
//    }
//}

// Refactored solution
//class Solution {
//    func isValidBST(_ root: TreeNode?) -> Bool {
//        return isBST(root, Int.min, Int.max)
//        
//        func isBST(_ node: TreeNode?, _ low: Int, _ high: Int) -> Bool {
//            guard let node else { return true }
//            guard node.val > low && node.val < high else { return false }
//            return isBST(node.left, low, node.val) && isBST(node.right, node.val, high)
//        }
//    }
//}

// In order traversal
class Solution {
    
    var prev: Int?
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        return inorder(root)
    }
    
    func inorder(_ node: TreeNode?) -> Bool {
        guard let node else { return true }
        guard inorder(node.left) else { return false }
        if let prev, prev >= node.val { return false }
        prev = node.val
        return inorder(node.right)
    }
}

// Same approach
//class Solution {
//
//    var prev: Int?
//    
//    func isValidBST(_ root: TreeNode?) -> Bool {
//        return inOrder(root)
//    }
//
//    func inOrder(_ node: TreeNode?) -> Bool {
//        guard let node else { return true }
//        let leftIsBST = inOrder(node.left)
//        if let prev, node.val <= prev { return false }
//        prev = node.val
//        let rightIsBST = inOrder(node.right)
//        return leftIsBST && rightIsBST
//    }
//}
