// First approach: removing elements
//class Solution {
//    func removeDuplicates(_ nums: inout [Int]) -> Int {
//        var lastSeen: Int?
//        var twoSeen = false
//        var j = 0
//        for num in nums {
//            if lastSeen == num {
//                if twoSeen == true {
//                    nums.remove(at: j)
//                } else {
//                    twoSeen = true
//                    j+=1
//                }
//            } else {
//                lastSeen = num
//                twoSeen = false
//                j+=1
//            }
//        }
//        return nums.count
//    }
//}

// Two pointers
//class Solution {
//    func removeDuplicates(_ nums: inout [Int]) -> Int {
//        var lastSeen: Int?
//        var twoSeen = false
//        var j = 0
//        for i in 0..<nums.count {
//            if lastSeen == nums[i] {
//                if twoSeen == false {
//                    twoSeen = true
//                    nums[j] = nums[i]
//                    j+=1
//                }
//            } else {
//                lastSeen = nums[i]
//                twoSeen = false
//                nums[j] = nums[i]
//                j+=1
//            }
//        }
//        return j
//    }
//}

// Easier to follow:
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count>1 else { return nums.count }
        var numDups = 0
        var insertIndex = 1
        for i in 1..<nums.count {
            if nums[i] == nums[i-1] {
                numDups += 1
            } else {
                numDups = 0
            }
            if numDups < 2 {
                nums[insertIndex] = nums[i]
                insertIndex+=1
            }
        }
        return insertIndex
    }
}



var nums = [1,1,1,2,2,3]
print(Solution().removeDuplicates(&nums))
print(nums)



