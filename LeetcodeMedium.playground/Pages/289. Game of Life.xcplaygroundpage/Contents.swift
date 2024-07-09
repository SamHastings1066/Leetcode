// Copy board
//class Solution {
//    func gameOfLife(_ board: inout [[Int]]) {
//        let moves = [[0,1],[0,-1],[1,0],[-1,0],[1,1],[1,-1],[-1,1],[-1,-1]]
//        let m = board.count
//        let n = board[0].count
//        var matrix = board
//        for r in 0..<m {
//            for c in 0..<n {
//                var sum = 0
//                let cell = board[r][c]
//                for move in moves {
//                    let nr = r + move[0]
//                    let nc = c + move[1]
//                    if nr >= 0, nr < m, nc >= 0, nc < n {
//                        sum += board[nr][nc]
//                    }
//                }
//                
//                if sum < 2 || sum > 3 {
//                    matrix[r][c] = 0
//                } else if sum == 3 {
//                    matrix[r][c] = 1
//                }
//            }
//        }
//        board = matrix
//    }
//}

// O(1) space
class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        let moves = [[0,1],[0,-1],[1,0],[-1,0],[1,1],[1,-1],[-1,1],[-1,-1]]
        let m = board.count
        let n = board[0].count
        for r in 0..<m {
            for c in 0..<n {
                var sum = 0
                let cell = board[r][c]
                for move in moves {
                    let nr = r + move[0]
                    let nc = c + move[1]
                    if nr >= 0, nr < m, nc >= 0, nc < n {
                        if board[nr][nc] > 0 { sum += 1}
                    }
                }
                if board[r][c] == 0 {
                    if sum == 3 { board[r][c] = -1 }
                } else {
                    if sum < 2 || sum > 3 { board[r][c] = 2 }
                }
            }
        }
        for r in 0..<m {
            for c in 0..<n {
                if board[r][c] == 2 { board[r][c] = 0 }
                else if board[r][c] == -1 { board[r][c] = 1 }
            }
        }
    }
}

var board = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]

Solution().gameOfLife(&board)
print(board)
