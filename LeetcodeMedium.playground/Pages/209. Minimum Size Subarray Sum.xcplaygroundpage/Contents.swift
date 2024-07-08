class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var sum = 0, ans = [Int](), left = 0, right = 0
        
        while right < nums.count {
            sum += nums[right]
            while sum >= target {
                ans.append(right - left + 1)
                sum -= nums[left]
                left += 1
            }
            right += 1
        }
        return ans.min() ?? 0
    }
}


let nums = [12,28,83,4,25,26,25,2,25,25,25,12], target = 213

print (Solution().minSubArrayLen(target, nums))
