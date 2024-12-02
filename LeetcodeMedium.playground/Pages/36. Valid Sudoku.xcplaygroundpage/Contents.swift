class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowSets = Array(repeating: Set<Character>(), count: 9)
        var colSets = Array(repeating: Set<Character>(), count: 9)
        var boxSets = Array(repeating: Set<Character>(), count: 9)
        
        for c in 0...8 {
            for r in 0...8 {
                let element = board[c][r]
                if element == "." { continue }
                if rowSets[r].contains(element) {
                    print("fails r")
                    return false
                } else {
                    rowSets[r].insert(element)
                }
                if colSets[c].contains(element) {
                    print("fails c")
                    return false
                } else {
                    colSets[c].insert(element)
                }
                if boxSets[(r/3) + 3 * (c/3)].contains(element) {
                    print("fails box")
                    return false
                } else {
                    boxSets[(r/3) + 3 * (c/3)].insert(element)
                }
            }
        }
        
        return true
    }
}

// Another approach:
//class Solution {
//    func isValidSudoku(_ board: [[Character]]) -> Bool {
//        let m = board.count
//        let n = board[0].count
//        var cols: [[Character]] = Array(repeating: [], count: 9)
//        var squares: [[Character]] = Array(repeating: [], count: 9)
//        for i in 0..<m {
//            for j in 0..<n {
//                cols[j].append(board[i][j])
//                let index = 3 * (i / 3) + j / 3
//                squares[index].append(board[i][j])
//            }
//        }
//        for col in cols { if !isValidSet(col) {return false } }
//        for row in board { if !isValidSet(row) {return false } }
//        for square in squares { if !isValidSet(square) {return false } }
//        return true
//    }
//
//    func isValidSet(_ chars: [Character]) -> Bool {
//        let chars = chars.compactMap{ Int(String($0)) }
//        return Set(chars).count == chars.count
//    }
//}



let board:[[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]



print(Solution().isValidSudoku(board))


