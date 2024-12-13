// Bottom up
// Time - O(n)
// Space - O(n)
//class Solution {
//    func tribonacci(_ n: Int) -> Int {
//        var tribNums = [0,1,1]
//        if n > 2 {
//            for i in 3...n {
//                tribNums.append(tribNums[i-1] + tribNums[i-2] + tribNums[i-3])
//            }
//        }
//        return tribNums[n]
//    }
//}

// Bottom up
// Time - O(n)
// Space - O(1)
class Solution {
    func tribonacci(_ n: Int) -> Int {
        if n<3 {
            return n > 0 ? 1 : 0
        }
        var a = 0, b = 1, c = 1
        for _ in 3...n {
            let res = a + b + c
            a = b
            b = c
            c = res
        }
        return c
    }
}
