// Original solution: BFS, causes TLE
//class Solution {
//    func solve(_ board: inout [[Character]]) {
//
//        var m = board.count, n = board[0].count
//        var moves = [[0,1], [0,-1], [1,0], [-1,0]]
//        
//        for i in 0..<m {
//            for j in 0..<n {
//                if i==0 || i == m-1 || j==0 || j == n-1 {
//                    if board[i][j]=="O" {
//                        BFS(i,j)
//                    }
//                }
//            }
//        }
//        for i in 0..<m {
//            for j in 0..<n {
//                if board[i][j] == "A" {
//                    board[i][j] = "O"
//                } else {
//                    board[i][j] = "X"
//                }
//            }
//        }
//        
//        func BFS(_ r: Int, _ c: Int) {
//            var queue = [[r,c]]
//            while !queue.isEmpty {
//                var curr = queue.removeFirst()
//                board[curr[0]][curr[1]] = "A"
//                
//                for move in moves {
//                    var nr = curr[0] + move[0]
//                    var nc = curr[1] + move[1]
//                    if nr>=0, nr<m, nc>=0, nc<n, board[nr][nc]=="O" {
//                        queue.append([nr,nc])
//                    }
//                }
//            }
//        }
//        
//    }
//}

//Only difference is the calcualtion of borders, causes TLE
//class Solution {
//    func solve(_ board: inout [[Character]]) {
//        
//        var m = board.count, n = board[0].count
//        var moves = [[0,1], [0,-1], [1,0], [-1,0]]
//        
//        var boarders = [[Int]]()
//        
//        for i in 0..<m {
//            boarders.append(contentsOf: [[i,0],[i,n-1]])
//        }
//        for j in 0..<n {
//            boarders.append(contentsOf: [[0,j],[m-1,j]])
//        }
//        
//        for boarder in boarders {
//            if board[boarder[0]][boarder[1]] == "O" {
//                BFS(boarder[0],boarder[1])
//            }
//        }
//        
//        for i in 0..<m {
//            for j in 0..<n {
//                if board[i][j] == "A" {
//                    board[i][j] = "O"
//                } else {
//                    board[i][j] = "X"
//                }
//            }
//        }
//        
//        func BFS(_ r: Int, _ c: Int) {
//            var queue = [[r,c]]
//            while !queue.isEmpty {
//                var curr = queue.removeFirst()
//                board[curr[0]][curr[1]] = "A"
//                
//                for move in moves {
//                    var nr = curr[0] + move[0]
//                    var nc = curr[1] + move[1]
//                    if nr>=0, nr<m, nc>=0, nc<n, board[nr][nc]=="O" {
//                        queue.append([nr,nc])
//                    }
//                }
//            }
//        }
//        
//    }
//}

// DFS - No TLE
class Solution {
    func solve(_ board: inout [[Character]]) {
        
        var m = board.count, n = board[0].count
        var moves = [[0,1], [0,-1], [1,0], [-1,0]]
        
        var boarders = [[Int]]()
        
        for i in 0..<m {
            boarders.append(contentsOf: [[i,0],[i,n-1]])
        }
        for j in 0..<n {
            boarders.append(contentsOf: [[0,j],[m-1,j]])
        }
        
        for boarder in boarders {
            if board[boarder[0]][boarder[1]] == "O" {
                DFS(boarder[0],boarder[1])
            }
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == "A" {
                    board[i][j] = "O"
                } else {
                    board[i][j] = "X"
                }
            }
        }
        
        func DFS(_ r: Int, _ c: Int) {
                board[r][c] = "A"
                
                for move in moves {
                    var nr = r + move[0]
                    var nc = c + move[1]
                    if nr>=0, nr<m, nc>=0, nc<n, board[nr][nc]=="O" {
                        DFS(nr,nc)
                    }
                }
            
        }
        
    }
}

var board: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]

Solution().solve(&board)
print(board)
