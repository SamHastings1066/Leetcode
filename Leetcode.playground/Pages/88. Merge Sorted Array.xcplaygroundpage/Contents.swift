class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        // Step 1: replace the last n elements of nums1 with nums2
        for i in 0..<n {
            nums1[m+i] = nums2[i]
        }
        //nums1.replaceSubrange(m..<m+n, with: nums2)
        
        // Step 2: sort nums1 using one of the sorting algorithms I know
        
    }
}

var nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
let solution = Solution()
solution.merge(&nums1, m, nums2, n)
print(nums1)
