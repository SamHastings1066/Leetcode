class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {return false}
        var s = Array(s.lowercased())
        var t = Array(t.lowercased())
        var sCount = [Character:Int]()
        for letter in s {
            sCount[letter, default: 0] += 1
        }
        for letter in t {
            if let count = sCount[letter], count > 0 {
                sCount[letter, default: 0] -= 1
            } else {
                return false
            }
        }
        
        return true
    }
}

var s = "abba"
var t = "baab"

print(Solution().isAnagram(s, t))
