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



let board:[[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]



print(Solution().isValidSudoku(board))


