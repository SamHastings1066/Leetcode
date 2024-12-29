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

// Returns array from tree
func levelOrderTraversal(_ rootNode: TreeNode?) -> [Int?] {
    // We will use an array to simulate a queue for level order traversal.
    var queue = [rootNode]
    var result: [Int?] = []
    
    while !queue.isEmpty {
        // Remove the first element from the queue.
        let node = queue.removeFirst()
        
        // Add its value to the result array or nil if it's nil.
        result.append(node?.val)
        
        // If the node is not nil, enqueue its children.
        if node != nil {
            queue.append(node!.left)
            queue.append(node!.right)
        }
    }
    
    // Remove trailing nil values which are not needed to represent the tree structure.
    while let lastElement = result.last, lastElement == nil {
        result.removeLast()
    }
    
    return result
}


// My solution
//class Solution {
//    func maxDepth(_ root: TreeNode?) -> Int {
//        guard root != nil else {return 0}
//        var runningTally = 1
//        var branchDepthArray: [Int] = []
//        
//        func traverseNode(_ node: TreeNode?) {
//            if node?.left != nil {
//                runningTally += 1
//                traverseNode(node?.left)
//            }
//            if node?.right != nil {
//                runningTally += 1
//                traverseNode(node?.right)
//            }
//            branchDepthArray.append(runningTally)
//            runningTally -= 1
//        }
//        
//        traverseNode(root)
//        
//        return branchDepthArray.max() ?? 0
//    }
//}

// Recursive
//class Solution {
//    func maxDepth(_ root: TreeNode?) -> Int {
//        guard root != nil else {return 0}
//        
//        let leftDepth = maxDepth(root?.left)
//        let rightDepth = maxDepth(root?.right)
//        return max(leftDepth, rightDepth) + 1
//    }
//}

// Iterative
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var stack = [(root,1)]
        var depth = 0
        while !stack.isEmpty {
            let (node, currentDepth) = stack.removeLast()
            depth = max(depth, currentDepth)
            if let left = node.left {
                stack.append((left, currentDepth + 1))
            }
            if let right = node.right {
                stack.append((right, currentDepth + 1))
            }
        }
        return depth
    }
}

let testArray = [3,9,20,nil,nil,15,7]
let rootFromArray = createTree(fromArray: testArray)

let solution = Solution()
print(solution.maxDepth(rootFromArray))
