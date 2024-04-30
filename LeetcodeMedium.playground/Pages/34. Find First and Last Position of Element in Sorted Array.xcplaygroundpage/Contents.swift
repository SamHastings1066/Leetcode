// First solution
//class Solution {
//    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
//        
//        if nums == [] {return [-1, -1]}
//        var leftBoundary = -1
//        var rightBoundary = -1
//        
//        var l = 0
//        var r = nums.count - 1
//        if nums[l] == target { leftBoundary = l } else {
//            l+=1
//            while l<=r {
//                let m = l + ((r-l)/2)
//                if nums[m] == target, nums[m-1] != target {
//                    leftBoundary = m
//                    break
//                } else if nums[m]>=target {
//                    r = m-1
//                } else {
//                    l = m+1
//                }
//            }
//        }
//        l = 0
//        r = nums.count - 1
//        if nums[r] == target { rightBoundary = r } else {
//            r-=1
//            while l<=r {
//                
//                let m = l + ((r-l)/2)
//                if nums[m] == target, nums[m+1] != target {
//                    rightBoundary = m
//                    break
//                } else if nums[m]>target {
//                    r = m-1
//                } else {
//                    l = m+1
//                }
//            }
//        }
//        return [leftBoundary, rightBoundary]
//        
//    }
//}

// Cleaner solution
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let leftIndex = findBoundary(l: 0, r: nums.count-1, isFirst: true)
        let rightIndex = findBoundary(l: 0, r: nums.count-1, isFirst: false)
        return [leftIndex, rightIndex]
        
        func findBoundary(l: Int, r: Int, isFirst: Bool) -> Int {
            var l = l, r = r
            while l<=r {
                let m = l + ((r-l)/2)
                if nums[m] == target {
                    if isFirst {
                        if m==l { return m }
                        if nums[m-1] != target { return m}
                        r = m-1
                    } else {
                        if m==r { return m }
                        if nums[m+1] != target { return m}
                        l = m+1
                    }
                } else if nums[m] > target {
                    r = m-1
                } else {
                    l = m+1
                }
            }
            return -1
        }
    }
}

let nums:[Int] = [5,7,7,8,8,10]
let target = 8
print(Solution().searchRange(nums, target))
