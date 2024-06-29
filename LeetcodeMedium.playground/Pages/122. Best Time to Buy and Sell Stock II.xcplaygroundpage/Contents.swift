class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var prices = prices
        var lastPrice = prices.removeFirst()
        var profit = 0
        for price in prices {
            if lastPrice < price {
                profit += price - lastPrice
            }
            lastPrice = price
        }
        return profit
    }
}


var prices = [7,1,5,3,6,4]
print(Solution().maxProfit(prices))
