class Solution {
    func maximumScore(_ nums: [Int], _ multipliers: [Int]) -> Int {
        let n = nums.count
        let m = multipliers.count
        var memo = Array(repeating: Array(repeating: 0, count: m), count: m)

        return dp(0,0)

        func dp(_ i: Int, _ l: Int) -> Int {
            if i == m { return 0 }
            let mult = multipliers[i]
            let r = n - 1 - i + l
            if memo[i][l] == 0 {
                memo[i][l] = max(mult*nums[l] + dp(i+1, l+1), mult*nums[r] + dp(i+1,l))
            }
            return memo[i][l]
        }
    }
}
