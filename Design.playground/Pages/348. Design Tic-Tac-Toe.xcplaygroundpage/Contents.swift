// Space: O(n) - because of horizontalCount and verticalCount
//class TicTacToe {
//    var horizontalCount: [[Int]]
//    var verticalCount: [[Int]]
//    var topLeftToBottomRightCount: [Int]
//    var topRightToBottomLeftCount: [Int]
//    let n: Int
//    
//
//    init(_ n: Int) {
//        self.n = n
//        horizontalCount = Array(repeating:[0,0], count: n) // [p1 count,p2 count]
//        verticalCount = Array(repeating:[0,0], count: n) // [p1 count,p2 count]
//        topLeftToBottomRightCount = [0,0] // [p1 count,p2 count]
//        topRightToBottomLeftCount = [0,0] // [p1 count,p2 count]
//    }
//    
//    // Time: O(n)
//    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
//        horizontalCount[row][player-1] += 1
//        if horizontalCount[row][player-1] == n { return player }
//        verticalCount[col][player-1] += 1
//        if verticalCount[col][player-1] == n { return player }
//        if row == col {
//            topLeftToBottomRightCount[player-1] += 1
//            if topLeftToBottomRightCount[player-1] == n { return player }
//        }
//        if n - row - 1 == col {
//            topRightToBottomLeftCount[player-1] += 1
//            if topRightToBottomLeftCount[player-1] == n { return player }
//        }
//        return 0
//    }
//}

//Optimised solution:
class TicTacToe {
    var rowCount: [Int]
    var colCount: [Int]
    var diag1: Int
    var diag2: Int
    let n: Int

    init(_ n: Int) {
        self.n = n
        rowCount = Array(repeating: 0, count: n)
        colCount = Array(repeating: 0, count: n)
        diag1 = 0
        diag2 = 0
    }
    
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        let toAdd = player == 1 ? 1 : -1

        // Update row and column counts
        rowCount[row] += toAdd
        colCount[col] += toAdd

        // Check if the move is on the main diagonal
        if row == col {
            diag1 += toAdd
        }

        // Check if the move is on the anti-diagonal
        if row + col == n - 1 {
            diag2 += toAdd
        }

        // Check if the player has won
        if abs(rowCount[row]) == n || abs(colCount[col]) == n ||
           abs(diag1) == n || abs(diag2) == n {
            return player
        }

        return 0 // No winner yet
    }
}
