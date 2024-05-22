// My approach
//class Solution {
//    func combine(_ n: Int, _ k: Int) -> [[Int]] {
//        
//        var res = [[Int]]()
//        
//        func backtrack(_ arr: [Int], _ path: [Int]) {
//            var path = path
//            var arr = arr
//            if path.count == k {
//                res.append(path)
//                return
//            }
//            
//            while arr.count>0 {
//                path.append(arr.removeFirst())
//                backtrack(arr, path)
//                path.removeLast()
//            }
//        }
//
//        backtrack(Array(1...n), [])
//        
//        return res
//        
//    }
//}

// Model answer
class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        
        var res = [[Int]]()
        
        func backtrack(_ firstNum: Int, _ path: [Int]) {
            var path = path
            if path.count == k {
                res.append(path)
                return
            }
            
            var need = k - path.count
            var remain = n - firstNum + 1
            var available = remain - need
            
            for i in firstNum...firstNum+available {
                path.append(i)
                
                backtrack(i+1, path)
                path.removeLast()
            }
        }
        
        backtrack(1, [])
        
        return res
        
    }
}

print(Solution().combine(13, 13))
