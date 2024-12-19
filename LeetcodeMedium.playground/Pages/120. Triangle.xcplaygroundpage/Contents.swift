/*
 Likely a Dp problem because
 i) minimum
 ii) previous decisions (about path) affect future decisions.

 1. Function representing answer to problem at given state:

 dp(i,j) := minimum sum from triangle [i,j] to bottom

 2. Transition between states

 dp(i,j) = min (dp(i+1,j), dp(i+1, j+1)) + triangle(I,j)

 3. Base case

 dp(n-1,j) = triangle[n-1][j] where n = triangle.count
*/

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        let m = triangle[n-1].count
        var memo = Array(repeating: Array(repeating: -1, count: m), count: n)
        return dp(0,0)
        
        func dp(_ i: Int, _ j: Int) -> Int {
            if i == n-1 {
                return triangle[n-1][j]
            }
            if memo[i][j] == -1 {
                memo[i][j] = triangle [i][j] + min(dp(i+1,j), dp(i+1, j+1))
            }
            return memo[i][j]
        }
    }
}


