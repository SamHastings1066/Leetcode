// Top down: recursive with memoization.
// Time: O(amount * #coins), Space: O(amount)
//class Solution {
//    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
//        var memo = Array(repeating: -1, count: amount + 1)
//        let result = dp(amount)
//        return result == Int.max ? -1 : result
//        
//        func dp(_ a: Int) -> Int {
//            if a == 0 { return 0 } // Base case: no amount left to make
//            if a < 0 { return Int.max } // Invalid case: impossible to form negative amount
//            
//            if memo[a] == -1 {
//                var minCoins = Int.max
//                for coin in coins {
//                    let subResult = dp(a - coin)
//                    if subResult != Int.max { // Avoid overflow when adding 1 to Int.max
//                        minCoins = min(minCoins, subResult + 1)
//                    }
//                }
//                memo[a] = minCoins
//            }
//            
//            return memo[a]
//        }
//    }
//}

// Bottom up: Iterative with array.
// Time: O(amount * #coins), Space: O(amount)
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0}
        let max = amount + 1
        var dp = Array(repeating: max, count: amount + 1)
        dp[0] = 0
        
        for i in 1...amount {
            for coin in coins {
                if coin <= i {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        return dp[amount] == max ? -1 : dp[amount]
    }
}
