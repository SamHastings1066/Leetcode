// Two loops
//class Solution {
//    func lengthOfLastWord(_ s: String) -> Int {
//        let s = Array(s)
//        var i = s.count-1
//        while i >= 0 && s[i] == " " {
//            i -= 1
//        }
//        let end = i
//        while i >= 0 && s[i] != " "  {
//            i -= 1
//        }
//        return end - i
//    }
//}

// Using reversed
class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var ans = 0
        for c in s.reversed() {
            if c != " " { ans += 1}
            else if ans > 0 { return ans }
        }
        return ans
    }
}

var s = "a"
print(Solution().lengthOfLastWord(s))
