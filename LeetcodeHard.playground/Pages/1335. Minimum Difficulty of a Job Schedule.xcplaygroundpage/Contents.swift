class Solution {
    func minDifficulty(_ jobDifficulty: [Int], _ d: Int) -> Int {
        let n = jobDifficulty.count
        if d>n {return -1}
        var memo = Array(repeating: Array(repeating: -1, count: d+1), count:n)
        func dp(_ i: Int, _ day: Int) -> Int {
            if day == d {
                return hardestJobRemaining[i]
            }
            var best = Int.max
            var hardest = 0
            if memo[i][day] == -1 {
                for j in i..<n-d+day {
                    hardest = max(hardest, jobDifficulty[j])
                    best = min(best, hardest + dp(j+1, day+1))
                }
                memo[i][day] = best
            }
            return memo[i][day]
        }

        var hardestJobRemaining = Array(repeating: 0, count: n)
        hardestJobRemaining[n - 1] = jobDifficulty[n - 1]
        for i in (0..<n-1).reversed() {
            hardestJobRemaining[i] = max(jobDifficulty[i], hardestJobRemaining[i + 1])
        }
        return dp(0,1)
    }
}
