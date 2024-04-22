// Two sum, sorted
//class Solution {
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//        var ans = [[Int]]()
//        var nums = nums.sorted()
//        for i in 0..<nums.count {
//            if nums[i] > 0 { break }
//            if i == 0 || nums[i] != nums[i - 1] {
//                twoSum(target: nums[i], nums: Array(nums[(i+1..<nums.count)]), ans: &ans)
//            }
//        }
//        return ans
//    }
//    
//    func twoSum(target: Int, nums: [Int], ans: inout [[Int]]) {
//        var seen = Set<Int>()
//        var j = 0
//        while j < nums.count {
//            let complement = -target - nums[j]
//            if seen.contains(complement) {
//                ans.append([target, nums[j], complement])
//                while j+1<nums.count, nums[j] == nums[j+1] {
//                    j+=1
//                }
//            }
//            seen.insert(nums[j])
//            j+=1
//        }
//    }
//}

// HastSet, no sorting
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var ans = Set<[Int]>()
        for i in 0..<nums.count {
            var seen = Set<Int>()
            for j in i+1..<nums.count {
                let complement = -nums[i] - nums[j]
                if seen.contains(complement) {
                    ans.insert([nums[i], nums[j], complement].sorted())
                }
                seen.insert(nums[j])
            }
        }
        return Array(ans)
    }
}

print(Solution().threeSum([-1,0,1,2,-1,-4]))
