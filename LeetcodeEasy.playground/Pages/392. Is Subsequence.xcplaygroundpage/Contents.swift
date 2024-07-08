class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard !s.isEmpty else { return true }
        let s = Array(s)
        var i = 0
        for char in t {
            if char == s[i] {
                i += 1
            }
            if i == s.count { return true }
        }
        return false
    }
}

var s = "axc"
var t = "ahbgdc"

print(Solution().isSubsequence(s, t))
