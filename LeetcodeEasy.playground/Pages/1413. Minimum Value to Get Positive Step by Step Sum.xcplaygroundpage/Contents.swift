// Time: O(n); space: O(1)
class Solution {
    func minStartValue(_ nums: [Int]) -> Int {
        var prev = nums[0]
        var minPrev = nums[0]
        for i in 1..<nums.count {
            prev = prev + nums[i]
            minPrev = min(minPrev, prev)
        }
        return minPrev > 0 ? 1 : 1-minPrev
    }
}
