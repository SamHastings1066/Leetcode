class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        var maxLength = 0
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        for j in 0..<n {
            dp[m-1][j] = Int(String(matrix[m-1][j]))!
            maxLength = max(maxLength,dp[m-1][j])
        }
        for i in 0..<m {
            dp[i][n-1] = Int(String(matrix[i][n-1]))!
            maxLength = max(maxLength,dp[i][n-1])
        }
        for i in (0..<m-1).reversed() {
            for j in (0..<n-1).reversed() {
                if matrix[i][j] == "1" {
                    dp[i][j] = 1 + min(dp[i+1][j],dp[i][j+1],dp[i+1][j+1])
                    maxLength = max(maxLength,dp[i][j])
                }
            }
        }
        return maxLength*maxLength
    }
}

let matrix: [[Character]] = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]

print(Solution().maximalSquare(matrix))
