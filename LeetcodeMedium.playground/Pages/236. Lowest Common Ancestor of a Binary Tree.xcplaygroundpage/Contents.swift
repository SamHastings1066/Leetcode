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
// My approach
//class Solution {
//    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
//        
//        var path1 = [TreeNode]()
//        var path2 = [TreeNode]()
//        var currentPath = [TreeNode]()
//        DFS(root)
//        
//        func DFS(_ node: TreeNode?) {
//            if !path2.isEmpty { return }
//            if let node {
//                //print(node.val)
//                currentPath.append(node)
//                if node.val == p!.val || node.val == q!.val {
//                    //print("Node val is \(node.val)")
//                    if path1.isEmpty {
//                        path1 = currentPath
//                    } else {
//                        path2 = currentPath
//                    }
//                }
//                DFS(node.left)
//                DFS(node.right)
//                currentPath.removeLast()
//            } else {
//                return
//            }
//            
//        }
////        for node in path1 {
////            print(node.val)
////        }
////        for node in path2 {
////            print(node.val)
////        }
//        var i = 0
//        while i<path1.count && i<path2.count && path1[i].val == path2[i].val {
//            i+=1
//        }
//        return path1[i-1]
//        
//    }
//}

// DFS
//class Solution {
//    
//    var ans: TreeNode?
//    
//    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
//        func recursiveSearch(_ node: TreeNode?) -> Int {
//            if node == nil {return 0}
//            var left = recursiveSearch(node?.left)
//            var right = recursiveSearch(node?.right)
//            var mid = node?.val == p?.val || node?.val == q?.val ? 1 : 0
//            if mid + left + right >= 2 { ans = node }
//            return mid == 1 || left == 1 || right == 1 ? 1 : 0
//        }
//        recursiveSearch(root)
//        return ans
//    }
//}


// Recursive, 3 cases:
class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // Base case
        guard let root else { return nil }
        
        // Case 1
        if root === p || root === q {
        return root
        }

        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)

        // Case 2
        if left != nil && right != nil {
        return root
        }
        
        // Case 3
        if left != nil {
        return left
        }

        return right
    }
}


let rootArray = [1,2]
let treeRoot = createTree(fromArray: rootArray)
let p = TreeNode(1)
let q = TreeNode(2)

print(Solution().lowestCommonAncestor(treeRoot, p, q)?.val ?? "no value")
