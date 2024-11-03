// My approach
//class Solution {
//    func findPeakElement(_ nums: [Int]) -> Int {
//        let n = nums.count
//        if n == 1 { return 0}
//        
//        var l = 0
//        var r = n - 1
//        
//        while l <= r {
//            let mid = l + (r-l)/2
//            let midVal = nums[mid]
//            if mid == 0 {
//                if midVal > nums[1] {
//                    return 0
//                } else {
//                    return 1
//                }
//            }
//            if mid == n-1 {
//                if midVal > nums[n-2] {
//                    return n-1
//                } else {
//                    return n-2
//                }
//            }
//            if midVal > nums[mid-1] && midVal > nums[mid + 1] {
//                return mid
//            } else if midVal < nums[mid - 1] {
//                // search left subarray
//                r = mid - 1
//            } else {
//                // search right subarray
//                l = mid + 1
//            }
//        }
//        return l
//    }
//}

//More elegant implementation
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1
        
        while l < r {
            let mid = (l+r)/2
            if nums[mid] > nums[mid + 1] {
                // search left sub array
                r = mid
            } else {
                l = mid + 1
            }
        }  
        return l
    }
}

let nums = [3,4,3,2,1]

print (Solution().findPeakElement(nums))
