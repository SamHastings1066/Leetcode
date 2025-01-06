class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        guard k > 1 else {return 0}
        var product = 1
        var left = 0
        var ans = 0
        for right in 0..<nums.count {
            product *= nums[right]
            while product >= k {
                left += 1
                product /= nums[left-1]
            }
            ans += right - left + 1
        }
        return ans
    }
}
