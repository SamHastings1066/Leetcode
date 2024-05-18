
// Additonal memory
//class Solution {
//    func setZeroes(_ matrix: inout [[Int]]) {
//        var seenIs = Array(repeating: 0, count: matrix.count)
//        var seenJs = Array(repeating: 0, count: matrix[0].count)
//        
//        for i in 0..<matrix.count {
//            for j in 0..<matrix[0].count {
//                if matrix[i][j]==0 {
//                    seenIs[i]=1
//                    seenJs[j]=1
//                }
//            }
//        }
//        for i in 0..<matrix.count {
//            for j in 0..<matrix[0].count {
//                if seenIs[i]==1 || seenJs[j]==1 {
//                    matrix[i][j]=0
//                }
//            }
//        }
//    }
//}

// O(1) Space
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var isFirstColZero = false
        for i in 0..<matrix.count {
            if matrix[i][0] == 0 { isFirstColZero = true }
            for j in 1..<matrix[0].count {
                if matrix[i][j]==0 {
                    matrix[i][0] = 0
                    matrix[0][j]=0
                }
            }
        }
        for i in 1..<matrix.count {
            for j in 1..<matrix[0].count {
                if matrix[0][j]==0 || matrix[i][0]==0 {
                    matrix[i][j] = 0
                }
            }
        }
        if matrix[0][0] == 0 {
            for j in 0..<matrix[0].count {
                matrix[0][j] = 0
            }
        }
        if isFirstColZero {
            for i in 0..<matrix.count {
                matrix[i][0] = 0
            }
        }
    }
}



var matrix = [[1,2,3,4],[5,0,7,8],[0,10,11,12],[13,14,15,0]]

Solution().setZeroes(&matrix)
print(matrix)
