class Solution {
    
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 2 else { return min(height[0], height[1])}
        var left = 0, right = height.count - 1, ans = 0
        
        while left < right {
            ans = max(ans, (right - left) * min(height[left], height[right]))
            height[left] < height[right] ? (left += 1) : (right -= 1)
        }
        return ans
    }
}

print(Solution().maxArea([4,3,2,1,4]))
