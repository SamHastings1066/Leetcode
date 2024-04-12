// My First solution
//class Solution {
//    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [[Int]] {
//        var ans = [[Int]]()
//        var complement = Array(lower...upper).filter { !nums.contains($0)
//        }
//        
//        
//        var subrange: [Int] = []
//        for index in complement.indices {
//            if subrange.isEmpty {
//                subrange.append(complement[index])
//            }
//            if index + 1 < complement.count {
//                if complement[index + 1] != complement[index] + 1 {
//                    subrange.append(complement[index])
//                    ans.append(subrange)
//                    subrange = []
//                }
//            } else {
//                if !subrange.isEmpty {
//                    subrange.append(complement[index])
//                    ans.append(subrange)
//                }
//            }
//        }
//        
//        return ans
//    }
//}

class Solution {
    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [[Int]] {
        guard !nums.isEmpty else {return [[lower,upper]]}
        var ans = [[Int]]()
        let n = nums.count
        if nums[0] != lower {
            ans.append([lower, nums[0]-1])
        }
        for i in 0..<n-1 {
            if nums[i+1] - nums[i] > 1 {
                ans.append([nums[i]+1, nums[i+1]-1])
            }
        }
        if nums[n-1] != upper {
            ans.append([nums[n-1]+1, upper])
        }
       
        return ans
    }
}

let nums = [1000000000], lower = 0, upper = 1000000000

let solution = Solution()
print(solution.findMissingRanges(nums, lower, upper))

