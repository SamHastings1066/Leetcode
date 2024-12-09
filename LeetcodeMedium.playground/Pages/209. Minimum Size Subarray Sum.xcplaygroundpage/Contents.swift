// First
//class Solution {
//    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
//        var sum = 0, ans = [Int](), left = 0, right = 0
//        
//        while right < nums.count {
//            sum += nums[right]
//            while sum >= target {
//                ans.append(right - left + 1)
//                sum -= nums[left]
//                left += 1
//            }
//            right += 1
//        }
//        return ans.min() ?? 0
//    }
//}

// Better, since uses O(1)
class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var ans = Int.max
        var subSum = 0
        var l = 0
        for r in 0..<nums.count {
            subSum += nums[r]
            while subSum >= target {
                ans = min(ans, r - l + 1)
                subSum -= nums[l]
                l+=1
            }
        }
        return ans == Int.max ? 0 : ans
    }
}

let nums = [12,28,83,4,25,26,25,2,25,25,25,12], target = 213

print (Solution().minSubArrayLen(target, nums))
