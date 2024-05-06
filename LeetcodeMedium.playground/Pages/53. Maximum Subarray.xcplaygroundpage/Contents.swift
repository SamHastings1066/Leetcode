class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxi = nums[0], curr = nums[0]
        for i in 1..<nums.count {
            curr = max(curr, 0) + nums[i]
            maxi = max(maxi, curr)
        }
        return maxi
    }
}

var nums = [-2,-1]

print(Solution().maxSubArray(nums))
