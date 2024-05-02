// Firstb attempt: Backtracking
//class Solution {
//    func permute(_ nums: [Int]) -> [[Int]] {
//        var nums = Set(nums)
//        var ans = [[Int]]()
//        backtrack([])
//        return ans
//        
//        func backtrack(_ path: [Int]) {
//            var path = path
//            if path.count == nums.count {
//                ans.append(path)
//                return
//            }
//            
//            for next in nums.subtracting(Set(path)) {
//                path.append(next)
//                backtrack(path)
//                path.removeLast()
//            }
//            
//        }
//    }
//}

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        backtrack([])
        return ans
        
        func backtrack(_ path: [Int]) {
            var path = path
            if path.count == nums.count {
                ans.append(path)
                return
            }
            for num in nums {
                if !path.contains(num) {
                    path.append(num)
                    backtrack(path)
                    path.removeLast()
                }
            }
            
        }
    }
}

print(Solution().permute([1,2,3]))
