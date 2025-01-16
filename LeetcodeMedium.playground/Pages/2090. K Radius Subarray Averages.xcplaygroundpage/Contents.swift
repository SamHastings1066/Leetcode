// First approach:
// Time: O(n), space: O(n)
//class Solution {
//    func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
//        let n = nums.count
//        var prefixSums = Array(repeating: 0, count: n)
//        prefixSums[0] = nums[0]
//        for i in 1..<n {
//            prefixSums[i] = prefixSums[i-1] + nums[i]
//        }
//
//        var ans = Array(repeating: -1, count: n)
//        let subLength = (2 * k) + 1
//        if n >= subLength {
//            for i in k..<n-k {
//                let start = i-k
//                let end = i+k
//                if start == 0 {
//                    ans[i] = prefixSums[end] / subLength
//                } else {
//                    ans[i] = (prefixSums[end] - prefixSums[start-1]) / subLength
//                }
//            }
//        }
//        return ans
//    }
//}


// Same approach and efficieny, slightly neater implementation with edge case checks as early as possible.
class Solution {
    func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
        if k == 0 { return nums } // edge case
        let subLength = (2 * k) + 1
        let n = nums.count
        var ans = Array(repeating: -1, count: n)
        if n < subLength { return ans } // edge case

        var prefixSums = Array(repeating: 0, count: n+1)
        for i in 1...n {
            prefixSums[i] = prefixSums[i-1] + nums[i-1]
        }

        for i in k..<n-k {
            let start = i-k
            let end = i+k
            ans[i] = (prefixSums[end+1] - prefixSums[start]) / subLength
        }
        return ans
    }
}
