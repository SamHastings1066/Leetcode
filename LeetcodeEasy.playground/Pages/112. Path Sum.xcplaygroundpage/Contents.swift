
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

// Creates tree from array
func createTree(fromArray array: [Int?]) -> TreeNode? {
    func createNode(at index: Int) -> TreeNode? {
        if index < array.count, let value = array[index] {
            let node = TreeNode(value)
            node.left = createNode(at: 2 * index + 1)
            node.right = createNode(at: 2 * index + 2)
            return node
        }
        return nil
    }
    return createNode(at: 0)
}

//My first soution
//class Solution {
//    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
//        var result = false
//        if let root {
//            DFS(root, 0)
//        }
//        return result
//
//        func DFS(_ node: TreeNode, _ sum: Int) {
//            var sum = sum + node.val
//            if node.left == nil && node.right == nil {
//                if sum == targetSum { result = true }
//                return
//            }
//            if let left = node.left { DFS(left, sum) }
//            if let right = node.right { DFS(right, sum) }
//        }
//    }
//}

// Less code recursive DFS:
//class Solution {
//    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
//        if let root {
//            var targetSum = targetSum
//            targetSum -= root.val
//            if root.left == nil && root.right == nil {
//                return targetSum == 0
//            } else {
//                return hasPathSum(root.left, targetSum) || hasPathSum(root.right, targetSum)
//            }
//
//        }
//        return false
//    }
//}

// DFS with custom stack:
class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if let root {
            var stack = [(root, targetSum - root.val)]
            while !stack.isEmpty {
                let curr = stack.removeLast()
                let node = curr.0
                let sum = curr.1
                
                if node.left == nil && node.right == nil && sum == 0 { return true }
                if let left = node.left { stack.append((left, sum - left.val))}
                if let right = node.right { stack.append((right, sum - right.val))}
            }
        }
        return false
    }
}

var rootArray = [5,4,8,11,nil,13,4,7,2,nil,nil,nil,1]
var treeRoot = createTree(fromArray: rootArray)
print(Solution().hasPathSum(treeRoot, 22))
