// My first attempt
//class Solution {
//    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
//        var output = [[Int]]()
//        var path = [Int]()
//        backtrack()
//        return Set(output).map{$0}
//        
//        func backtrack() {
//            if path.reduce(0, +) > target {
//                return
//            } else if path.reduce(0, +) == target {
//                output.append(path.sorted())
//            }
//            for e in candidates {
//                path.append(e)
//                backtrack()
//                path.removeLast()
//            }
//        }
//    }
//}

// Better approach
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var output = [[Int]]()
        var path = [Int]()
        backtrack(&path, target, 0)
        return output
        
        func backtrack(_ path: inout [Int], _ t: Int, _ idx: Int) {
            if t < 0 { return }
            if t == 0 { output.append(path); return }
            for i in idx..<candidates.count {
                let e = candidates[i]
                path.append(e)
                backtrack(&path, t-e, i)
                path.removeLast()
            }
        }
    }
}
var arr = [1,2,3]
var n=1
print(arr[0..<n])


var candidates = [2,3,6,7], target = 7
print(Solution().combinationSum(candidates, target))
