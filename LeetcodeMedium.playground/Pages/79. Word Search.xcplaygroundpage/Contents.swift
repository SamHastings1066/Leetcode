// First attempt
//class Solution {
//    func exist(_ board: [[Character]], _ word: String) -> Bool {
//        var word = Array(word)
//        var ans = false
//        var m = board.count, n = board[0].count
//        
//        for i in 0..<m {
//            for j in 0..<n {
//                backtrack(i, j, word, [[Int]]())
//            }
//        }
//        
//        func backtrack(_ i: Int, _ j: Int, _ word: [Character], _ seen: [[Int]]) {
//            
//            var seen = seen
//            if seen.contains([i,j]) { return }
//            if word.count == 0 {
//                ans = true
//                return
//            }
//            if i < 0 || i >= m || j < 0 || j >= n { return }
//            
//            print([i,j], board[i][j], word[0])
//            if board[i][j] == word[0] {
//                seen.append([i,j])
//                backtrack(i, j+1, Array(word.dropFirst()), seen)
//                backtrack(i, j-1, Array(word.dropFirst()), seen)
//                backtrack(i+1, j, Array(word.dropFirst()), seen)
//                backtrack(i-1, j, Array(word.dropFirst()), seen)
//            }
//        }
//        
//        return ans
//    }
//}

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        var word = Array(word)
        
        var m = board.count, n = board[0].count
        
        for i in 0..<m {
            for j in 0..<n {
                if backtrack(i, j, word) { return true }
            }
        }
        
        return false
        
        func backtrack(_ i: Int, _ j: Int, _ word: [Character]) -> Bool {
            
            if word.count == 0 {
                return true
            }
            if i < 0 || i >= m || j < 0 || j >= n || board[i][j] != word[0] {
                return false
            }
            
            var ret = false
            board[i][j] = "#"
            for (row, col) in [(i, j+1), (i, j-1),(i+1, j),(i-1, j)] {
                ret = backtrack(row, col, Array(word.dropFirst()))
                if ret { break }
            }
            board[i][j] = word[0]
            return ret
        }
    }
}

var board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
var word = "ABCCED"
print(Solution().exist(board, word))
