class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var sum = 0.0
        for i in 0..<k {
            sum += Double(nums[i])
        }
        var ans = sum
        for i in k..<nums.count {
            sum += Double(nums[i] - nums[i-k])
            ans = max(ans, sum)
        }
        return ans / Double(k)
    }
}
