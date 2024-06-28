class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        for _ in 0..<nums.count {
            let curr = nums.removeFirst()
            if curr != val { nums.append(curr) }
        }
        return nums.count
    }
}

var nums = [3,2,2,3]
let val = 2
print(Solution().removeElement(&nums, val))
print(nums)
