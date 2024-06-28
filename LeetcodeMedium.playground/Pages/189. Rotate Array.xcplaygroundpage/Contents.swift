// First attempt
//class Solution {
//    func rotate(_ nums: inout [Int], _ k: Int) {
//        var k = k % nums.count
//        var res = [Int]()
//        let n = nums.count - k
//        for _ in 0..<k {
//            res.append(nums.remove(at: n))
//        }
//        res.append(contentsOf: nums)
//        nums = res
//    }
//}

//Second attempt: O(1) space
//class Solution {
//    func rotate(_ nums: inout [Int], _ k: Int) {
//        var k = k % nums.count
//        for _ in 0..<k {
//            nums.insert(nums.removeLast(), at: 0)
//        }
//    }
//}


// Editorial O(1) space
//class Solution {
//    func rotate(_ nums: inout [Int], _ k: Int) {
//        var k = k % nums.count
//        for i in 0..<k {
//            var previous = nums.last!
//            for j in 0..<nums.count {
//                (nums[j], previous) = (previous, nums[j])
//            }
//        }
//    }
//}

// Using reverse; O(1) space
class Solution {
    func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var start = start, end = end
        while start<end {
            (nums[start], nums[end]) = (nums[end], nums[start])
            start += 1; end -= 1
        }
    }
    func rotate(_ nums: inout [Int], _ k: Int) {
        var k = k % nums.count
        reverse(&nums, 0, nums.count-1)
        reverse(&nums, 0, k-1)
        reverse(&nums, k, nums.count-1)
    }
}

var nums = [1,2,3,4,5,6,7]
var k = 3

Solution().rotate(&nums, k)
print(nums)
