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

// First attempt
//class Solution {
//    func averageOfLevels(_ root: TreeNode?) -> [Double] {
//        var ans = [Double]()
//        var level = [Int]()
//        var queue = [root!]
//        var nodesLeftCurrent = 1
//        var nodesInNextLevel = 0
//        while !queue.isEmpty {
//            let current = queue.removeFirst()
//            nodesLeftCurrent -= 1
//            if let left = current.left {
//                queue.append(left)
//                nodesInNextLevel += 1
//            }
//            if let right = current.right {
//                queue.append(right)
//                nodesInNextLevel += 1
//            }
//            level.append(current.val)
//            if nodesLeftCurrent == 0 {
//                nodesLeftCurrent = nodesInNextLevel
//                nodesInNextLevel = 0
//                ans.append(average(level))
//                level = []
//            }
//        }
//        return ans
//    }
//    
//    func average(_ level: [Int]) -> Double {
//        let n = Double(level.count)
//        let sum = Double(level.reduce(0, +))
//        return sum / n
//    }
//    
//}


// Optimized BFS

class Solution {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var queue = [root!]
        var res = [Double]()
        while !queue.isEmpty {
            var temp = [TreeNode]()
            var count = 0.0
            var sum = 0.0
            while !queue.isEmpty {
                let curr = queue.removeFirst()
                count += 1
                sum += Double(curr.val)
                if let left = curr.left { temp.append(left) }
                if let right = curr.right { temp.append(right) }
            }
            res.append(sum / count)
            queue = temp
        }
        return res
    }
}
