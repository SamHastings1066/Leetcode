class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var memo = Array(repeating: -1, count: amount + 1)
        let result = dp(amount)
        return result == Int.max ? -1 : result
        
        func dp(_ a: Int) -> Int {
            if a == 0 { return 0 } // Base case: no amount left to make
            if a < 0 { return Int.max } // Invalid case: impossible to form negative amount
            
            if memo[a] == -1 {
                var minCoins = Int.max
                for coin in coins {
                    let subResult = dp(a - coin)
                    if subResult != Int.max { // Avoid overflow when adding 1 to Int.max
                        minCoins = min(minCoins, subResult + 1)
                    }
                }
                memo[a] = minCoins
            }
            
            return memo[a]
        }
    }
}
