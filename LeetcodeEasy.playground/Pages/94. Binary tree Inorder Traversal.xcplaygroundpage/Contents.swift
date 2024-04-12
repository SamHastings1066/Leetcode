
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
// My solution
//class Solution {
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        var result = [Int]()
//        if let leftNode = root?.left {
//            result.append(contentsOf:inorderTraversal(leftNode))
//        }
//        if let value = root?.val {
//            result.append(value)
//        }
//        if let rightNode = root?.right {
//            result.append(contentsOf:inorderTraversal(rightNode))
//        }
//        return result
//    }
//}

// Solution using stack
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var nodeStack = [TreeNode]()
        var current = root
        while current != nil || !nodeStack.isEmpty {
            while current != nil {
                nodeStack.append(current!)
                current = current!.left
            }
            current = nodeStack.popLast()
            if let value = current?.val {
                result.append(value)
            }
            current = current?.right
        }
        return result
    }
}
