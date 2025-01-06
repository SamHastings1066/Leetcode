// First solution
// Time: O(n); Space: O(k)
//class Solution {
//    func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
//        var curr = 0
//        var seen = [Int:Int]()
//        var ans = 0
//        for i in 0..<k {
//            seen[nums[i], default:0] += 1
//            curr += nums[i]
//        }
//        if seen.count == k {
//            ans = curr
//        }
//        for i in k..<nums.count {
//            if seen[nums[i-k]]! == 1 {
//                seen[nums[i-k]] = nil
//            } else {
//                seen[nums[i-k]]! -= 1
//            }
//            seen[nums[i], default: 0] += 1
//            curr -= nums[i-k]
//            curr += nums[i]
//            if seen.count == k {
//                ans = max(ans,curr)
//            }
//        }
//        return ans
//    }
//}

// Use sliding window and hashmap to keep track of the index of the last occurence of the current number at the end of the window.
// Time: O(n); Space: O(k)
class Solution {
    func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        var currSum = 0
        var numToIdx = [Int:Int]()
        var ans = 0
        var begin = 0
        var end = 0
        while end < nums.count {
            let currNum = nums[end]
            let lastOccurence = numToIdx[currNum] ?? -1

            while lastOccurence >= begin || end - begin + 1 > k {
                currSum -= nums[begin]
                begin += 1
            }

            numToIdx[currNum] = end
            currSum += currNum
            
            if end - begin + 1 == k {
                ans = max(ans, currSum)
            }
            
            end += 1
        }
        return ans
    }
}
