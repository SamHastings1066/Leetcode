class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var p1 = 0
        var p2 = nums.count - 1
        var ans = Array(repeating:0, count: nums.count)
        for i in (0..<nums.count).reversed() {
            if abs(nums[p1]) <= abs(nums[p2]) {
                ans[i] = nums[p2]*nums[p2]
                p2-=1
            } else {
                ans[i] = nums[p1]*nums[p1]
                p1+=1
            }
        }
        return ans
    }
}
