class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var n = nums.count
        return (n*(n+1))/2 - nums.reduce(0, +)
    }
}

var nums = [9,6,4,2,3,5,7,0,1]
print(Solution().missingNumber(nums))
