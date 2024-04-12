// My soluton
//class Solution {
//    func singleNumber(_ nums: [Int]) -> Int {
//        let nums = nums.sorted()
//        for i in stride(from: 0, to: nums.count - 2, by: 2) {
//            if nums[i] != nums[i+1] {
//                return nums[i]
//            }
//        }
//        return nums.last!
//    }
//}

//Analytical solution
//class Solution {
//    func singleNumber(_ nums: [Int]) -> Int {
//        return 2*(Set(nums).reduce(0,+)) - nums.reduce(0,+)
//    }
//}

// Hash table solution

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict: [Int:Int] = [:]
        for num in nums {
            dict[num, default: 0] += 1
        }
        for (key, value) in dict {
            if value == 1 {
                return key
            }
        }
        return -1
    }
}


// Using XOR
//class Solution {
//    func singleNumber(_ nums: [Int]) -> Int {
//        var ans = 0
//        for num in nums {
//            ans ^= num
//        }
//        return ans
//    }
//}



let nums1 = [2,2,1]
let nums2 = [4,1,2,1,2]
let nums3 = [1]
let solution = Solution()
print(solution.singleNumber(nums1))
print(solution.singleNumber(nums2))
print(solution.singleNumber(nums3))
