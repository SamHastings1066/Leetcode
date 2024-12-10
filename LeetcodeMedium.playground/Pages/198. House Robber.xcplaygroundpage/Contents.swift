// Top down recursive
class Solution {
    func rob(_ nums: [Int]) -> Int {
        var memo = [Int:Int]()
        func dp(_ i: Int) -> Int {
            if i == 0 { return nums[0]}
            if i == 1 { return max(nums[0], nums[1])}
            if memo[i] == nil {
                memo[i] = max(dp(i-1), dp(i-2)+nums[i])
            }
            return memo[i]!
        }
        return dp(nums.count - 1)
    }
}
