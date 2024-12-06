// Solution using position of zeros
//class Solution {
//    func canJump(_ nums: [Int]) -> Bool {
//        var maxi = 0
//        for (idx, num) in nums[0..<nums.count-1].enumerated() {
//            if num == 0 {
//                if maxi <= idx {
//                    return false
//                }
//            }
//            maxi = max(maxi, idx + num)
//        }
//        return true
//    }
//}

// Greedy
// Solution using position of zeros
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var lastPos = nums.count-1
        for i in stride(from: nums.count-1, through: 0, by: -1) {
            if i + nums[i] >= lastPos {
                lastPos = i
            }
        }
        return lastPos == 0
    }
}

// Same as above, maybe easier to read?
//class Solution {
//    func canJump(_ nums: [Int]) -> Bool {
//        var end = nums.count - 1
//        for start in (0..<nums.count-1).reversed() {
//            if start + nums[start] >= end {
//                end = start
//            }
//        }
//        return end == 0
//    }
//}

//var nums = [3,2,1,0,4]
var nums = [2,3,1,1,4]

print(Solution().canJump(nums))
