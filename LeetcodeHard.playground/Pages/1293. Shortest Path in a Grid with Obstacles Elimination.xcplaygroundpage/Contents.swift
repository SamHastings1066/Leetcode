/*
 My Solution:
 Time: O(m.n.k) - in the worst case, we visiteach cell in the grid a maximum of k times,
 Space: O(m.n.k) - the queue can hold cells with different states. Total number of states for a cell = m * n * k+1
*/
class Solution {
    func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
        let m = grid.count
        let n = grid[0].count
        /*
        Initialize a grid to store the minimum number of prior obstacles encountered by any path that has reached
        this point (i.e. of any path that has reached the the grid cell with corresponding [row,col]).
        This will be used to determine whether a new path can continue:
             only if a path reaches this point having encountered fewer obstacles along the way can it continue
        Initialised at k+1 since this exceeds the possible amount of obstacles in any previous path and limits all paths to k or fewer obstacles.
        */
        var minPriorObstacles = Array(repeating: Array(repeating: k + 1, count: n), count: m)

        var queue = [[Int]]() // stores (row, col, obstaclesEncountered)
        var level = 0
        queue.append([0,0,0])
        minPriorObstacles[0][0] = 0
        let moves = [[0,1],[0,-1],[1,0],[-1,0],]
        while !queue.isEmpty {
            let rowCount = queue.count

            for _ in 0..<rowCount {
                let cell = queue.removeFirst()
                let row = cell[0]
                let col = cell[1]
                if row == m-1 && col == n-1 { return level }
                let obstaclesEncountered = cell[2] + grid[row][col]
                for move in moves {
                    let nr = row + move[0]
                    let nc = col + move[1]
                    if nr >= 0, nr < m, nc >= 0, nc < n, obstaclesEncountered < minPriorObstacles[nr][nc] {
                        minPriorObstacles[nr][nc] = obstaclesEncountered
                        queue.append([nr,nc,obstaclesEncountered])
                    }
                }
            }
            level += 1
        }
        return -1
    }
}
