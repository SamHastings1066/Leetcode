//Definition for a binary tree node.
public class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
    init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
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

// BFS
//class Solution {
//    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
//        var q1 = [p]
//        var q2 = [q]
//        
//        while !q1.isEmpty || !q2.isEmpty {
//            let curr1 = q1.removeFirst()
//            let curr2 = q2.removeFirst()
//            
//            if curr1?.val != curr2?.val { return false }
//            
//            if curr1 != nil {
//                q1.append(curr1?.left)
//                q1.append(curr1?.right)
//            }
//            if curr2 != nil {
//                q2.append(curr2?.left)
//                q2.append(curr2?.right)
//            }
//            
//        }
//        return true
//    }
//}

// Recursive
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if p?.val != q?.val { return false }
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}


let tree1Root = createTree(fromArray: [1,1])
let tree2Root = createTree(fromArray: [1,1])

print(Solution().isSameTree(tree1Root, tree2Root))
