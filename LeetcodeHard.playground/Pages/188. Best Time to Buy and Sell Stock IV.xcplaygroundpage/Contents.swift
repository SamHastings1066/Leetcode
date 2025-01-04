/*
DP solution
 Time: O(k * prices.count) - because we are solving k * prices.count * 2 subproblems, each one in O(1) time
 Space: O(k * prices.count) - because we use k * prices.count 
state variables
- day: what day you are on 0...prices.count-1
- holding: whether you are holding a stock (true-1/false-0)
- remaning: number of transactions remaining 0...k, N.B. this only decremented after a sale
memo[day][holding][remaining]
*/
class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        var memo = Array(repeating: Array(repeating: Array(repeating: -1, count: k+1), count: 2), count: n)
        return dp(0,0,k)

        func dp(_ day: Int, _ holding: Int, _ remaining: Int) -> Int {
            if day == n || remaining == 0 { return 0 }
            if memo[day][holding][remaining] == -1 {
                var ans = dp(day+1,holding, remaining) // i.e. you choose to do nothing on teh current day
                if holding == 0 { // you can only buy
                    ans = max(ans, dp(day+1, 1, remaining) - prices[day])
                } else { // you can only sell
                    ans = max(ans, dp(day+1, 0, remaining - 1) + prices[day])
                }
                memo[day][holding][remaining] = ans
            }
            return memo[day][holding][remaining]
        }

    }
}
