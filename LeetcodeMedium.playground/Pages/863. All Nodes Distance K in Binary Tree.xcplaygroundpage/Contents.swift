public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
// First solution
class Solution {
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        /*
        convert tree into undirected graph by dfsing the tree O(n)
        then bfs the graph keeping track of the level of the bfs, return all nodes at level k
        */
        var graph = [Int:[Int]]()
        func createGraph(_ node: TreeNode?) {
            guard let node else { return }
            if let left = node.left {
                graph[node.val, default: []].append(left.val)
                graph[left.val, default: []].append(node.val)
                createGraph(left)
            }
            if let right = node.right {
                graph[node.val, default: []].append(right.val)
                graph[right.val, default: []].append(node.val)
                createGraph(right)
            }
        }

        createGraph(root)

        var queue = [target!.val]
        var level = -1
        var ans = [Int]()
        var seen = Set<Int>()
        while !queue.isEmpty {
            level += 1
            let queueCount = queue.count
            for _ in 0..<queueCount {
                let node = queue.removeFirst()
                seen.insert(node)
                if level == k {ans.append(node)}
                for neigh in graph[node, default:[]]{
                    if !seen.contains(neigh) {
                        queue.append(neigh)
                    }
                }
            }
        }
        return ans
    }
}

// Sam approach, stopping bfs when level reached and returning the queue. No need for ans array, and less redundant work:
//class Solution {
//    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
//        /*
//        convert tree into undirected graph by dfsing the tree O(n)
//        then bfs the graph keeping track of the level of the bfs, return all nodes at level k
//        */
//        var graph = [Int:[Int]]()
//        func createGraph(_ node: TreeNode?) {
//            guard let node else { return }
//            if let left = node.left {
//                graph[node.val, default: []].append(left.val)
//                graph[left.val, default: []].append(node.val)
//                createGraph(left)
//            }
//            if let right = node.right {
//                graph[node.val, default: []].append(right.val)
//                graph[right.val, default: []].append(node.val)
//                createGraph(right)
//            }
//        }
//
//        createGraph(root)
//
//        var queue = [target!.val]
//        var level = 0
//        var seen = Set<Int>()
//        while !queue.isEmpty && level < k {
//            level += 1
//            let queueCount = queue.count
//            for _ in 0..<queueCount {
//                let node = queue.removeFirst()
//                seen.insert(node)
//                for neigh in graph[node, default:[]]{
//                    if !seen.contains(neigh) {
//                        queue.append(neigh)
//                    }
//                }
//            }
//        }
//        return queue
//    }
//}
