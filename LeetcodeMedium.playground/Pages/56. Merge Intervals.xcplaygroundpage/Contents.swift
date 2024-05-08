class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var sortedIntervals = intervals.sorted{ $0[0]<$1[0] }
        var result = [sortedIntervals[0]]
        for interval in sortedIntervals.dropFirst() {
            guard let last = result.last else { continue }
            if last[1] >= interval[0] {
                result[result.count-1][1] = max(last[1], interval[1])
            } else {
                result.append(interval)
            }
        }
        return result
    }
}

var intervals = [[1,4],[0,1]]

print(Solution().merge(intervals))


