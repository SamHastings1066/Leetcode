class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var num0s = 0
        var ans = 0
        var left = 0
        for right in 0..<nums.count {
            if nums[right] == 0 {
                num0s += 1
            }
            while num0s > k {
                left += 1
                if nums[left-1] == 0 {
                    num0s -= 1
                }
            }
            ans = max(ans, right-left+1)
        }
        return ans
    }
}
