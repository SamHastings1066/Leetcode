// Memoization - top down, recursive
//class Solution {
//    var memo = [Int:Int]()
//    func minCostClimbingStairs(_ cost: [Int]) -> Int {
//        return minCost(cost.count)
//
//        func minCost(_ i: Int) -> Int {
//            if let res = memo[i] { return res }
//            if i < 2 {
//                memo[i] = 0
//                return memo[i]!
//            }
//            let res = min(minCost(i-1) + cost[i-1], minCost(i-2) + cost[i-2])
//            memo[i] = res
//            return memo[i]!
//        }
//    }
//}

// Bottom Up - iterative
class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var minCost = Array(repeating: 0, count: cost.count+1)
        for i in 2...cost.count {
            minCost[i] = min(minCost[i-1] + cost[i-1], minCost[i-2] + cost[i-2])
        }
        return minCost[cost.count]
    }
}

import XCTest
class TestSolution: XCTestCase {
    func test_callingSolution_shouldReturn15() {
        let cost = [10,15,20]
        XCTAssertEqual(Solution().minCostClimbingStairs(cost), 15)
    }
}

TestSolution.defaultTestSuite.run()
