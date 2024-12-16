class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = Array(repeating: 1, count: n)
        for i in 1..<n {
            var addMax = 0
            var prevMax = 0
            for j in 0..<i {
                prevMax = max(prevMax, dp[j])
                if nums[j]<nums[i] {
                    dp[i] = max(dp[i], dp[j]+1)
                }
            }
        }
        return dp.max()!
    }
}
