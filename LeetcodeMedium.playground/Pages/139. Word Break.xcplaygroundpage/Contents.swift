class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let s = Array(s)
        var dp = Array(repeating: false, count: s.count)

        for i in 0..<s.count {
            for word in wordDict {
                if i >= word.count - 1 && (i == word.count - 1 || dp[i - word.count]) {
                    let start = i - word.count + 1
                    if String(s[start...i]) == word {
                        dp[i] = true
                        break
                    }
                }
            }
        }
        return dp[s.count-1]
    }
}
