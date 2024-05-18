// Simple recursion
//class Solution {
//    func minDistance(_ word1: String, _ word2: String) -> Int {
//        var word1 = Array(word1)
//        var word2 = Array(word2)
//        return minDistanceRecursion(word1.count, word2.count)
//        
//        func minDistanceRecursion(_ word1Index: Int, _ word2Index: Int) -> Int {
//            if word1Index == 0 {
//                return word2Index
//            }
//            if word2Index == 0 {
//                return word1Index
//            }
//            if word1[word1Index-1] == word2[word2Index-1] {
//                return minDistanceRecursion(word1Index-1, word2Index-1)
//            }
//            return [
//                minDistanceRecursion(word1Index-1, word2Index),
//                minDistanceRecursion(word1Index, word2Index-1),
//                minDistanceRecursion(word1Index-1, word2Index-1)
//            ].min()! + 1
//        }
//    }
//}

// Dynamic programming with memoization:
//class Solution {
//    func minDistance(_ word1: String, _ word2: String) -> Int {
//        var word1 = Array(word1)
//        var word2 = Array(word2)
//        var memo: [[Int?]] = Array(repeating: Array(repeating: nil, count: word2.count + 1), count: word1.count + 1)
//        return minDistanceRecursion(word1.count, word2.count)
//        
//        func minDistanceRecursion(_ word1Index: Int, _ word2Index: Int) -> Int {
//            if word1Index == 0 {
//                return word2Index
//            }
//            if word2Index == 0 {
//                return word1Index
//            }
//            if let res = memo[word1Index][word2Index] { return res }
//            var minDist = 0
//            if word1[word1Index-1] == word2[word2Index-1] {
//                minDist = minDistanceRecursion(word1Index-1, word2Index-1)
//            } else {
//                minDist = [
//                    minDistanceRecursion(word1Index-1, word2Index),
//                    minDistanceRecursion(word1Index, word2Index-1),
//                    minDistanceRecursion(word1Index-1, word2Index-1)
//                ].min()! + 1
//            }
//            memo[word1Index][word2Index] = minDist
//            return minDist
//        }
//    }
//}

// Dynamic programming with tabulation:
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var word1 = Array(word1)
        var word2 = Array(word2)
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)
        
        if word1.count == 0 { return word2.count}
        if word2.count == 0 { return word1.count}
        
        for word1Index in 0...word1.count {
            dp[word1Index][0] = word1Index
        }
        
        for word2Index in 0...word2.count {
            dp[0][word2Index] = word2Index
        }
        for word1Index in 1...word1.count {
            for word2Index in 1...word2.count {
                 if word1[word1Index-1] == word2[word2Index-1] {
                    dp[word1Index][word2Index] = dp[word1Index-1][word2Index-1]
                } else {
                    dp[word1Index][word2Index] = [
                        dp[word1Index-1][word2Index-1],
                        dp[word1Index-1][word2Index],
                        dp[word1Index][word2Index-1]
                    ].min()! + 1
                }
            }
        }
        
        return dp[word1.count][word2.count]
    }
}



var word1 = ""
var word2 = ""

print(Solution().minDistance(word1, word2))
