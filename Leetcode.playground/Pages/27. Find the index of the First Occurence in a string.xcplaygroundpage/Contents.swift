class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count >= needle.count else {return -1}
        var result = 0
        for index in 0...haystack.count - needle.count {
            
            let range = haystack.index(haystack.startIndex, offsetBy: index)..<haystack.index(haystack.startIndex, offsetBy: index + needle.count)
            if haystack[range] == needle {
                return result
            }
            result += 1
        }
        return -1
    }
}

// Swifty solution
//class Solution {
//    func strStr(_ haystack: String, _ needle: String) -> Int {
//        guard !needle.isEmpty else {return 0}
//        if let rng = haystack.range(of: needle) {
//
//        }
//    }
//}



//let haystack = "sadbutsad"; let needle = "sad"
//let haystack = "leetcode"; let needle = "leeto"
let haystack = "aaa"; let needle = "aaaa"


let solution = Solution()

print(solution.strStr(haystack, needle))
