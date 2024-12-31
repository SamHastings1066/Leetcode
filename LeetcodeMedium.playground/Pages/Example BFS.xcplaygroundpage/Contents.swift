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

func BFS(_ root: TreeNode?) {
    var queue = [root]
    var level = 1
    while !queue.isEmpty {
        let currLevelCount = queue.count
        print("--LEVEL \(level)--")
        for _ in 0..<currLevelCount {
            let node = queue.removeFirst()
            if let node {
                print(node.val)
                queue.append(node.left)
                queue.append(node.right)
            }
        }
        level += 1
    }
}

let root = createTree(fromArray: [0,1,2,nil,4,5,6,nil,nil,9,10,11,12,13,14,nil])
BFS(root)
