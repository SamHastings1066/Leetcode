// Solution O(n^2) - because reduce is O(n), and it is inside the for loop
//class Solution {
//    func productExceptSelf(_ nums: [Int]) -> [Int] {
//        var res = [Int]()
//        for i in 0..<nums.count {
//            let arr = nums[..<i] + nums[(i+1)...]
//            res.append(arr.reduce(1,*))
//        }
//        return res
//    }
//}

// O(n) / O(n)
//class Solution {
//    func productExceptSelf(_ nums: [Int]) -> [Int] {
//        var res = [Int]()
//        var prefixSum = [1]
//        var suffixSum = [1]
//        for i in 0..<nums.count-1 {
//            prefixSum.append(prefixSum.last! * nums[i])
//            suffixSum.insert(suffixSum.first! * nums[nums.count-1-i], at: 0)
//        }
//        for i in 0..<nums.count {
//            res.append(prefixSum[i]*suffixSum[i])
//        }
//        return res
//    }
//}

// O(1) space
//class Solution {
//    func productExceptSelf(_ nums: [Int]) -> [Int] {
//        var res = [1]
//        for i in 0..<nums.count-1 {
//            res.append(res.last! * nums[i])
//        }
//        var right = 1
//        for i in stride(from: nums.count-1, through: 1, by: -1) {
//            right *= nums[i]
//            res[i-1] *= right
//        }
//        return res
//    }
//}

// 0(n) space, more readable solution
//class Solution {
//    func productExceptSelf(_ nums: [Int]) -> [Int] {
//        var prefix = Array(repeating: 1, count: nums.count)
//        var suffix = Array(repeating: 1, count: nums.count)
//        var res = Array(repeating: 1, count: nums.count)
//        
//        for i in 1..<nums.count {
//            prefix[i] = prefix[i-1] * nums[i-1]
//        }
//        
//        for i in (0..<nums.count-1).reversed() {
//            suffix[i] = suffix[i+1] * nums[i+1]
//        }
//        
//        for i in 0..<nums.count {
//            res[i] = suffix[i] * prefix[i]
//        }
//        
//        return res
//    }
//}

// 0(1) space, more readable solution
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var res = Array(repeating: 1, count: nums.count)
        
        for i in 1..<nums.count {
            res[i] = res[i-1] * nums[i-1]
        }
        
        var suffix = 1
        
        for i in (0..<nums.count).reversed() {
            res[i] *= suffix
            suffix *= nums[i]
        }
        return res
    }
}

var nums = [1,2,3,4]
print(Solution().productExceptSelf(nums))

