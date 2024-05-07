//// Recursive
//class Solution {
//    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
//        let m = matrix.count
//        var matrix = matrix
//        if m <= 1 {return matrix[0]}
//        var topRow = matrix.removeFirst()
//        return topRow + spiralOrder(rotate(matrix))
//    }
//    
//    func rotate(_ matrix: [[Int]]) -> [[Int]] {
//        let m = matrix.count
//        let n = matrix[0].count
//        var res = Array(repeating: Array(repeating: 0, count: m), count: n)
//        for i in 0..<m {
//            for j in 0..<n {
//                res[n-1-j][i] = matrix[i][j]
//            }
//        }
//        return res
//    }
//}

// Iterative
class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var m = matrix.count, n = matrix[0].count
        var direction = 1
        var i = 0, j = -1
        var res = [Int]()
        while m*n > 0 {
            for _ in 0..<n {
                j += direction
                res.append(matrix[i][j])
                
            }
            m-=1
            for _ in 0..<m {
                i += direction
                res.append(matrix[i][j])
            }
            n-=1
            
            direction = -direction
        }
        return res
    }
    

}

let matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
print(Solution().spiralOrder(matrix))
