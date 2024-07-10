class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var longestStreak = 0
        var nums = Set(nums)
        
        for num in nums {
            if !nums.contains(num-1) {
                var currentStreak = 1
                var currentNum = num
                
                while nums.contains(currentNum+1){
                    currentNum += 1
                    currentStreak += 1
                }
                longestStreak = max(longestStreak, currentStreak)
            }
        }
        return longestStreak
    }
}

var nums = [0,3,7,2,5,8,4,6,0,1]

print(Solution().longestConsecutive(nums))
