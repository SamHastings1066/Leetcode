// Backtracking
//class Solution {
//    func minPathSum(_ grid: [[Int]]) -> Int {
//        var res = Int.max //[[Int]]()
//        
//        var m = grid.count
//        var n = grid[0].count
//        var len = m + n - 1
//        backtrack([], 0, 0)
//        func backtrack(_ path: [Int], _ i: Int, _ j: Int) {
//            var path = path
//            let currSum = path.reduce(0, +)
//            path.append(grid[i][j])
//            if path.count == len {
//                res = min(res, path.reduce(0, +))
//                return
//            }
//            if i < m - 1 {
//                backtrack(path, i+1, j)
//            }
//            if j < n - 1 {
//                backtrack(path, i, j + 1)
//            }
//        }
//        return res
//    }
//}

// Recursive
//class Solution {
//    func minPathSum(_ grid: [[Int]]) -> Int {
//        var m = grid.count
//        var n = grid[0].count
//        
//        func cost(_ i: Int, _ j: Int) -> Int {
//            if i == m || j == n {
//                return Int.max
//            }
//            if i == m - 1 && j == n - 1 {
//                return grid[i][j]
//            }
//            return grid[i][j] + min(cost(i+1, j), cost(i, j+1))
//        }
//        return cost(0,0)
//    }
//}

// DP
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var m = grid.count, n = grid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in stride(from: m-1, through: 0, by: -1) {
            for j in stride(from: n-1, through: 0, by: -1) {
                if i == m-1, j != n-1 {
                    dp[i][j] = grid[i][j] + dp[i][j+1]
                } else if i != m-1, j == n-1 {
                    dp[i][j] = grid[i][j] + dp[i+1][j]
                } else if i==m-1, j == n-1 {
                    dp[i][j] = grid[i][j]
                } else {
                    dp[i][j] = grid[i][j] + min(dp[i][j+1], dp[i+1][j])
                }
            }
        }
        return dp[0][0]
    }
}

var grid = [[1,3,1],[1,5,1],[4,2,1]]

print(Solution().minPathSum(grid))
