// while loop
//func binarySearch(_ nums: [Int], _ target: Int) -> Int {
//    var l = 0
//    var r = nums.count - 1
//    var m = (l+r)/2
//    while l<=r {
//        if nums[m] == target { return m }
//        if nums[m] < target {
//            l = m + 1
//            m = (l+r)/2
//        } else {
//            r = m - 1
//            m = (l+r)/2
//        }
//    }
//    if l>=nums.count || l<0 {
//        return -1
//    } else {
//        return l
//    }
//}

// recursion
//func binarySearch(_ nums: [Int], _ target: Int) -> Int {
//    var l = 0
//    var r = nums.count - 1
//    func binaryHelper(_ l: Int, _ r: Int) -> Int {
//        if target < nums[l] || target > nums[r] {return -1}
//        var m = (l+r)/2
//        if nums[m] == target {
//            return m
//        }
//        if nums[m] < target {
//            return binaryHelper(m+1, r)
//        } else {
//            return binaryHelper(l, m-1)
//        }
//    }
//    return binaryHelper(l, r)
//}
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1
        return adjustedBinarySearch(l, r)
        func adjustedBinarySearch(_ l: Int, _ r: Int) -> Int {
            if r-l<2 {
                if nums[l] == target {return l}
                else if nums[r] == target {return r}
                else {return -1}
            }
            let m = l + ((r-l)/2)
            if nums[m] == target { return m }
            if nums[m-1] >= nums[l] { //left side is sorted
                if nums[m-1]>=target && nums[l]<=target {
                    return adjustedBinarySearch(l, m-1)
                } else {
                    return adjustedBinarySearch(m+1, r)
                }
            } else { //right side is sorted
                if nums[m+1]<=target && nums[r]>=target {
                    return adjustedBinarySearch(m+1, r)
                } else {
                    return adjustedBinarySearch(l, m-1)
                }
            }
        }
    }
}

let nums = [1,3], target = 3
print(Solution().search(nums, target))

