// Hash Map
//class Solution {
//    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//        var nums1Count = [Int:Int]()
//        for num in nums1 {
//            nums1Count[num, default: 0] += 1
//        }
//        var result = [Int]()
//        for num in nums2 {
//            if let count = nums1Count[num], count > 0 {
//                result.append(num)
//                nums1Count[num]! -= 1
//            }
//        }
//        return result
//    }
//}

// Sorting
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums1 = nums1.sorted()
        var nums2 = nums2.sorted()
        var result = [Int]()
        var i = 0
        var j = 0
        while i < nums1.count, j < nums2.count {
            if nums1[i] == nums2[j] {
                result.append(nums1[i])
                i+=1
                j+=1
            } else if nums1[i] < nums2[j] {
                i+=1
            } else {
                j += 1
            }
        }
        return result
    }
}

var nums1: [Int] = [9,4,9,8,4]
var nums2: [Int] = [4,9,5]
print(Solution().intersect(nums1, nums2))
