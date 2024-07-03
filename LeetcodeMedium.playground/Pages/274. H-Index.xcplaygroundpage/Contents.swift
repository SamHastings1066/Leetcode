// Sorting highest to lower
//class Solution {
//    func hIndex(_ citations: [Int]) -> Int {
//        var citations = citations.sorted{$0>$1}
//        var i = 0
//        while i < citations.count && i<citations[i] {
//            i += 1
//        }
//        return i
//    }
//}

// Counting
class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        var n = citations.count
        var papers = Array(repeating: 0, count: n+1)
        for citation in citations {
            papers[min(citation,n)] += 1
        }
        var k = n
        var s = 0
        while k>=0 {
            s += papers[k]
            if k<=s {break}
            k-=1
        }
        return k
    }
}

var citations = [11,15,0]

print(Solution().hIndex(citations))
