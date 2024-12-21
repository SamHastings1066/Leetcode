/*
brute force
three nested loops
for i in 0..<n {
    for j in i+1..<n {
        for k in j+1..<n {
            if nums[i]< nums[j]< nums[k] { return true}
        }
    }
}
return false

time O(n^3)
space O(1)

better approach
sweep through array
keep track of two vars smallest secondSmallest

*/

class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        let n = nums.count
        guard n > 2 else { return false }
        var smallest = Int.max
        var secondSmallest = Int.max
        for num in nums {
            if num <= smallest {
                smallest = num
            } else if num <= secondSmallest {
                secondSmallest = num
            } else if num > secondSmallest {
                return true
            }
        }
        return false
    }
}
