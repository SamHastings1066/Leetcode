// My first attempt - messy but works!
//class Solution {
//    func findMinArrowShots(_ points: [[Int]]) -> Int {
//        var sortedPoints = points.sorted(by: {
//            if $0[0] == $1[0] {
//                $0[1] < $1[1]
//            } else {
//                $0[0] < $1[0]
//            }
//        })
//        print(sortedPoints)
//        var ans = 0
//        var i = 0
//        while i < points.count  {
//            ans+=1
//            var right = sortedPoints[i][1]
//            i+=1
//            
//            while i < points.count, sortedPoints[i][0] <= right {
//                right = min(right, sortedPoints[i][1])
//                i+=1
//                
//            }
//        }
//        return ans
//    }
//}


// Slight adjustment
//class Solution {
//    func findMinArrowShots(_ points: [[Int]]) -> Int {
//        var sortedPoints = points.sorted(by: { $0[1] < $1[1] })
//        var ans = 0
//        var i = 0
//        while i < points.count  {
//            ans+=1
//            var right = sortedPoints[i][1]
//            i+=1
//
//            while i < points.count, sortedPoints[i][0] <= right {
//                i+=1
//            }
//        }
//        return ans
//    }
//}

// Cleanest
// My first attempt - messy but works!
class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        var sortedPoints = points.sorted(by: { $0[1] < $1[1] })
        var ans = 1
        var firstEnd = sortedPoints[0][1]
        for balloon in sortedPoints[1..<sortedPoints.count] {
            if balloon[0] > firstEnd {
                firstEnd = balloon[1]
                ans+=1
            }
        }
        return ans
    }
}

var points = [[9,12],[1,10],[4,11],[8,12],[3,9],[6,9],[6,7]]

print(Solution().findMinArrowShots(points))
