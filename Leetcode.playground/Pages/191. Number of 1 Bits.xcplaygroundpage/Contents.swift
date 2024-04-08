class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        var result = 0
        for _ in 0..<32 {
            result += n & 1
            n = n >> 1
        }
        return result
    }
}

print(Solution().hammingWeight(2147483645))
