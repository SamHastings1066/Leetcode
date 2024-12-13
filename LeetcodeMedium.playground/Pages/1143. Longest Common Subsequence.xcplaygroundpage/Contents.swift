// Top Down, memoization
// Time: O(m*n^2); Space: O(m*n)
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let m = text1.count
        let n = text2.count
        let text1 = Array(text1)
        let text2 = Array(text2)
        var memo = Array(repeating: Array(repeating: -1, count: n), count: m)
        return dp(0,0)

        func dp(_ p1: Int, _ p2: Int) -> Int {
            if p1 == m || p2 == n { return 0 }
            if text1[p1] == text2[p2] { return 1 + dp(p1 + 1, p2 + 1)}
            if memo[p1][p2] == -1 {
                memo[p1][p2] = max(dp(p1+1, p2),dp(p1, p2+1))
            }
            return memo[p1][p2]
        }
    }
}
