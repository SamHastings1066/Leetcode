class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var maxArea = 0
        var currArea = 0
        var grid = grid
        let m = grid.count
        let n = grid[0].count
        var moves = [[0,1],[0,-1],[1,0],[-1,0]]
        for row in 0..<m {
            for col in 0..<n {
                if grid[row][col] == 1 {
                    currArea = 1
                    dfs(row, col)
                    maxArea = max(maxArea, currArea)
                }
            }
        }

        return maxArea
        
        func dfs(_ row: Int, _ col: Int) {
            grid[row][col] = 0
            for move in moves {
                let nr = row + move[0]
                let nc = col + move[1]
                if nr >= 0, nr < m, nc >= 0, nc < n, grid[nr][nc] == 1 {
                    currArea += 1
                    dfs(nr,nc)
                }
            }
        }
    }
}
