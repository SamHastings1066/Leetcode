class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0
        var reps = 0
        
        while reps < nums.count {
            if nums[i] == 0 {
                nums.remove(at: i)
                nums.append(0)
            } else {
                i += 1
            }
            reps += 1
        }
    }
}


var nums = [0,0,1]
Solution().moveZeroes(&nums)
print(nums)
