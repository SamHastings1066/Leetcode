// Dynamic programming
//class Solution {
//    func longestPalindrome(_ s: String) -> String {
//        var s = Array(s)
//        var start = 0
//        var end = 0
//        var dp = [[Bool]](repeating: [Bool](repeating: true, count: s.count), count: s.count)
//        
//        for i in s.indices.reversed() {
//            for j in i+1..<s.count {
//                print(i,j)
//                dp[i][j] = s[i] == s[j] && dp[i+1][j-1]
//                if dp[i][j] && j-i > end-start {
//                    end = j
//                    start = i
//                }
//            }
//        }
//        return String(s[start...end])
//    }
//}

// Expand from centers
class Solution {
    func longestPalindrome(_ s: String) -> String {
        var s = Array(s)
        var start = 0
        var end = 0
        
        for i in s.indices {
            for j in 0...1 {
                var left = i
                var right = i + j
                while left >= 0, right < s.count, s[left] == s[right] {
                    left-=1
                    right+=1
                }
                left+=1
                right-=1
                if right-left > end-start {
                    end = right
                    start = left
                }
            }
        }
        
        return String(s[start...end])
    }
}

print(Solution().longestPalindrome("babad"))
