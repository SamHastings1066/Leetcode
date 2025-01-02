class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        let n = grid.count
        guard grid[0][0] == 0, grid[n-1][n-1] == 0 else { return -1 }
        var grid = grid
        
        var queue = [[0,0]]
        grid[0][0] = 1
        var moves = [[-1,-1],[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1]]

        while !queue.isEmpty {
            let levelSize = queue.count
            let node = queue.removeFirst()
            let row = node[0]
            let col = node[1]
            let distance = grid[row][col]
            if row == n-1 && col == n-1 {
                return distance
            }
            for move in moves {
                let nr = row + move[0]
                let nc = col + move[1]
                if nr >= 0, nr < n, nc >= 0, nc < n, grid[nr][nc] == 0 {
                    grid[nr][nc] = distance + 1
                    queue.append([nr,nc])
                }
            }
                
        }
        return -1
    }
}

let grid = [[0,0,0],[1,1,0],[1,1,0]]
print(Solution().shortestPathBinaryMatrix(grid))
