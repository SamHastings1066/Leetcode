// Top Down - Recursive using memoization
//class Solution {
//    func deleteAndEarn(_ nums: [Int]) -> Int {
//        var numCounts = [Int:Int]()
//        var maxNum = 0
//        for num in nums {
//            numCounts[num, default: 0] += num
//            maxNum = max(maxNum, num)
//        }
//        var memo = [0:0, 1: numCounts[1] ?? 0]
//
//        return maxPoints(maxNum)
//
//        func maxPoints(_ n: Int) -> Int {
//            if let ans = memo[n] { return ans }
//            let ans = max(maxPoints(n - 1), maxPoints(n-2) + (numCounts[n] ?? 0))
//            memo[n] = ans
//            return ans
//        }
//    }
//}

// Bottom Up - Iterative using memoization
class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var numCounts = [Int:Int]()
        var maxNum = 0
        for num in nums {
            numCounts[num, default: 0] += num
            maxNum = max(maxNum, num)
        }
        var maxPoints = [0, numCounts[1] ?? 0]
        if maxNum > 1 {
            for i in 2...maxNum {
                maxPoints.append(max(maxPoints[i - 1], maxPoints[i-2] + (numCounts[i] ?? 0)))
            }
        }
        return maxPoints[maxNum]
    }
}
