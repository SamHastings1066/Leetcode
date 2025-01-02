// Time: O(mxn), Space: O(mxn)
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let m = mat.count
        let n = mat[0].count
        var mat = mat
        var queue = [[Int]]()
        var seen = Array(repeating: Array(repeating: false, count: n), count: m)
        for row in 0..<m {
            for col in 0..<n {
                if mat[row][col] == 0 {
                    queue.append([row,col])
                    seen[row][col] = true
                }
            }
        }
        

        let moves = [[0,1],[0,-1],[-1,0],[1,0]]

        while !queue.isEmpty{
            let rowCount = queue.count


            for _ in 0..<rowCount {
                let node = queue.removeFirst()
                let row = node[0]
                let col = node[1]
                for move in moves {
                    let nr = row + move[0]
                    let nc = col + move[1]
                    if nr >= 0, nr < m, nc >= 0, nc < n, !seen[nr][nc] {
                        queue.append([nr,nc])
                        seen[nr][nc] = true
                        mat[nr][nc] = mat[row][col] + 1
                    }
                }
            }
        }
        return mat
    }
}
