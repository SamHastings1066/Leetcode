// Brute force
//class Solution {
//    func candy(_ ratings: [Int]) -> Int {
//        let n = ratings.count
//        var candies = Array(repeating: 1, count: n)
//        var maxRating = 0
//        for rating in ratings {
//            maxRating = max(maxRating, rating)
//        }
//        for _ in 0..<maxRating {
//            for i in 0..<n {
//                // check right
//                if i < n-1 {
//                    if ratings[i] > ratings[i+1] && candies[i] <= candies[i+1] {
//                        candies[i] = candies[i+1] + 1
//                    }
//                }
//                // check left
//                if i > 0 {
//                    if ratings[i] > ratings[i-1] && candies[i] <= candies[i-1] {
//                        candies[i] = candies[i-1] + 1
//                    }
//                }
//            }
//        }
//        return candies.reduce(0, +)
//    }
//}

// Single array
class Solution {
    func candy(_ ratings: [Int]) -> Int {
        let n = ratings.count
        var candies = Array(repeating: 1, count: n)
        
        for i in 1..<n {
            if ratings[i] > ratings[i-1] {
                candies[i] = candies[i-1] + 1
            }
        }
        
        for i in (0..<n-1).reversed() {
            if ratings[i] > ratings[i+1] {
                candies[i] = max(candies[i], candies[i+1]+1)
            }
        }
        
        return candies.reduce(0, +)
    }
}

var ratings  = [1,0,2]
print(Solution().candy(ratings))

