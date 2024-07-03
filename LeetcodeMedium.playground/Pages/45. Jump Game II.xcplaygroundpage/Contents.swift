// First attempt
//class Solution {
//    func jump(_ nums: [Int]) -> Int {
//        var n = nums.count
//        var moves = [Int]()
//        func minJump(_ move: Int, _ pos: Int) {
//            print(pos, n)
//            if pos >= n-1 {
//                moves.append(move)
//                return
//            }
//            for i in 0..<nums[pos] {
//                if pos + i + 1 < n {
//                    minJump(move + 1, pos + i + 1)
//                }
//            }
//        }
//        minJump(0, 0)
//        return moves.min() ?? 0
//    }
//}

// Greedy
class Solution {
    func jump(_ nums: [Int]) -> Int {
        var jumps = 0, end = 0, far = 0, n = nums.count
        for i in 0..<n-1 {
            far = max(far, nums[i] + i)
            if i == end {
                jumps += 1
                end = far
            }
        }
        return jumps
    }
}

var nums = [2,3,1,1,4]
print(Solution().jump(nums))
