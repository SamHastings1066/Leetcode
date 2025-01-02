// Time: O(N); Space O(N) - where N is number of cells in maze.
class Solution {
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        let m = maze.count
        let n = maze[0].count
        
        var seen = Array(repeating: Array(repeating: false, count: n), count: m)
        
        var queue = [entrance]
        seen[entrance[0]][entrance[1]] = true
        var level = 0
        let moves = [[0,1],[0,-1],[1,0],[-1,0]]
        
        while !queue.isEmpty {
            let rowLength = queue.count
            for _ in 0..<rowLength {
                let cell = queue.removeFirst()
                let row = cell[0]
                let col = cell[1]
                if level != 0 && (row == 0 || row == m-1 || col == 0 || col == n-1) {
                    return level
                }
                for move in moves {
                    let nr = row + move[0]
                    let nc = col + move[1]
                    if nr >= 0, nr < m, nc >= 0, nc < n, !seen[nr][nc], maze[nr][nc] != "+" {
                        queue.append([nr,nc])
                        seen[nr][nc] = true
                    }
                }
            }
            level += 1
        }
        
        return -1
    }
}
