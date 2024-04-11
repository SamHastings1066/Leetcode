class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var s = Array(s.lowercased())
        var counts = [Character: Int]()
        for char in s {
            counts[char, default: 0] += 1
        }
        for i in s.indices {
            if counts[s[i]] == 1 { return i }
        }
        return -1
    }
}

var s = "aabb"
print(Solution().firstUniqChar(s))
