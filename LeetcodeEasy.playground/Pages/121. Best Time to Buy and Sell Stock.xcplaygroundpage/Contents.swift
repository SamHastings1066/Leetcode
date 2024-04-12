class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var min = prices[0]
        var max = prices[0]
        var result = 0
        for i in 1..<prices.count {
            if prices[i] < min {
                min = prices[i]
                max = prices[i]
            } else {
                if prices[i] > max {
                    max = prices[i]
                }
            }
            if result < max - min {
                result = max - min
            }
        }
        return result
    }
}

let prices = [7,1,5,3,6,4]

let solution = Solution()

print(solution.maxProfit(prices))
