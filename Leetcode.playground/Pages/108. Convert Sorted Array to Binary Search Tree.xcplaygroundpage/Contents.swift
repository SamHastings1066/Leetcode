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

class Solution {
    
    private func helper(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }
        
        var p = (left + right) / 2
        if (left + right) % 2 == 1 { p += 1 } // can omit this line to take left mid
    
        
        let root = TreeNode(nums[p])
        root.left = helper(nums, left, p-1)
        root.right = helper(nums, p+1, right)
        return root
        
    }
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return helper(nums, 0, nums.count - 1)
    }
}

let arr1 = [-10,-3,0,5,9]
let arr2 = [1,3]

let solution = Solution()

let tree1Root = solution.sortedArrayToBST(arr1)
let tree2Root = solution.sortedArrayToBST(arr2)
print(levelOrderTraversal(tree1Root))
print(levelOrderTraversal(tree2Root))
