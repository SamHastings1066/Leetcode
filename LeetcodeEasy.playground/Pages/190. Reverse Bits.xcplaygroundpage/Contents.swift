class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = n
        var result = 0
        for power in 0..<32 {
            result += (n & 1)
            n = n >> 1
            if power < 31 {
                result = result << 1
            }
        }
        return result
    }
}
print(Solution().reverseBits(43261596))
