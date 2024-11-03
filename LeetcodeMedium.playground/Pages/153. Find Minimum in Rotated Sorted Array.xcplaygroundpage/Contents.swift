class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1
        while l<r {
            let mid = (l+r)/2
            if nums[l] > nums[r] {
                if nums[mid] > nums[r] {
                    // search right
                    l = mid + 1
                } else {
                    r = mid
                }
            } else {
                return nums[l]
            }
        }
        return nums[l]
    }
}

let nums = [3,1,2]
print("yes")

print(Solution().findMin(nums))
