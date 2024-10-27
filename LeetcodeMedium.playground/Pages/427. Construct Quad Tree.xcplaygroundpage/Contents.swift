
//Definition for a QuadTree node.
public class Node {
    public var val: Bool
    public var isLeaf: Bool
    public var topLeft: Node?
    public var topRight: Node?
    public var bottomLeft: Node?
    public var bottomRight: Node?
    public init(_ val: Bool, _ isLeaf: Bool) {
        self.val = val
        self.isLeaf = isLeaf
        self.topLeft = nil
        self.topRight = nil
        self.bottomLeft = nil
        self.bottomRight = nil
    }
}

// My first attempt
//class Solution {
//    func construct(_ grid: [[Int]]) -> Node? {
//        let n = grid.count
//        if n == 1 {
//            return Node((grid[0][0] != 0), true)
//        }
//        
//        var topLeft = Array(repeating: Array(repeating: 0, count: n/2), count: n/2)
//        var topRight = Array(repeating: Array(repeating: 0, count: n/2), count: n/2)
//        var bottomLeft = Array(repeating: Array(repeating: 0, count: n/2), count: n/2)
//        var bottomRight = Array(repeating: Array(repeating: 0, count: n/2), count: n/2)
//        for i in 0..<n {
//            for j in 0..<n {
//                if i / (n/2) == 0 {
//                    //top
//                    if j / (n/2) == 0 {
//                        //left
//                        topLeft[i % (n/2)][j % (n/2)] = grid[i][j]
//                    } else {
//                        //right
//                        topRight[i % (n/2)][j % (n/2)] = grid[i][j]
//                    }
//                } else {
//                    // bottom
//                    if j / (n/2) == 0 {
//                        //left
//                        bottomLeft[i % (n/2)][j % (n/2)] = grid[i][j]
//                    } else {
//                        //right
//                        bottomRight[i % (n/2)][j % (n/2)] = grid[i][j]
//                    }
//                }
//            }
//        }
//        
//        var topLeftNode = construct(topLeft)
//        var topRightNode = construct(topRight)
//        var bottomLeftNode = construct(bottomLeft)
//        var bottomRightNode = construct(bottomRight)
//        var node = Node(true, true)
//        
//        
//        if topLeftNode?.val ==  topRightNode?.val && topLeftNode?.val ==  bottomLeftNode?.val && topLeftNode?.val ==  bottomRightNode?.val && topLeftNode!.isLeaf && topRightNode!.isLeaf && bottomLeftNode!.isLeaf && bottomRightNode!.isLeaf  {
//            node.val = topLeftNode!.val
//            node.isLeaf = true
//        } else {
//            node.isLeaf = false
//            node.topLeft = topLeftNode
//            node.topRight = topRightNode
//            node.bottomLeft = bottomLeftNode
//            node.bottomRight = bottomRightNode
//        }
//        
//        print(node.val, node.isLeaf)
//        return node
//    }
//}

// Recursion
//class Solution {
//    func isLeaf(_ grid: [[Int]], _ x1: Int, _ y1: Int, _ length: Int) -> Bool {
//        for i in x1..<x1 + length {
//            for j in y1..<y1 + length {
//                if grid[i][j] != grid[x1][y1] { return false }
//            }
//        }
//        return true
//    }
//    
//    func solve(_ grid: [[Int]], _ x1: Int, _ y1: Int, _ length: Int) -> Node? {
//        if isLeaf(grid, x1, y1, length) {
//            return Node(grid[x1][y1] != 0, true)
//        } else {
//            var node = Node(false, false)
//            node.topLeft = solve(grid, x1, y1, length/2)
//            node.topRight = solve(grid, x1, y1 + length/2, length/2)
//            node.bottomLeft = solve(grid, x1 + length/2, y1, length/2)
//            node.bottomRight = solve(grid, x1 + length/2, y1 + length/2, length/2)
//            return node
//        }
//    }
//    
//    func construct(_ grid: [[Int]]) -> Node? {
//        solve(grid, 0, 0, grid.count)
//    }
//}

// Optimized recursion
class Solution {

    
    func solve(_ grid: [[Int]], _ x1: Int, _ y1: Int, _ length: Int) -> Node? {
        if  length == 1 {
            return Node(grid[x1][y1] != 0, true)
        }
        
        var topLeft = solve(grid, x1, y1, length/2)
        var topRight = solve(grid, x1, y1 + length/2, length/2)
        var bottomLeft = solve(grid, x1 + length/2, y1, length/2)
        var bottomRight = solve(grid, x1 + length/2, y1 + length/2, length/2)
        
        if topLeft!.isLeaf && topRight!.isLeaf && bottomLeft!.isLeaf && bottomRight!.isLeaf && topLeft!.val == topRight!.val && topRight!.val == bottomLeft!.val && bottomLeft!.val == bottomRight!.val {
            return Node(topLeft!.val, true)
        }
        
        var node = Node(false, false)
        node.topLeft = topLeft
        node.bottomLeft = bottomLeft
        node.topRight = topRight
        node.bottomRight = bottomRight
        return node
    }
    
    func construct(_ grid: [[Int]]) -> Node? {
        solve(grid, 0, 0, grid.count)
    }
}

let grid = [[1,1,0,0],[0,0,1,1],[1,1,0,0],[0,0,1,1]]

print(Solution().construct(grid))

