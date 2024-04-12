// Swifty solution
//class Solution {
//    func isPalindrome(_ s: String) -> Bool {
//        var s = s.lowercased().filter{$0.isLetter || $0.isNumber}
//        return s == String(s.reversed())
//    }
//}

//class Solution {
//    func isPalindrome(_ s: String) -> Bool {
//        let s = Array(s)
//        var left = 0
//        var right = s.count - 1
//        
//        while left < right {
//            while !(s[left].isLetter || s[left].isNumber) {
//                left += 1
//                if left>right { return true }
//            }
//            while !(s[right].isLetter || s[right].isNumber) {
//                right -= 1
//                if left>right { return true }
//            }
//            if s[left].lowercased() != s[right].lowercased() { return false}
//            left += 1
//            right -= 1
//        }
//        return true
//    }
//}

// Best answer
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        guard !s.isEmpty else {return true}
        let s = Array(s.lowercased())
        var l = 0
        var r = s.count - 1
        while l<=r {
            if !(s[l].isLetter || s[l].isNumber) {l+=1; continue}
            if !(s[r].isLetter || s[r].isNumber) {r-=1; continue}
            guard s[l]==s[r] else {return false}
            l+=1
            r-=1
        }
        return true
    }
}


let s = "A man, a plan, a canal: Panama"

let solution = Solution()
print(solution.isPalindrome(s))
