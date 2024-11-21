// First attempt
//class Solution {
//    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
//        var lastMax = Int.max
//        var maxList = [Int]()
//        var currMax = Int.min
//        for _ in 0..<k {
//            currMax = Int.min
//            for num in nums {
//                if num == lastMax {
//                    maxList.append(num)
//                }
//                if num > currMax && num < lastMax {
//                    currMax = num
//                }
//            }
//            lastMax = currMax
//        }
//        maxList.append(currMax)
//        return maxList[k-1]
//    }
//}

// Using Heap data structure


print(Solution().findKthLargest(nums, k))
