// Interative
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        if intervals.isEmpty {
            return [newInterval]
        }
        var new = newInterval
        var res = [[Int]]()
        var i = 0
        let n = intervals.count
        while i<n, intervals[i][1]<new[0] {
            res.append(intervals[i])
            i+=1
        }
        print(res)
        while i<n, intervals[i][0]<=new[1] {
            new = [min(new[0], intervals[i][0]), max(new[1], intervals[i][1])]
            i+=1
        }
        res.append(new)
        print(res)
        while i<n {
            res.append(intervals[i])
            i+=1
        }
        return res
    }
}

let intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]]
let newInterval = [4,8]


print(Solution().insert(intervals, newInterval))

