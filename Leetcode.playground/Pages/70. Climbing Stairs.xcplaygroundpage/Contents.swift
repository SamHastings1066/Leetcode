// My solution - the best one!
//class Solution {
//
//    private func quickBinomialCoefficient(_ n: Int, choose k: Int) -> Int {
//      var result = 1
//        for i in 0..<k {
//            result *= n - i
//            result /= i + 1
//        }
//        return result
//    }
//    
//    func climbStairs(_ n: Int) -> Int {
//        var low = 0
//        var high = n
//        var result = 0
//        while high >= low {
//            result += quickBinomialCoefficient(high, choose: low)
//            high -= 1
//            low += 1
//        }
//                
//        return result
//    }
//}

// Brute force
//class Solution {
//    
//    private func climbStairs(_ i: Int, _ n: Int) -> Int {
//        if i > n {return 0}
//        if i == n {return 1}
//        return climbStairs(i+1,n) + climbStairs(i+2,n)
//    }
//
//    func climbStairs(_ n: Int) -> Int {
//        return climbStairs(0,n)
//    }
//}

// Brute force with memoization
//class Solution {
//    
//    var memory: [[Int:Int] : Int] = [:]
//    
//    private func climbStairs(_ i: Int, _ n: Int) -> Int {
//        if i > n {return 0}
//        if i == n {return 1}
//        
//        if let result = memory[[i:n]] {
//            return result
//        } else {
//            memory[[i:n]] = climbStairs(i+1,n) + climbStairs(i+2,n)
//            return climbStairs(i+1,n) + climbStairs(i+2,n)
//        }
//
//    }
//
//    func climbStairs(_ n: Int) -> Int {
//        return climbStairs(0,n)
//    }
//}

// Dynamic programming approach
class Solution {
    
    func climbStairs(_ n: Int) -> Int {
        var dp: [Int] = [Int].init(repeating: 0, count: n+1)
        dp[1]=1
        dp[2]=2
        if n > 2{
            for i in 3...n {
                dp[i] = dp[i-1] + dp[i-2]
            }
        }
        return dp[n]
    }
}


let solution = Solution()
print(solution.climbStairs(2))




