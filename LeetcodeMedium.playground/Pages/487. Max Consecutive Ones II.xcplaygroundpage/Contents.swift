class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var left = 0
        var zeroCount = 0
        var ans = 0
        for right in 0..<nums.count {
            if nums[right] == 0 {
                zeroCount += 1
            }
            while zeroCount > 1, left<nums.count {
                left += 1
                if nums[left-1] == 0 {
                    zeroCount -= 1
                }
            }
            ans = max(ans, right - left + 1)
        }
        return ans
    }
}
