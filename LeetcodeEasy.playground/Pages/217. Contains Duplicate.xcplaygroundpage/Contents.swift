class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var seen = [Int:Int]()
        for num in nums {
            seen[num, default: 0] += 1
            if seen[num]! > 1 {return true}
        }
        return false
    }
}

var nums = [1,2,3,1]
print(Solution().containsDuplicate(nums))
