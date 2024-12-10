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

// Using array - cotains takes O(n) time
//class Solution {
//    func permute(_ nums: [Int]) -> [[Int]] {
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
//            for num in nums {
//                if !path.contains(num) {
//                    path.append(num)
//                    backtrack(path)
//                    path.removeLast()
//                }
//            }
//            
//        }
//    }
//}

// Using Set - .cotains takes O(1) time
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        var used = Set<Int>() // To track used elements
        backtrack([])
        return ans
        
        func backtrack(_ path: [Int]) {
            if path.count == nums.count {
                ans.append(path)
                return
            }
            for num in nums {
                if !used.contains(num) { // Constant-time check
                    used.insert(num)     // Mark as used
                    backtrack(path + [num]) // Append num to path
                    used.remove(num)     // Backtrack: unmark num
                }
            }
        }
    }
}
print(Solution().permute([1,2,3]))
