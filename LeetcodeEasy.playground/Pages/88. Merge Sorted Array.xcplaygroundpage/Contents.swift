//class Solution {
//    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
//        // Step 1: replace the last n elements of nums1 with nums2
//        for i in 0..<n {
//            nums1[m+i] = nums2[i]
//        }
//
//        guard nums1.count>1 else {return}
//        for j in (1..<nums1.count).reversed() {
//
//            for i in 0..<j {
//                var left = i
//                var right = i+1
//                if nums1[left] > nums1[right] {
//                    (nums1[left], nums1[right]) = (nums1[right], nums1[left])
//                    left = i
//                }
//            }
//        }
//
//    }
//}

// Approach 2: three pointers

//class Solution {
//    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
//        let nums1Values = nums1[0..<m]
//        var p1 = 0
//        var p2 = 0
//        for p in 0..<n+m {
//            if p2>=n || (p1<m && nums1Values[p1] <= nums2[p2]) {
//                nums1[p] = nums1Values[p1]
//                p1+=1
//            } else {
//                nums1[p] = nums2[p2]
//                p2+=1
//            }
//        }
//    }
//}

// Approach 3: Three pointers - start from the end
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        for p in (0..<n + m).reversed() {
            if p1 >= 0 && (p2 < 0 || nums1[p1] >= nums2[p2]) {
                nums1[p] = nums1[p1]
                p1 -= 1
            } else {
                nums1[p] = nums2[p2]
                p2 -= 1
            }
        }
    }
}

var nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
//var nums1 = [1], m = 1, nums2 = [Int](), n = 0
//var nums1 = [0], m = 0, nums2 = [1], n = 1
//var nums1 = [2,0], m = 1, nums2 = [1], n = 1
let solution = Solution()
//print(2)
solution.merge(&nums1, m, nums2, n)
print(nums1)
