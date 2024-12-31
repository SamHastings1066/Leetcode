class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var prefixSums = [0:1]
        var sumSoFar = 0
        var count = 0
        for num in nums {
            sumSoFar += num
            let complement = sumSoFar - k
            count += prefixSums[complement, default: 0]
            prefixSums[sumSoFar, default: 0] += 1
        }
        return count
    }
}

let nums = [1,2,3], k = 3

print(Solution().subarraySum(nums, k))
