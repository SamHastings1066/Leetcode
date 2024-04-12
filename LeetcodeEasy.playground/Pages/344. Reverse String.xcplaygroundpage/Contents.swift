// While loop
//class Solution {
//    func reverseString(_ s: inout [Character]) {
//        guard !s.isEmpty else {return}
//        var left = 0
//        var right = s.count - 1
//        while left < right {
//            (s[left], s[right]) = (s[right], s[left])
//            left += 1
//            right -= 1
//        }
//    }
//}

// Recursive
class Solution {
    func reverseString(_ s: inout [Character]) {
        guard !s.isEmpty else {return}
        func helper(_ left: Int, _ right : Int) {
            if left < right {
                (s[left], s[right]) = (s[right], s[left])
                helper(left + 1, right - 1)
            }
        }
        helper(0, s.count-1)
    }
}

var s : [Character] = ["h","e","l","l","o"]
Solution().reverseString(&s)
print(s)

