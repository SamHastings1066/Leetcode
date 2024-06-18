//Definition for a binary tree node.
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

// My first solution, DFS recursive - beats 100%
//class Solution {
//    func sumNumbers(_ root: TreeNode?) -> Int {
//        var nums = [Int]()
//        var digits = [Int]()
//        if let root {
//            DFS(root)
//        }
//        return nums.reduce(0, +)
//        
//        func DFS(_ node: TreeNode) {
//            digits.append(node.val)
//            if node.left == nil && node.right == nil {
//                var num = 0
//                for idx in 0..<digits.count {
//                        num = num * 10 + digits[idx]
//                }
//                nums.append(num)
//            }
//            if let left = node.left { DFS(left) }
//            if let right = node.right { DFS(right) }
//            digits.removeLast()
//        }
//    }
//}

// DFS iterative
//class Solution {
//    func sumNumbers(_ root: TreeNode?) -> Int {
//        var result = 0
//        var stack = [(root,0)]
//        while !stack.isEmpty {
//            var curr = stack.removeLast()
//            var node = curr.0
//            var sum = curr.1
//            if let node {
//                sum = sum * 10 + node.val
//                if node.left == nil, node.right == nil {
//                    result += sum
//                }
//                if let left = node.left { stack.append((left, sum))}
//                if let right = node.right {
//                    stack.append((right, sum))
//                }
//            }
//        }
//        return result
//    }
//}

// Morris preorder traversal
class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        var sum = 0, num = 0
        var root = root
        var pred: TreeNode? = nil
        
        while root != nil {
            if root?.left != nil {
                var steps = 1
                pred = root?.left
                while pred?.right != nil && pred!.right !== root {
                    pred = pred?.right
                    steps += 1
                }
                
                if pred?.right == nil {
                    num = num * 10 + root!.val
                    pred?.right = root
                    root = root?.left
                } else {
                    if pred?.left == nil {
                        sum += num
                    }
                    for _ in 0..<steps {
                        num /= 10
                    }
                    pred?.right = nil
                    root = root?.right
                }
            } else {
                num = num * 10 + root!.val
                if root?.right == nil {
                    sum += num
                }
                root = root?.right
            }
        }
        
        return sum
    }
}

var rootArray = [6,4,1,6,nil,nil,nil,nil,4,2,nil,6]
var root = createTree(fromArray: rootArray)
print(Solution().sumNumbers(root))
