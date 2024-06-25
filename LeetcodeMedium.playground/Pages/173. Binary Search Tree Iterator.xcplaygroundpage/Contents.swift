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

// Flatten tree
//class BSTIterator {
//    var pointer = 0
//    var traversal = [-1]
//
//    init(_ root: TreeNode?) {
//        if let root {
//            inorder(root)
//        }
//    }
//    
//    func inorder(_ root: TreeNode) {
//        if let left = root.left { inorder(left) }
//        traversal.append(root.val)
//        if let right = root.right { inorder(right) }
//    }
//    
//    func next() -> Int {
//        pointer += 1
//        return traversal[pointer]
//    }
//    
//    func hasNext() -> Bool {
//        return pointer + 1 < traversal.count
//    }
//}

// Use custom stack
class BSTIterator {
    var stack: [TreeNode]

    init(_ root: TreeNode?) {
        self.stack = []
        leftmostInorder(root)
    }
    
    func leftmostInorder(_ root: TreeNode?) {
        var root = root
        while root != nil {
            stack.append(root!)
            root = root?.left
        }
    }
    
    func next() -> Int {
        var nextNode = stack.removeLast()
        if let right = nextNode.right {
            leftmostInorder(right)
        }
        return nextNode.val
    }
    
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
