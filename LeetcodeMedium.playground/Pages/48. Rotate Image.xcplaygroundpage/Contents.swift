// Transpose then reflect
//class Solution {
//    func rotate(_ matrix: inout [[Int]]) {
//        var n = matrix.count
//        //Transpose
//        for c in 0..<n {
//            for r in 0..<c {
//                (matrix[c][r],matrix[r][c]) = (matrix[r][c],matrix[c][r])
//            }
//        }
//        //Reflection
//        for c in 0..<n {
//            for r in 0..<n/2 {
//                (matrix[c][r],matrix[c][n-r-1]) = (matrix[c][n-r-1],matrix[c][r])
//            }
//        }
//    }
//}

// Rotate groups of 4
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        var n = matrix.count
        for r in 0..<(n/2 + n%2) {
            for c in 0..<n/2 {
                var tmp = matrix[n-1-c][r]
                matrix[n-1-c][r] = matrix[n-1-r][n-1-c]
                matrix[n-1-r][n-1-c] = matrix[c][n-1-r]
                matrix[c][n-1-r] = matrix[r][c]
                matrix[r][c] = tmp
            }
        } 
    }
}


var matrix = [[1,2,3],[4,5,6],[7,8,9]]

Solution().rotate(&matrix)

print(matrix)

