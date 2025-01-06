// First solution: O(n) time and space
class Solution {
    func waysToSplitArray(_ nums: [Int]) -> Int {
        var prefixes = Array(repeating: 0, count: nums.count)
        prefixes[0] = nums[0]
        for i in 1..<nums.count {
            prefixes[i] = nums[i] + prefixes[i-1]
        }
        var ans = 0
        for i in 0..<nums.count - 1 {
            let firstSum = prefixes[i]
            let secondSum = prefixes[nums.count-1] - firstSum
            if firstSum >= secondSum { ans += 1}
        }
        return ans
    }
}

// Second solution: O(n) time, O(1) space
class Solution {
    func waysToSplitArray(_ nums: [Int]) -> Int {
        var total = nums.reduce(0,+)
        var prevSum = 0
        var ans = 0
        for i in 0..<nums.count-1 {
            prevSum += nums[i]
            let rightSum = total - prevSum
            if prevSum >= rightSum {
                ans += 1
            }
        }
        return ans
    }
}
