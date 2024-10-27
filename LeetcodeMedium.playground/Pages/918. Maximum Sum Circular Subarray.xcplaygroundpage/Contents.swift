// First brute force
//class Solution {
//    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
//        let n = nums.count
//        
//        var ans = Int.min
//        
//        for start in 0..<n {
//            for end in start+1...start + n {
//                let currSum = numsSum(start, end)
//                //print("start: \(start), end: \(end), currSum: \(currSum)")
//                ans = max(ans, currSum)
//            }
//        }
//        
//        return ans
//        
//        func numsSum(_ start: Int, _ end: Int) -> Int {
//            var sum = 0
//            if end >= n {
//                sum = nums[start..<n].reduce(0,+)
//                sum += nums[0..<end % n].reduce(0,+)
//            } else {
//                sum = nums[start..<end].reduce(0,+)
//            }
//            return sum
//        }
//    }
//}

class Solution {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        let n = nums.count
        var suffixSum = nums[n-1]
        var righMax = Array(repeating: 0, count: n)
        righMax[n-1] = nums[n-1]
        
        for i in (0..<n-1).reversed() {
            suffixSum += nums[i]
            righMax[i] = max(righMax[i+1], suffixSum)
        }
        
        var prefixSum = 0
        var specialSum = nums[0]
        var currMax = 0
        var maxSum = nums[0]
        for i in 0..<n {
            prefixSum += nums[i]
            currMax = max(currMax, 0) + nums[i]
            maxSum = max(maxSum, currMax)
            if i < n-1 {
                specialSum = max(prefixSum + righMax[i+1], specialSum)
            }
        }
        return max(maxSum, specialSum)
    }
}


var nums = [-3,-2,-3]

print(Solution().maxSubarraySumCircular(nums))
