// First solution
//class Solution {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        var s = Array(s.lowercased())
//        var substring = [Character]()
//        var result = 0
//        for char in s {
//            //print(substring)
//            let index = substring.firstIndex {$0 == char}
//            if let index = index {
//                substring = Array(substring[index+1..<substring.count])
//            }
//            substring.append(char)
//            result = max(result, substring.count)
//        }
//        return result
//    }
//}

// Sliding window with has map
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var s = Array(s)
        var left = 0
        var right = 0
        var result = 0
        var charIndex = [Character:Int]()
        while right < s.count {
            var char = s[right]
            if let index = charIndex[char], index >= left, index < right {
                left = index + 1
            }
            result = max(result, right - left + 1)
            charIndex[char] = right
            right += 1
            
        }
        
        return result
    }
}

print(Solution().lengthOfLongestSubstring("abcabcbb"))

